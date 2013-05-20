# Provide sensu yum repos

class yum::sensu (
    $repo_sensu = hiera( 'yum::sensu::server',
    'http://repos.sensuapp.org/yum/el/$release/$arch',) {

    include yum

    yumrepo { 'sensu' :
        baseurl  => $repo_sensu,
        descr    => 'sensu',
        enabled  => 1,
        gpgcheck => 0,
    }

}

