#
# (c) 2016 Red Hat Inc.
#
# This file is part of Ansible
#
# Ansible is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ansible is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ansible.  If not, see <http://www.gnu.org/licenses/>.
#

from __future__ import absolute_import, division, print_function


__metaclass__ = type

import json
import re

from ansible.errors import AnsibleConnectionFailure
from ansible.module_utils._text import to_bytes, to_text
from ansible_collections.ansible.netcommon.plugins.plugin_utils.terminal_base import TerminalBase


class TerminalModule(TerminalBase):
    terminal_stdout_re = [
        re.compile(rb"[\r\n]?[\w+\-\.:\/\[\]]+(?:\([^\)]+\)){,3}(?:>|#) ?$"),
        re.compile(rb"\[\w+\@[\w\-\.]+(?: [^\]])\] ?[>#\$] ?$"),
    ]

    terminal_stderr_re = [
        re.compile(rb"% ?Error"),
        # re.compile(br"^% \w+", re.M),
        re.compile(rb"% User not present"),
        re.compile(rb"% ?Bad secret"),
        re.compile(rb"invalid input", re.I),
        re.compile(rb"(?:incomplete|ambiguous) command", re.I),
        re.compile(rb"connection timed out", re.I),
        # Strings like this regarding VLANs are not errors
        re.compile(rb"[^\r\n]+ not found(?! in current VLAN)", re.I),
        re.compile(rb"'[^']' +returned error code: ?\d+"),
        re.compile(rb"[^\r\n](?<! shell )\/bin\/(?:ba)?sh"),
        re.compile(rb"% More than \d+ OSPF instance", re.I),
        re.compile(rb"% Subnet [0-9a-f.:/]+ overlaps", re.I),
        re.compile(rb"Maximum number of pending sessions has been reached"),
        re.compile(rb"% Prefix length must be less than"),
        # returned in response to 'channel-group <name> mode <mode>'
        re.compile(
            rb"% Cannot change mode; remove all members and try again.",
        ),
    ]

    terminal_config_prompt = re.compile(r"^.+\(config(-.*)?\)#$")

    def on_open_shell(self):
        try:
            for cmd in (b"terminal length 0", b"terminal width 512"):
                self._exec_cli_command(cmd)
        except AnsibleConnectionFailure:
            raise AnsibleConnectionFailure("unable to set terminal parameters")

    def on_become(self, passwd=None):
        if self._get_prompt().endswith(b"#"):
            return

        cmd = {"command": "enable"}
        if passwd:
            cmd["prompt"] = to_text(
                r"[\r\n]?[Pp]assword: $",
                errors="surrogate_or_strict",
            )
            cmd["answer"] = passwd
            cmd["prompt_retry_check"] = True

        try:
            self._exec_cli_command(
                to_bytes(json.dumps(cmd), errors="surrogate_or_strict"),
            )
            prompt = self._get_prompt()
            if prompt is None or not prompt.endswith(b"#"):
                raise AnsibleConnectionFailure(
                    "failed to elevate privilege to enable mode still at prompt [%s]" % prompt,
                )
        except AnsibleConnectionFailure as e:
            prompt = self._get_prompt()
            raise AnsibleConnectionFailure(
                "unable to elevate privilege to enable mode, at prompt [%s] with error: %s"
                % (prompt, e.message),
            )

    def on_unbecome(self):
        prompt = self._get_prompt()
        if prompt is None:
            # if prompt is None most likely the terminal is hung up at a prompt
            return

        if b"(config" in prompt:
            self._exec_cli_command(b"end")
            self._exec_cli_command(b"disable")

        elif prompt.endswith(b"#"):
            self._exec_cli_command(b"disable")
