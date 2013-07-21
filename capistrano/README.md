Capistrano Tutorial
===============================================================================

Initial Setup:
	- SSH Keys between hosts
	To generate a new agent key:
	$ ssy-keygen
	
	To copy the key to a remote server the short way:
	$ cat .ssh/id_rsa.pub | ssh server "cat >>~/.ssh/authorized_keys"

	- Install capistrano gems on site that will deploy
	- gems: capistrano, railsless-deploy (for php deployment)


To start a project:
	In the root folder of the project, run 'capify .'
	$ cd /var/www
	$ capify .
	[add] writing './Capfile'
	[add] making directory './config'
	[add] writing './config/deploy.rb'
	[done] capified!
	root@source:/var/www#

