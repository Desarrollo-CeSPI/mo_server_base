# Cookbook: cespi_server_base

Configures some basic stuff we usually need on a server. So far, what is
implemented is:

* Configures custom Debian/Ubuntu mirrors.
* Creates some initial groups.
* Creates users based on information taken from a databag.
* Installs some basic software and tools.
* NTP client.
* Sets up sudoers.

## Supported Platforms

Tested on Ubuntu 14.04, should work on Ubuntu 12.04 and Debian.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:packages]</tt></td>
    <td>Array</td>
    <td>list of package names to install when run</td>
    <td><tt>%w(atsar vim locate)</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:timezone]</tt></td>
    <td>String</td>
    <td>set timezone to use on the server</td>
    <td><tt>"America/Argentina/Buenos_Aires"</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:ntp][:enabled]</tt></td>
    <td>Boolean</td>
    <td>sets whether or not to enable NTP client</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:ntp][:servers]</tt></td>
    <td>Array</td>
    <td>list of servers to use to synchronize clock via NTP</td>
    <td><tt>%w(ntp.desarrollo.unlp.edu.ar)</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:ntp][:apparmor_enabled]</tt></td>
    <td>Boolean</td>
    <td>if true configures some stuff to work with apparmor</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:mirror][:enabled]</tt></td>
    <td>Boolean</td>
    <td>if true enables custom mirror configuration</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:mirror][:archive_url]</tt></td>
    <td>String</td>
    <td>sets archive mirror URL</td>
    <td><tt>"http://mirror.unlp.edu.ar/ubuntu/"</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:mirror][:archive_url_src]</tt></td>
    <td>String</td>
    <td>sets archive sources mirror URL</td>
    <td><tt>"http://ar.archive.ubuntu.com/ubuntu/"</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:mirror][:security_url]</tt></td>
    <td>String</td>
    <td>sets security mirror URL</td>
    <td><tt>"http://mirror.unlp.edu.ar/ubuntu/"</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:mirror][:security_url_src]</tt></td>
    <td>String</td>
    <td>sets security sources mirror URL</td>
    <td><tt>"http://security.ubuntu.com/ubuntu/"</tt></td>
  </tr>
  <tr>
    <td><tt>[:cespi_server_base][:authorization][:sudo][:passwordless]</tt></td>
    <td>Boolean</td>
    <td>if true allows passwordless sudo to users in the sysadmin group</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

This cookbook can be called using individual recipes or using the default one
and telling the cookbook which recipes to run by setting true in the appropiate
enabled attributes. 

## ToDo

Planned but still not implemented.

* Backup client.
* Log client.
* Monitoring client.

## Contributing

1. Fork the repository.
2. Create a named feature branch (i.e. `add-new-recipe`).
3. Write your change.
4. Write tests for your change (if applicable).
5. Run the tests, ensuring they all pass.
6. Submit a Pull Request.

## License and Authors

Author:: Christian Rodriguez (<car@cespi.unlp.edu.ar>)
Author:: Leandro Di Tommaso (<lditommaso@cespi.unlp.edu.ar>)
