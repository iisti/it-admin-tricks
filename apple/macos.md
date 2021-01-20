# Tricks for macOS


### OpenSSL
* By default macOS Big Sur 11.1 uses LibreSSL which a bit limited.
  ~~~
  # Check version in use
  openssl version                                                                                        

  LibreSSL 2.8.3                   
  ~~~

* To install OpenSSL with Homebrew run commands:
  ~~~
  brew update
  brew install openssl
  echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.bash_profile
  source ~/.bash_profile

  # Check version in use
  openssl version

  OpenSSL 1.1.1i  8 Dec 2020
  ~~~
