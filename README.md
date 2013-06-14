NOTES:
-------------------------------------------------------------------------------

To install Puppet Modules in shared directory:

The puppet binary has a module subcommand that will connect to the Puppet Forge
to download Puppet modules and their dependencies. The commands we used will
install Puppet Labs’ apache and mysql modules (and their dependencies). 
We’re also passing the --target-dir argument that will tell the puppet module 
subcommand to install the module into our shared directory (instead of Puppet’s default module path).
