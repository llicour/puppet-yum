class yum::lcoilliot {

    file { 'RPM-GPG-KEY-lcoilliot' :
        ensure  => present,
        path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => 'puppet:///modules/yum/RPM-GPG-KEY-lcoilliot',
        require => File[ '/etc/pki/rpm-gpg' ],
    }
}
