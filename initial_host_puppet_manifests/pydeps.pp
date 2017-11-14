$pydeps = [ 'java-1.8.0-openjdk-headless', 'pyOpenSSL', 'python-passlib', 'python2-cryptography', 'bind-utils', 'python-rhsm-certificates' ]

package { $pydeps:
	ensure => 'installed',
}
