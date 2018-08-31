[![Build Status](https://travis-ci.com/mediapeers/ansible-role-telegraf.svg?branch=master)](https://travis-ci.com/mediapeers/ansible-role-telegraf)

# Ansible role for Telegraf

An Ansible role to install, configure, and manage [Telegraf](https://github.com/influxdb/telegraf), the plugin-driven server agent for reporting metrics into InfluxDB.

Note: this is a fork of https://github.com/rossmcdonald/telegraf

## Requirements

Linux server (Debian/RedHat based), place to send the events too.
Prior knowledge/experience with InfluxDB and Telegraf is highly recommended. See output plugins [here](https://github.com/influxdata/telegraf#output-plugins).

## Role Variables

The high-level variables are stored in the `defaults/main.yml` file. The most important ones being:

- `telegraf_output_plugins` - A list of dictionaries to configure your ouput plugins, for instance to influxdb or other destinations.
- `telegraf_input_plugins` - A list dictionaries to configure the metrics you want to collect. Either system metrics from the host the agent runs on or metrics of some services, DBs etc.

For more params see `defaults/main.yml`.

More advanced configuration options are stored in the `vars/main.yml` file, which includes all of the necessary bells and whistles to tweak your configuration.

## Dependencies

No other Ansible dependencies are required. This role was tested and developed with Ansible 1.9.4.

## Example Playbook

Example playbook using this role:

    - name: My Play with Telegraf
      hosts: servers
      vars:
        telegraf_output_plugins:
          - name: instrumental
            options:
              api_token: "abc-1234"
              prefix: ""
              template: "measurement.host.system_measurement_tag.tags.field"
              timeout: "2s"
              debug: false
        telegraf_input_plugins:
          - name: cpu
            options:
              key: "value"
            tags:
              key: "value"
            tagdrop:
              key: "value"
            tagpass:
              key: "value"
      roles:
         - mediapeers.telegraf


## License

MIT

## Author

Created by [Ross McDonald](https://github.com/rossmcdonald).

