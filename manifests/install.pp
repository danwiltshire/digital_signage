class digital_signage::install inherits digital_signage {

  $packages = [ 'xorg', 'openbox', 'xdotool', 'unclutter', 'pulseaudio', 'chromium-browser' ]

  package { $packages:
    ensure => installed,
    install_options => ['--no-install-recommends'],
  }

}
