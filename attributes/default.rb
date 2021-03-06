# General parameters
default['mo_server_base']['packages'] = %w(atsar vim locate apt-utils bsdutils htop tmux rsync iotop telnet tcpdump strace sysstat ngrep)

# Timezone configuration.
default['mo_server_base']['timezone'] = 'America/Argentina/Buenos_Aires'

# NTP specific
default['mo_server_base']['ntp']['enabled'] = true
default['mo_server_base']['ntp']['servers'] = %w(ntp.desarrollo.unlp.edu.ar)
default['mo_server_base']['ntp']['apparmor_enabled'] = false

# Do an apt-get upgrade the first time this cookbook is run.
default['mo_server_base']['apt']['first_upgrade'] = true

# Ubuntu mirror configuration.
default['mo_server_base']['mirror']['enabled'] = true
default['mo_server_base']['mirror']['archive_url'] = 'http://mirror.unlp.edu.ar/ubuntu/'
default['mo_server_base']['mirror']['archive_url_src'] = 'http://ar.archive.ubuntu.com/ubuntu/'
default['mo_server_base']['mirror']['security_url'] = 'http://mirror.unlp.edu.ar/ubuntu/'
default['mo_server_base']['mirror']['security_url_src'] = 'http://security.ubuntu.com/ubuntu/'

# Users configuration.
default['mo_server_base']['authorization']['superadmin_group'] = 'sysadmin'
# This group should be used to add additional users to sudoers.
default['mo_server_base']['authorization']['additional_superadmin_group'] = nil

# Sudoers configuration.
default['mo_server_base']['authorization']['sudo']['passwordless'] = true
default['mo_server_base']['authorization']['sudo']['include_sudoers_d'] = true

# Rsyslog configuration.
default['mo_server_base']['rsyslog']['enabled'] = true
default['mo_server_base']['rsyslog']['repeated_msg_reduction'] = 'off'
default['mo_server_base']['rsyslog']['preserve_fqdn'] = 'on'
default['mo_server_base']['rsyslog']['client'] = false

# Logwatch settings.
default['mo_server_base']['logwatch']['enabled'] = true
default['logwatch']['format'] = 'html'

# Postfix configuration.
default['mo_server_base']['postfix']['enabled'] = false
default['mo_server_base']['mail']['databag'] = 'mailers'
default['mo_server_base']['mail']['mail_id'] = 'mail_desarrollo'
default['postfix']['mail_type'] = 'client'
default['postfix']['main']['mydomain'] = 'example.com'
default['postfix']['main']['myorigin'] = '$myhostname'
default['postfix']['main']['relayhost'] = 'smtp.example.com'
default['postfix']['main']['smtp_sasl_auth_enable'] = 'no'
default['postfix']['sasl']['smtp_sasl_user_name'] = 'username'
default['postfix']['sasl']['smtp_sasl_passwd'] = 'password'
default['postfix']['main']['smtpd_use_tls'] = false


# Unattended upgrades.
default['apt']['unattended_upgrades']['enable'] = true
default['apt']['unattended_upgrades']['update_package_lists'] = true
default['apt']['unattended_upgrades']['allowed_origins'] = [
  '${distro_id} ${distro_codename}-security'
]
default['apt']['unattended_upgrades']['package_blacklist'] = %w()
default['apt']['unattended_upgrades']['mail'] = 'root@localhost'
default['apt']['unattended_upgrades']['mail_only_on_error'] = false
default['apt']['unattended_upgrades']['remove_unused_dependencies'] = true

# Monitoring.
default['mo_server_base']['monitoring']['enabled'] = true

# Disable setting up dns from attributes
default['mo_server_base']['resolver']['enabled'] = false

default['mo_server_base']['hostname']['enabled'] = true
