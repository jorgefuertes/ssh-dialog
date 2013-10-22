#!/usr/bin/env ruby

# Init
require 'rdialog'
require 'yaml'
require 'yaml_config'
if system('dialog &> /dev/null') != true
	raise "Cannot call dialog: Not installed?"
end
dialog = RDialog.new
config = YamlConfig.new("#{ENV['HOME']}/.config/ssh-dialog.yml")

# Default username
if config.get(:defaults)['username'].nil?
    defaultUser = ENV['USER']
else
    defaultUser = config.get(:defaults)['username']
end

# Groups dialog
groups = Array.new
config.get(:groups).each do |group|
    groups.push([group[0]])
end
group = dialog.menu("Select a group:", groups)
if group == false
	raise "No group selected"
end

# Hosts dialog
hosts = Array.new
config.get(:groups)[group]['hosts'].each do |host|
    hosts.push(["#{host[0]}", "#{host[1]['hostname']}"])
end
host = dialog.menu("Select host:", hosts)
if host == false
	raise "No host selected"
end
hostname = config.get(:groups)[group]['hosts'][host]['hostname']

# Key selection, host overrides group key:
key = false
if not config.get(:groups)[group]['key'].nil?
	key = config.get(:groups)[group]['key']
end
if not config.get(:groups)[group]['hosts'][host]['key'].nil?
	key = config.get(:groups)[group]['hosts'][host]['key']
end

# Final username
if config.get(:groups)[group]['hosts'][host]['username'].nil?
    user = defaultUser
else
    user = config.get(:groups)[group]['hosts'][host]['username']
end

# Port
if config.get(:groups)[group]['hosts'][host]['port'].nil?
    port = 22
else
    port = config.get(:groups)[group]['hosts'][host]['port']
end

# SSH
system('clear')
puts "Connectig to #{hostname} with user #{user}..."
if key == false
	#exec("ssh -p#{port} #{user}@#{hostname}")
	puts "ssh -p#{port} #{user}@#{hostname}"
else
	#exec("ssh -p#{port} -i #{key} #{user}@#{hostname}")
	puts "ssh -p#{port} -i #{key} #{user}@#{hostname}"
end

