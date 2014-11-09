node.override[:ntp][:servers] = node[:mo_server_base][:ntp][:servers]
node.override[:ntp][:apparmor_enabled] = node[:mo_server_base][:ntp][:apparmor_enabled]
include_recipe "ntp::default"
