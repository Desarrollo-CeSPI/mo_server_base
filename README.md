# Cookbook: mo_server_base

Configures some basic stuff we usually need on a server. So far, what is implemented is:

* Configures custom Debian/Ubuntu mirrors.
* Creates some initial groups.
* Creates users based on information taken from a databag.
* Installs some basic software packages.
* NTP client.
* Sets up sudoers.

## Table of Contents

* [Supported Platforms](#supported-platforms)
* [Recipes](#recipes)
  * [Default](#mo_server_base::default)
  * [Mirror](#mo_server_base::mirror)
  * [NTP](#mo_server_base::ntp)
  * [Rsyslog](#mo_server_base::rsyslog)
  * [User](#mo_server_base::user)
* [Attributes](#attributes)
* [Usage](#usage)
  * [Adding a new user](#adding-a-new-user)
* [Important](#important)
* [ToDo](#todo)
* [License](#license)
* [Authors](#authors)

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

This recipe uses users cookbook from supermarket, which needs search support. For that reason,
chef-solo-search is included in the Berksfile, in order to be able to test the cookbook using Chef Solo.

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

### Adding a new user

To add a new user with sudo privileges, you need to create a new data bag item in the users databag. Take a look at user.json in
sample/data_bags/users/user.json for an example.

## Important

When fqdn is not set properly because of domain issues, you can set a node attribute / role attribute with:

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

## License

The MIT License (MIT)

Copyright (c) 2014 Christian Rodriguez & Leandro Di Tommaso

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Authors

* Author:: Christian Rodriguez (<chrodriguez@gmail.com>)
* Author:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)
