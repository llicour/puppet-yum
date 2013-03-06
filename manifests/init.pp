# Provide various custom and thirdpart yum repos

class yum {

    file { '/etc/pki' :
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    file { '/etc/pki/rpm-gpg' :
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    file { 'RPM-GPG-KEY-lcoilliot' :
        ensure  => present,
        path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => 'puppet:///modules/yum/RPM-GPG-KEY-lcoilliot',
        require => File[ '/etc/pki/rpm-gpg' ],
    }

    yumrepo { 'kermit-custom' :
        baseurl  =>
          'http://www.kermit.fr/repo/rpm/el$releasever/$basearch/custom/',
        descr    => 'Kermit - Custom',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }

    yumrepo { 'kermit-thirdpart' :
        baseurl  =>
          'http://www.kermit.fr/repo/rpm/el$releasever/$basearch/thirdpart/',
        descr    => 'Kermit - thirdpart',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }

    yumrepo { 'a7x' :
        baseurl  =>
          'http://www.kermit.fr/a7x/el$releasever/$basearch/',
        descr    => 'Automatix',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }

    if $::operatingsystemrelease !~ /^4\./ {
      file { '/etc/yum.repos.d/custom.repo' :
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('yum/custom.repo'),
      }
    }

    service{ 'yum-updatesd' :
        ensure    => stopped,
        enable    => false,
        hasstatus => true,
    }

    #yumrepo { 'puppetlabs-products' :
    #    baseurl  =>
    #      'http://yum.puppetlabs.com/el/$releasever/products/$basearch',
    #    descr    => 'Puppetlabs - Products',
    #    enabled  => 1,
    #    gpgcheck => 1,
    #    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    #}

    #yumrepo { 'puppetlabs-deps' :
    #    baseurl  =>
    #      'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch',
    #    descr    => 'Puppetlabs - Dependencies',
    #    enabled  => 1,
    #    gpgcheck => 1,
    #    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    #}

}

