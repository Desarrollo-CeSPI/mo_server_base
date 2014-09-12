node.override[:ntp][:servers] = node[:cespi_server_base][:ntp][:servers]
node.override[:ntp][:apparmor_enabled] = node[:cespi_server_base][:ntp][:apparmor_enabled]
include_recipe "ntp::default"
