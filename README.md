SSH-Dialog
==========

Yet Another SSH Dialog Utility.

Features:
---------

- Ruby.
- YAML configuration.
- Gemfile.
- Works on GNU/Linux, MacOS-X...

Tips:
-----

- You can share the YML config with multiple computers using dropbox or other services.

Requirements:
-------------

- Ruby, via RVM or similar.
- Dialog utility.
- Any text editor.
- SSH client.

License:
--------

- GPLv2, view the LICENSE file.

Install:
--------

- __Install dialog__ command line utility:

	- __Debian__: `apt-get install dialog`
	- __OsX__: `brew install dialog`

- __Clone__ this repo and cd into his dir.

- __Bundle__, install gem dependencies:

	- `bundle install`

- __Make__ config dir:

	- `mkdir -p ~/.config`

- __Copy__ the config example file:

	- `cp ssh-dialog.yml.dist ~/.config/ssh-dialog.yml`

- Use your favorite __editor__ to make your own config.

- __Exec__ `./ssh-dialog.rb`, link to anywhere on your path...

I hope you like it!

Config file format:
-------------------

```yml
defaults:
	# Optional: Defaults to current user if not exists
	username: root

groups:
	# Any group title
	group-1:
		# Optional: Key filename for this group
		key: ~/.ssh/id_rsa
		hosts:
			# Host title
			own-server-one:
				# FQDN or IP address
				hostname: my.server.tdl
				# Optional: Key filename. Overrides group key
				key: ~/.ssh/id_rsa
				# Optional: Default o current username is used if not
				username: root
				# Optional: Port number, standar 22 if not
				port: 222
```

