# Provide various yum repos

class yum {

    file { ['/etc/pki', '/etc/pki/rpm-gpg'] :
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    service{ 'yum-updatesd' :
        ensure    => stopped,
        enable    => false,
        hasstatus => true,
    }

}

