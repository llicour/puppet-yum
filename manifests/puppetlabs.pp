# Provide puppetlabs yum repos

class yum::puppetlabs (
   $repo_puppetlabs_products = 'http://yum.puppetlabs.com/el/$releasever/products/$basearch',
   $repo_puppetlabs_deps     = 'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch',
) {

    include yum

    yumrepo { 'puppetlabs-products' :
        baseurl  => $repo_puppetlabs_products,
        descr    => 'Puppetlabs - Products',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    }

    yumrepo { 'puppetlabs-deps' :
        baseurl  => $repo_puppetlabs_deps,
        descr    => 'Puppetlabs - Dependencies',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    }

    file { "RPM-GPG-KEY-puppetlabs" :
        ensure  => present,
        path    => "/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => "puppet:///modules/yum/RPM-GPG-KEY-puppetlabs",
        require => File[ '/etc/pki/rpm-gpg' ],
    }

}

