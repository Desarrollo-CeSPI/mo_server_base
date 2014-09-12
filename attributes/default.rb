# General parameters
default[:cespi_server_base][:packages] = %w(atsar vim locate)

# Timezone configuration.
default[:cespi_server_base][:timezone] = "America/Argentina/Buenos_Aires"

# NTP specific
default[:cespi_server_base][:ntp][:enabled] = true
default[:cespi_server_base][:ntp][:servers] = %w(ntp.desarrollo.unlp.edu.ar)
default[:cespi_server_base][:ntp][:apparmor_enabled] = true

# Ubuntu mirror configuration.
default[:cespi_server_base][:mirror][:enabled] = true
default[:cespi_server_base][:ubuntu][:archive_url] = "http://mirror.unlp.edu.ar/ubuntu/"
default[:cespi_server_base][:ubuntu][:archive_url_src] = "http://ar.archive.ubuntu.com/ubuntu/"
default[:cespi_server_base][:ubuntu][:security_url] = "http://mirror.unlp.edu.ar/ubuntu/"
default[:cespi_server_base][:ubuntu][:security_url_src] = "http://security.ubuntu.com/ubuntu/"
