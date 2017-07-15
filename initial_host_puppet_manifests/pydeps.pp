$pydeps = [ 'java-1.8.0-openjdk-headless', 'pyOpenSSL', 'python-passlib', 'python2-cryptography', 'bind-utils' ]

package { $pydeps:
	ensure => 'installed',
}
