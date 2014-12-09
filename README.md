# Cookbook: mo_server_base

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

### mo_server_base::default

This recipe invokes every other recipe enabled in the attributes.

### mo_server_base::mirror

Changes the default mirrors to the ones specified in the corresponding attributes. By default, it's set to use CeSPI mirrors.

### mo_server_base::ntp

Installs and configures NTP client as specified in the attributes.

### mo_server_base::rsyslog

This recipe is a wrapper for the Rsyslog recipe to just change the way logs are stored in syslog, saving them line by line instead of consolidating some logs on the same line. The reason is to enable the use of some applications like Fail2Ban.

### mo_server_base::user

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
[:mo_server_base][:timezone] | String | Set timezone to use on the server | "America/Argentina/Buenos_Aires"
[:mo_server_base][:ntp][:apparmor_enabled] | Boolean | If true configures some necessary stuff to work with apparmor | False
[:mo_server_base][:authorization][:sudo][:passwordless] | Boolean | If true allows passwordless sudo to users in the sysadmin group | True

## Usage

This cookbook can be called using individual recipes or using the default one and telling the cookbook which recipes to run by setting true the appropiate enabled attributes.

**Be careful** when using this cookbook with the default attributes, as it will give sudo
access just to the users included in the databag and remove any privilege from the rest of the users.
If you don't include a user for yourself (with your public key) or have root password set **you will lost
privilged access to the server**.

# Important

When fqdn is not set properly because of domai issues, you can set a node attribute / role attribute with:

```
{
    "chef_type": "environment",
    "default_attributes": {
        "set_fqdn": "*.some-domain.com",
    }
}
```

For more information about this see: [hostname cookbook](https://supermarket.getchef.com/cookbooks/hostname)

## ToDo

Planned but still not implemented.

* Backup client.
* Log client.
* Monitoring client.

## License and Authors

Author:: Christian Rodriguez (<chrodriguez@gmail.com>)
Author:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)
