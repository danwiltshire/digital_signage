# digital_signage

## Description

This module provides a simple digital signage solution that displays a single URL and has the ability to refresh the page on a specified refresh interval.

## Setup

### What digital_signage affects

* Creates a limited user (autologin on tty1)
* Installs xorg, openbox, xdotool, unclutter, pulseaudio and chromium
* Reboots device when templates are changed.

### Beginning with digital_signage

digital_signage can be used manually or via an ENC such as The Foreman.

## Usage

To display a URL that is refreshed every 15 minutes:

```puppet
class { 'digital_signage':
  url => "https://slides.google.com/slideurl",
  refresh_interval => 300, # Time value in milliseconds
}
```

## Reference

### Classes

* `digital_signage::account`: Creates a dedicated limited user
* `digital_signage::install`: Installs required packages
* `digital_signage::template`: Writes template files for:
* * Auto login to tty1
* * Script to launch the browser.

## Limitations

### Supported Operating Systems

* Ubuntu 16.04