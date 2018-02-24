class digital_signage::template inherits digital_signage {

  # Pre-create the service directory
  file { '/etc/systemd/system/getty@tty1.service.d':
    ensure => 'directory',
  }

  # Enables autologin for tty1.  Reboots when template is changed.
  file { '/etc/systemd/system/getty@tty1.service.d/autologin.conf':
    ensure => file,
    content => template('digital_signage/autologin.conf.epp'),
    notify => Reboot['template_changed'],
  }

  # .profile will launch the required application upon login
  file { "$ds_home/.profile":
    ensure => file,
    content => template('digital_signage/user_profile.epp'),
    notify => Reboot['template_changed'],
  }

  # Digital signage launcher (opens chromium-browser)
  file { "/opt/ds_launcher.sh":
    ensure => file,
    content => template('digital_signage/ds_launcher.sh.epp'),
    mode => '0755',
    notify => Reboot['template_changed'],
  }

  # Reboot resource
  reboot { 'template_changed':
    apply => finished,
    timeout => 0,
    message => "digital signage template changed",
  }

}
