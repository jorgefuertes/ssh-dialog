#!/usr/bin/env ruby

# Init
require 'rdialog'
require 'yaml'
require 'yaml_config'
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

# Hosts dialog
hosts = Array.new
config.get(:groups)[group]['hosts'].each do |host|
    hosts.push(["#{host[0]}", "#{host[1]['hostname']}"])
end
host = dialog.menu("Select host:", hosts)

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
puts "Connectig to #{config.get(:groups)[group]['hosts'][host]['hostname']} with user #{user}..."
exec("ssh -p#{port} #{user}@#{config.get(:groups)[group]['hosts'][host]['hostname']}")
