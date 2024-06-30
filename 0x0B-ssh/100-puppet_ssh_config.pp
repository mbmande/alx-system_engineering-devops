file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => template('module_name/ssh_config.erb'),
}

# Assuming 'module_name/templates/ssh_config.erb' contains:
#   # Managed by Puppet
#   PasswordAuthentication no
#   IdentityFile ~/.ssh/school
