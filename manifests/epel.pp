# Provide the EPEL yum repository
# EPEL = Extra Packages for Enterprise Linux
# http://fedoraproject.org/wiki/EPEL

class yum::epel {
    $epel = $::operatingsystemrelease ? {
        /^5\./ => 'epel5',
        /^6\./ => 'epel6',
    }

    file { 'epel.repo' :
        ensure => present,
        path   => '/etc/yum.repos.d/epel.repo',
        mode   => '0644',
        owner  => 'root',
        group  => 'root',
        source => "puppet:///modules/yum/${epel}.repo",
    }
}
