include_recipe "chef-sugar::default"
include_recipe "mo_server_base::mirror" if ubuntu? && node.mo_server_base.mirror.enabled


include_recipe "apt::default"
include_recipe "apt::unattended-upgrades"

# Install base packages.
node[:mo_server_base][:packages].each do |p|
  package p
end

# Configures localtime.
link "/etc/localtime" do
  to "/usr/share/zoneinfo/#{node[:mo_server_base][:timezone]}"
end

# Create users.
include_recipe "mo_server_base::user"

# Executes every other recipe if enabled.
include_recipe "mo_server_base::ntp" if node.mo_server_base.ntp.enabled
include_recipe "mo_server_base::rsyslog" if node.mo_server_base.rsyslog.repeated_msg_reduction
include_recipe "hostname::default"
include_recipe "resolver::default"
