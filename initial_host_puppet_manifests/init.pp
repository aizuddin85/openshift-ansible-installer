exec { path => '/bin:/usr/bin' }



exec { "ssh_keygen-root" :
	command => "ssh-keygen -t rsa -b 2048 -N '' -f /root/.ssh/id_rsa",
}

file { "/root/.ssh/authorized_keys" :
	ensure => present
}

exec { "copy_authorized_keys" :
	command => "cat  /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys",
}

exec { "fix permisson for authorized_keys" :
	command => "chmod 400 /root/.ssh/id_rsa.pub",
}

service { 'sshd':
	ensure => 'running',
	enable => true,
}

file { '/etc/ssh/sshd_config':
	ensure => present,
}-> file_line {'make sure sshd permit the rootl login via pubkey':
	replace => true,
	path => '/etc/ssh/sshd_config',
	line => 'PermitRootLogin without-password',
	match => "^PermitRootLogin.*$",
	notify => Service['sshd'],
}

