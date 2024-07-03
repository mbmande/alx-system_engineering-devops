#!/usr/bin/env bash
# djfhejhf
# Puppet manifest to install nginx and configure custom rule

# Install nginx package
package { 'nginx':
  ensure => 'present',
}

# Update package list and install nginx
exec { 'apt-update-install-nginx':
  command => 'sudo apt-get update && sudo apt-get -y install nginx',
  path    => '/usr/bin',
  require => Package['nginx'], # Ensure nginx package is installed before running this command
}

# Create index.html with "Hello World!"
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
}

# Define Nginx custom configuration using a separate file
file { '/etc/nginx/sites-available/custom.conf':
  ensure  => file,
  content => "\
server {
    listen 80 default_server;
    location /redirect_me {
        return 301 https://www.youtube.com/;
    }
}",
  notify  => Exec['reload-nginx'], # Notify the 'reload-nginx' exec when this file changes
}

# Link custom.conf to sites-enabled
file { '/etc/nginx/sites-enabled/custom.conf':
  ensure => link,
  target => '/etc/nginx/sites-available/custom.conf',
  require => File['/etc/nginx/sites-available/custom.conf'], # Ensure custom.conf is created before linking
  notify => Exec['reload-nginx'], # Notify the 'reload-nginx' exec when this link changes
}

# Reload Nginx configuration
exec { 'reload-nginx':
  command  => 'sudo systemctl reload nginx',
  path     => '/usr/bin',
  provider => 'shell',
  refreshonly => true, # Only run this exec when notified by a file change
}

