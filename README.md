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

