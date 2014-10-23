# Cookbook: cespi_server_base

Configures some basic stuff we usually need on a server. So far, what is implemented is:

* Configures custom Debian/Ubuntu mirrors.
* Creates some initial groups.
* Creates users based on information taken from a databag.
* Installs some basic software packages.
* NTP client.
* Sets up sudoers.

## Supported Platforms

Tested on Ubuntu 14.04, should work on Ubuntu 12.04 and Debian.

## Recipes

### cespi_server_base::default

This recipe invokes every other recipe enabled in the attributes.

### cespi_server_base::mirror

Changes the default mirrors to the ones specified in the corresponding attributes. By default, it's set to use CeSPI mirrors.

### cespi_server_base::ntp

Installs and configures NTP client as specified in the attributes.

### cespi_server_base::rsyslog

This recipe is a wrapper for the Rsyslog recipe to just change the way logs are stored in syslog, saving them line by line instead of consolidating some logs on the same line. The reason is to enable the use of some applications like Fail2Ban.

### cespi_server_base::user

* Creates two groups:
  * sysadmin group (specified in the attributes). Users added to this group will be sudoers.
  * devops.
* Creates users.
  * From databag 'users'.
  * Copies SSH public key.
  * Adds users to the specified groups.

## Attributes

To clarify, some attributes are commented here (for a full list take a look at the attributes folder).

Key | Type | Description | Default
----|------|-------------|---------
[:cespi_server_base][:timezone] | String | Set timezone to use on the server | "America/Argentina/Buenos_Aires"
[:cespi_server_base][:ntp][:apparmor_enabled] | Boolean | If true configures some necessary stuff to work with apparmor | False
[:cespi_server_base][:authorization][:sudo][:passwordless] | Boolean | If true allows passwordless sudo to users in the sysadmin group | True

## Usage

This cookbook can be called using individual recipes or using the default one and telling the cookbook which recipes to run by setting true the appropiate enabled attributes. 

## ToDo

Planned but still not implemented.

* Backup client.
* Log client.
* Monitoring client.

## License and Authors

Author:: Christian Rodriguez (<car@cespi.unlp.edu.ar>)
Author:: Leandro Di Tommaso (<lditommaso@cespi.unlp.edu.ar>)
