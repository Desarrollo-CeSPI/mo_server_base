include_recipe "cespi_server_base::mirror" if node.cespi_server_base.mirror.enabled

include_recipe "apt::default"

# Install base packages.
node[:cespi_server_base][:packages].each do |p|
  package p
end

# Configures localtime.
# Refactor this to support different OS and to execute only when necessary.
execute 'timezone' do
  command "ln -f -s /usr/share/zoneinfo/#{node[:cespi_server_base][:timezone]} /etc/localtime"
#  not_if
end

# Create users.
include_recipe "cespi_server_base::user"

# Executes every other recipe if enabled.
include_recipe "cespi_server_base::ntp" if node.cespi_server_base.ntp.enabled
include_recipe "cespi_server_base::rsyslog" if node.cespi_server_base.rsyslog.repeated_msg_reduction
