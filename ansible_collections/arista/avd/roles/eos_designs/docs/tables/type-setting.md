<!--
  ~ Copyright (c) 2023 Arista Networks, Inc.
  ~ Use of this source code is governed by the Apache License 2.0
  ~ that can be found in the LICENSE file.
  -->
=== "Table"

    | Variable | Type | Required | Default | Value Restrictions | Description |
    | -------- | ---- | -------- | ------- | ------------------ | ----------- |
    | [<samp>type</samp>](## "type") | String |  |  | Valid Values:<br>- <value(s) of node_type_keys.type> | The `type:` variable needs to be defined for each device in the fabric.<br>This is leveraged to load the appropriate template to generate the configuration. |

=== "YAML"

    ```yaml
    type: <str>
    ```
