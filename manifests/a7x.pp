# Provide a7x yum repos

class yum::a7x (
   $repo_a7x = 'http://www.kermit.fr/a7x/el$releasever/$basearch/',
) {

    include yum
    include yum::lcoilliot

    yumrepo { 'a7x' :
        baseurl  => $repo_a7X
        descr    => 'Automatix',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }

}

