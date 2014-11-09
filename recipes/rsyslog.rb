node.override['rsyslog']['repeated_msg_reduction'] = node[:mo_server_base][:rsyslog][:repeated_msg_reduction]
include_recipe "rsyslog"
