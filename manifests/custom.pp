# Provide custom yum repos

class yum::custom (
   $repo_custom_noarch = 'http://www.kermit.fr/custom/el$releasever/noarch/',
   $repo_custom_arch   = 'http://www.kermit.fr/custom/el$releasever/$basearch/',
) {

    include yum
    include yum::lcoilliot

    yumrepo { 'custom-noarch' :
        baseurl  => $repo_custom_noarch,
        descr    => 'Custom - noarch',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }

    yumrepo { "custom-${architecture}" :
        baseurl  => $repo_custom_arch,
        descr    => "Custom - ${architecture}",
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-lcoilliot',
        #gpgkey  => 'http://www.kermit.fr/stuff/gpg/RPM-GPG-KEY-lcoilliot',
        require  => File[ 'RPM-GPG-KEY-lcoilliot' ],
    }

}

