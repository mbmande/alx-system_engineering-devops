# hfeuhgjelfke
file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => "\
# Managed by Puppet
PasswordAuthentication no
IdentityFile ~/.ssh/school
",
}
