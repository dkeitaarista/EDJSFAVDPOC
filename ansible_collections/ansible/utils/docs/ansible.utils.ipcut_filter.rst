.. _ansible.utils.ipcut_filter:


*******************
ansible.utils.ipcut
*******************

**This filter is designed to get 1st or last few bits of IP address.**


Version added: 2.11.0

.. contents::
   :local:
   :depth: 1


Synopsis
--------
- This filter is designed to fetch 1st or last few bits of Ip address.




Parameters
----------

.. raw:: html

    <table  border=0 cellpadding=0 class="documentation-table">
        <tr>
            <th colspan="1">Parameter</th>
            <th>Choices/<font color="blue">Defaults</font></th>
                <th>Configuration</th>
            <th width="100%">Comments</th>
        </tr>
            <tr>
                <td colspan="1">
                    <div class="ansibleOptionAnchor" id="parameter-"></div>
                    <b>amount</b>
                    <a class="ansibleOptionLink" href="#parameter-" title="Permalink to this option"></a>
                    <div style="font-size: small">
                        <span style="color: purple">integer</span>
                    </div>
                </td>
                <td>
                </td>
                    <td>
                    </td>
                <td>
                        <div>integer for arithmetic. Example -1,2,3</div>
                </td>
            </tr>
            <tr>
                <td colspan="1">
                    <div class="ansibleOptionAnchor" id="parameter-"></div>
                    <b>value</b>
                    <a class="ansibleOptionLink" href="#parameter-" title="Permalink to this option"></a>
                    <div style="font-size: small">
                        <span style="color: purple">string</span>
                         / <span style="color: red">required</span>
                    </div>
                </td>
                <td>
                </td>
                    <td>
                    </td>
                <td>
                        <div>list of subnets or individual address or any other values input for ip_cut plugin</div>
                </td>
            </tr>
    </table>
    <br/>




Examples
--------

.. code-block:: yaml

    #### examples
    - name: Get first 64 bits of Ipv6 address
      debug:
        msg: "{{ '1234:4321:abcd:dcba::17' | ansible.utils.ipcut(64) }}"

    - name: Get last 80 bits of Ipv6 address
      debug:
        msg: "{{ '1234:4321:abcd:dcba::17' | ansible.utils.ipcut(-80) }}"
    # PLAY [IPCUT filter plugin examples] ************************************************************************************************

    # TASK [Get first X bits of Ipv6 address] ********************************************************************************************
    # ok: [localhost] => {
    #     "msg": "1234:4321:abcd:dcba"
    # }

    # TASK [Get last X bits of Ipv6 address] *********************************************************************************************
    # ok: [localhost] => {
    #     "msg": "dcba:0:0:0:17"
    # }

    # PLAY RECAP *************************************************************************************************************************
    # localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0



Return Values
-------------
Common return values are documented `here <https://docs.ansible.com/ansible/latest/reference_appendices/common_return_values.html#common-return-values>`_, the following are the fields unique to this filter:

.. raw:: html

    <table border=0 cellpadding=0 class="documentation-table">
        <tr>
            <th colspan="1">Key</th>
            <th>Returned</th>
            <th width="100%">Description</th>
        </tr>
            <tr>
                <td colspan="1">
                    <div class="ansibleOptionAnchor" id="return-"></div>
                    <b>data</b>
                    <a class="ansibleOptionLink" href="#return-" title="Permalink to this return value"></a>
                    <div style="font-size: small">
                      <span style="color: purple">string</span>
                    </div>
                </td>
                <td></td>
                <td>
                            <div>Returns result of portion of IP.</div>
                    <br/>
                </td>
            </tr>
    </table>
    <br/><br/>


Status
------


Authors
~~~~~~~

- Ashwini Mhatre (@amhatre)


.. hint::
    Configuration entries for each entry type have a low to high priority order. For example, a variable that is lower in the list will override a variable that is higher up.
