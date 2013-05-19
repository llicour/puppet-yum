# Provide the EPEL yum repository
# EPEL = Extra Packages for Enterprise Linux
# http://fedoraproject.org/wiki/EPEL

class yum::epel {
    $epel = $::operatingsystemrelease ? {
        /^5\./ => '5',
        /^6\./ => '6',
    }

    include yum

    file { 'epel.repo' :
        ensure => present,
        path   => '/etc/yum.repos.d/epel.repo',
        mode   => '0644',
        owner  => 'root',
        group  => 'root',
        source => "puppet:///modules/yum/epel${epel}.repo",
    }

    file { "RPM-GPG-KEY-EPEL-${epel}" :
        ensure  => present,
        path    => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${epel}",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => "puppet:///modules/yum/RPM-GPG-KEY-EPEL-${epel}",
        require => File[ '/etc/pki/rpm-gpg' ],
    }

}
