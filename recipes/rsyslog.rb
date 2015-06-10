node.override['rsyslog']['repeated_msg_reduction'] = node['mo_server_base']['rsyslog']['repeated_msg_reduction']
if node['virtualization']['system'] == 'openvz'
  node.override['rsyslog']['modules'] = Array(node['rsyslog']['modules']) - ['imklog']
end
include_recipe 'rsyslog'
