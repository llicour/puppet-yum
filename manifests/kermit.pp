# Provide kermit yum repos

class yum::kermit (
    $repo_kermit_custom    = 'http://www.kermit.fr/repo/rpm/el$releasever/$basearch/custom/',
    $repo_kermit_thirdpart = 'http://www.kermit.fr/repo/rpm/el$releasever/$basearch/thirdpart/',
    ) {

    include yum
    include yum::lcoilliot

    yumrepo { 'kermit-custom' :
        baseurl  => $repo_kermit_custom,
        descr    => 'Kermit - Custom',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }

    yumrepo { 'kermit-thirdpart' :
        baseurl  => $repo_kermit_thirdpart,
        descr    => 'Kermit - thirdpart',
        enabled  => 1,
        gpgcheck => 0,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }
}

