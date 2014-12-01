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

