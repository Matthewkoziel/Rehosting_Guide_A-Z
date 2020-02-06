# Yum Cheat Sheet

## Purpose



## Yum queries
| Subcommand | Command    | Description                      |
|------------|------------|----------------------------------|
| `help`     |            | Display yum commands and options |
|            | `yum help` | Show yum subcommands and options |

### Individual packages
| Subcommand | Command                       | Description                                      |
|------------|-------------------------------|--------------------------------------------------|
| `list`     |                               | List package names from repositories             |
|            | `yum list available`          | List all available packages                      |
|            | `yum list installed`          | List all installed packages                      |
|            | `yum list all`                | List installed and available packages            |
|            | `yum list kernel`             | List installed and available kernel packages     |
|            |                               |                                                  |
| `info`     |                               | Display information about a package              |
|            | `yum info dos2unix`           | List info about dos2unix package                 |
|            |                               |                                                  |
| `deplist`  |                               | Display dependencies for a package               |
|            | `yum deplist nfs-utils`       | List dependencies and packages providing them    |
|            |                               |                                                  |
| `provides` |                               | Find packages that provide the queried file      |
|            | `yum provides “*bin/top”`     | Show package that contains top command           |
|            | `yum provides “*/README.top”` | Show package containing README.top file          |
|            |                               |                                                  |
| `search`   |                               | Search package names and descriptions for a term |
|            | `yum search samba`            | Find packages with samba in name or description  |
|            |                               |                                                  |
|`updateinfo`|                               | Get information about available package updates  |
|            | `yum updateinfo dos2unix`     | Get info on available dos2unix updates           |

### Group of packages
| Subcommand     | Command                      | Description                                          |
|----------------|------------------------------|------------------------------------------------------|
| `grouplist`    |                              | List names of installed and available package groups |
|                |                              |                                                      |
| `groupinfo`    |                              | Display description and contents of a package group  |
|                | `yum groupinfo “Web Server”` | See packages in Web Server group                     |
| `check-update` |                              | Query repositories for available package updates     |

## Manage Yum Repositories

| Subcommand  | Command                           | Description                                        |
|-------------|-----------------------------------|----------------------------------------------------|
| `repolist`  |                                   | Display enabled software repositories              |
|             |                                   |                                                    |
| `repoinfo`  |                                   | Display information about enabled yum repositories |
|             | `yum repoinfo rhel-7-server-rpms` | See info on rhel-7-server-rpms repo                |
|             |                                   |                                                    |
| `repo-pkgs` |                                   | Work with packages in a particular repository      |
|             | `yum repo-pkgs my-rpms list`      | List packages from my-rpms repo                    |
|             | `yum repo-pkgs my-rpms install`   | Install all packages from my-rpms repo             |
|             | `yum repo-pkgs my-rpms remove`    | Remove all packages from my-rpms repo              |
|             |                                   |                                                    |
| `makecache` |                                   | Download yum repository data to cache              |

## Troubleshoot and maintain yum

| Subcommand   | Command                | Description                                                                 |
|--------------|------------------------|-----------------------------------------------------------------------------|
| `check`      |                        | Check the local RPM database for problems (runs for a long time)            |
|              |                        |                                                                             |
| `history`    |                        | View and use yum transactions                                               |
|              | `yum history list`     | List all yum install, update and erase actions                              |
|              | `yum history info 3`   | Show details of yum transaction 3                                           |
|              | `yum history undo 3`   | Undo the yum action from transaction 3                                      |
|              | `yum history redo 3`   | Redo the undone yum action from transaction 3                               |
|              |                        |                                                                             |
| `clean`      |                        | Clear out cached package data                                               |
|              | `yum clean packages`   | Delete packages saved in cache                                              |
|              | `yum clean all`        | Clean out all packages and meta data from cache                             |
|              |                        |                                                                             |
| `fssnapshot` |                        | List LVM stapshots (helps roll back after package updates)                  |
|              |                        |                                                                             |
| `fs`         |                        | Act on filesystem (prevent doc or language file install on minimal systems) |
|              | `yum fs filters`       | List enabled filesystem filters                                             |
|              | `yum fs documentation` | Filters all docs from being installed (careful!)                            |

## Install, remove and upgrade packages with yum

| Subcommand     | Command                                           | Description                                                  |
|----------------|---------------------------------------------------|--------------------------------------------------------------|
| `install`      |                                                   | Install a package from a repository to your system           |
|                | `yum install dos2unix`                            | Install the doss2unix package                                |
|                |                                                   |                                                              |
| `update`       |                                                   | Update one or all packages on your system                    |
|                | `yum update`                                      | Update all packages with available updates                   |
|                | `yum update dos2unix`                             | Update the dos2unix package (if available)                   |
|                | `yum update --security`                           | Apply security-related package updates                       |
|                |                                                   |                                                              |
| `update-to`    |                                                   | Update one or all packages to a particular version           |
|                |                                                   |                                                              |
| `upgrade`      |                                                   | Update packages taking obsoletes into account                |
|                |                                                   |                                                              |
| `localinstall` |                                                   | Install a package from a local file, http, or ftp            |
|                | `yum localinstall abc-1-1.i686.rpm`               | Install abc package from local directory                     |
|                | `yum localinstall http://myrepo/abc-1-1.i686.rpm` | Install abc from FTP site                                    |
|                |                                                   |                                                              |
| `downgrade`    |                                                   | Downgrade a package to an earlier version                    |
|                | `yum downgrade abc`                               | Downgrade the abc package to an earlier version              |
|                |                                                   |                                                              |
| `reinstall`    |                                                   | Reinstall the current version of a package                   |
|                | `yum reinstall util-linux`                        | Reinstall util-linux (to replace any deleted files)          |
|                |                                                   |                                                              |
| `swap`         |                                                   | Remove one package and install another                       |
|                | `yum swap ftp lftp`                               | Remove ftp package and install lftp package                  |
|                |                                                   |                                                              |
| `erase`        |                                                   | Erase a package (and possibly dependencies) from your system |
|                | `yum remove vsftpd`                               | Remove the dos2unix package and dependencies                 |
|                |                                                   |                                                              |
| `remove`       |                                                   | Same as erase                                                |
|                |                                                   |                                                              |
| `autoremove`   |                                                   | Same as erase, plus removes additional unneeded packages     |
|                | `yum autoremove dos2unix`                         | Remove dos2unix and other unneeded packages                  |
|                |                                                   |                                                              |
| `groupinstall` |                                                   | Install all packages in the selected group                   |
|                | `yum groupinstall “Web server”`                   | Install Web Server packages                                  |

## Popular options for different yum commands

| Subcommand         | Command                                                     | Description                                                               |
|--------------------|-------------------------------------------------------------|---------------------------------------------------------------------------|
| `-y`               |                                                             | Assume yes if prompted                                                    |
|                    |                                                             |                                                                           |
| `--assumeno`       |                                                             | Assume no if prompted                                                     |
|                    |                                                             |                                                                           |
| `-q`               |                                                             | Produce no output                                                         |
|                    |                                                             |                                                                           |
| `-v`               |                                                             | Produce extra debugging output                                            |
|                    |                                                             |                                                                           |
| `--noplugins`      |                                                             | Run command without loading any yum plugins                               |
|                    |                                                             |                                                                           |
| `--disableplugin=` | `yum --disableplugin=langpacks info dos2unix`               | Disable a particular plugin for single command                            |
|                    |                                                             |                                                                           |
| `--enableplugin=`  |                                                             | Enable a plugin that is installed, but currently disabled                 |
|                    | `yum --enableplugin=ps ps`                                  | Show packages tied to running processes                                   |
|                    |                                                             |                                                                           |
| `--enablerepo=`    | `yum install docker \--enablerepo=rhel-7-server-extras-rpm` | Enable currently disabled repo for a single command (wildcards okay)      |
|                    |                                                             |                                                                           |
| `--disablerepo=`   | `yum list available --disablerepo=epel`                     | Disable currently enabled repo for a single command (wildcards okay)      |
|                    |                                                             |                                                                           |
| `--downloadonly`   |                                                             | Download to /var/cache/yum/arch/prod/repo/packages/, but don’t install    |
|                    | `yum install --downloadonly dos2unix`                       | Download dos2unix package to cache                                        |
|                    |                                                             |                                                                           |
| `--filter-???=`    |                                                             | Replace ??? with vendors, rpm-groups, arches, and others to filter output |
|                    |                                                             |                                                                           |
| `--changelog`      |                                                             | Display changelog information of package                                  |
|                    |                                                             |                                                                           |

***
## Examples

