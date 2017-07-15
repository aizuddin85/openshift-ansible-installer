$pydeps = [ 'pyOpenSSL', 'python-passlib', 'python2-cryptography', 'bind-utils' ]

package { $pydeps:
	ensure => 'installed',
}
