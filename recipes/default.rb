include_recipe "chef-sugar::default"
include_recipe "proxmox-ohai"
include_recipe "mo_server_base::mirror" if ubuntu? && node.mo_server_base.mirror.enabled

include_recipe "apt::default"

# Install base packages.
node[:mo_server_base][:packages].each do |p|
  package p
end

# Configures localtime.
# Refactor this to support different OS and to execute only when necessary.
execute 'timezone' do
  command "ln -f -s /usr/share/zoneinfo/#{node[:mo_server_base][:timezone]} /etc/localtime"
#  not_if
end

# Create users.
include_recipe "mo_server_base::user"

# Executes every other recipe if enabled.
include_recipe "mo_server_base::ntp" if node.mo_server_base.ntp.enabled
include_recipe "mo_server_base::rsyslog" if node.mo_server_base.rsyslog.repeated_msg_reduction
