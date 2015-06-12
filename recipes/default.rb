include_recipe 'chef-sugar::default'
include_recipe 'mo_server_base::mirror' if ubuntu? && node['mo_server_base']['mirror']['enabled']

include_recipe 'apt::default'
include_recipe 'apt::unattended-upgrades'

execute 'apt-upgrade' do
  command <<-CMD
    unset UCF_FORCE_CONFFOLD
    export UCF_FORCE_CONFFNEW=YES
    ucf --purge /boot/grub/menu.lst

    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get -o Dpkg::Options::="--force-confdef" --force-yes -fuy upgrade
  CMD
  action :nothing
end

file '/root/.apt-upgrade-once' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :run, 'execute[apt-upgrade]', :immediately
  only_if { node['mo_server_base']['apt']['first_upgrade'] }
end

# Install base packages.
node['mo_server_base']['packages'].each do |p|
  package p
end

# Configures localtime.
link '/etc/localtime' do
  to "/usr/share/zoneinfo/#{node['mo_server_base']['timezone']}"
end

# Create users.
include_recipe 'mo_server_base::user'

# Executes every other recipe if enabled.
include_recipe 'mo_server_base::ntp'     if node['mo_server_base']['ntp']['enabled']
include_recipe 'mo_server_base::rsyslog' if node['mo_server_base']['rsyslog']['repeated_msg_reduction']
include_recipe 'hostname::default'       if node['mo_server_base']['hostname']['enabled']
include_recipe 'resolver::default'       if node['mo_server_base']['resolver']['enabled']
include_recipe 'logwatch::default'       if node['mo_server_base']['logwatch']['enabled']
include_recipe 'locales::default'
include_recipe 'locale::default'

include_recipe 'mo_server_base::postfix' if node['mo_server_base']['postfix']['enabled']

include_recipe 'mo_monitoring_client'    if node['mo_server_base']['monitoring']['enabled']
