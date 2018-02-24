class digital_signage::account inherits digital_signage {

  # Create digital signage user
  user { $ds_username:
    ensure => 'present',
    managehome => true,
    home => $ds_home,
    shell => '/bin/bash',
    groups => [ 'video', 'audio' ],
    comment => 'digital signage user'
  }

}
