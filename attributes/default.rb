# General parameters
default[:mo_server_base][:packages] = %w(atsar vim locate apt-utils bsdutils htop tmux)

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

# Postfix configuration.
default[:mo_server_base][:postfix][:enabled] = false
default[:mo_server_base][:mail][:databag] = "mailers"
default[:mo_server_base][:mail][:mail_id] = "mail_desarrollo"
default['postfix']['mail_type'] = "client"
default['postfix']['main']['mydomain'] = "example.com"
default['postfix']['main']['myorigin'] = "$myhostname"
default['postfix']['main']['relayhost'] = "smtp.example.com"
default['postfix']['main']['smtp_sasl_auth_enable'] = "yes"
default['postfix']['sasl']['smtp_sasl_user_name'] = "username"
default['postfix']['sasl']['smtp_sasl_passwd'] = "password"


# Unattended upgrades.
default['apt']['unattended_upgrades']['enabled'] = true
default['apt']['unattended_upgrades']['update_package_lists'] = true
default['apt']['unattended_upgrades']['allowed_origins'] = [
  "${distro_id} ${distro_codename}-security"
]
default['apt']['unattended_upgrades']['package_blacklist'] = %w(libc-bin libc6 libc6-dev libc6-i686 libc-dev-bin libc6-i386 imagemagick libmagickcore-dev nodejs npm libffi-dev libreadline6-dev zlib1g-dev libssl-dev bison libxml2-dev libxslt-dev libmysqlclient-dev mysql-client libmagickwand-dev)
default['apt']['unattended_upgrades']['mail'] = "root@localhost"
default['apt']['unattended_upgrades']['mail_only_on_error'] = false
default['apt']['unattended_upgrades']['remove_unused_dependencies'] = true
