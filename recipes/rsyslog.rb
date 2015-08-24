include_recipe 'chef-sugar::default'
node.override['rsyslog']['repeated_msg_reduction'] = node['mo_server_base']['rsyslog']['repeated_msg_reduction']
node.override['rsyslog']['preserve_fqdn'] = node['mo_server_base']['rsyslog']['preserve_fqdn']
if node['virtualization']['system'] == 'openvz'
  node.override['rsyslog']['modules'] = Array(node['rsyslog']['modules']) - ['imklog']
end

if debian? 
  apt_repository 'rsyslog_debian' do
    uri "http://debian.adiscon.com/v8-stable"
    distribution "#{node['lsb']['codename']}/"
    key 'AEF0CF8E'
    keyserver 'keys.gnupg.net'
    deb_src true
  end

  package "rsyslog" do
    action :upgrade
    only_if <<-SCRIPT
    SYSLOG=`which rsyslogd`
    if [ ! -z "$SYSLOG" ]; then
      [ `$SYSLOG -v | grep ^rsyslo | cut -d. -f 1 | cut -d' ' -f2` -le 5 ] && exit 0
    fi
    exit 1
    SCRIPT
  end
end

if node['mo_server_base']['rsyslog']['client']
  include_recipe 'rsyslog::client'
else
  include_recipe 'rsyslog'
end
