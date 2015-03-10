# General parameters
default[:mo_server_base][:packages] = %w(atsar vim locate apt-utils bsdutils unattended-upgrades)

# Timezone configuration.
default[:mo_server_base][:timezone] = "America/Argentina/Buenos_Aires"

# NTP specific
default[:mo_server_base][:ntp][:enabled] = true
default[:mo_server_base][:ntp][:servers] = %w(ntp.desarrollo.unlp.edu.ar)
default[:mo_server_base][:ntp][:apparmor_enabled] = false

# Ubuntu mirror configuration.
default[:mo_server_base][:mirror][:enabled] = true
default[:mo_server_base][:mirror][:archive_url] = "http://mirror.unlp.edu.ar/ubuntu/"
default[:mo_server_base][:mirror][:archive_url_src] = "http://ar.archive.ubuntu.com/ubuntu/"
default[:mo_server_base][:mirror][:security_url] = "http://mirror.unlp.edu.ar/ubuntu/"
default[:mo_server_base][:mirror][:security_url_src] = "http://security.ubuntu.com/ubuntu/"

# Users configuration.
default[:mo_server_base][:authorization][:superadmin_group] = "sysadmin"

# Sudoers configuration.
default[:mo_server_base][:authorization][:sudo][:passwordless] = true
default[:mo_server_base][:authorization][:sudo][:include_sudoers_d] = true

# Rsyslog configuration.
default[:mo_server_base][:rsyslog][:enabled] = true
default[:mo_server_base][:rsyslog][:repeated_msg_reduction] = "off"

default['apt']['unattended_upgrades']['enabled'] = true

# Postfix configuration.
default[:mo_server_base][:postfix][:enabled] = true
default[:mo_server_base][:mail][:databag] = "mailers"
default[:mo_server_base][:mail][:mail_id] = "mail_desarrollo"
default['postfix']['mail_type'] = "client"
default['postfix']['main']['mydomain'] = "example.com"
default['postfix']['main']['myorigin'] = "$myhostname"
default['postfix']['main']['relayhost'] = "smtp.example.com"
default['postfix']['main']['smtp_sasl_auth_enable'] = "yes"
default['postfix']['sasl']['smtp_sasl_user_name'] = "username"
default['postfix']['sasl']['smtp_sasl_passwd'] = "password"
