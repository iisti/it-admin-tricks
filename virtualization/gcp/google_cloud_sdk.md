# Instructions for using Google Cloud SDK
## Installation on Mac
  * homebrew installation 
    ~~~
    brew install --cask google-cloud-sdk
    
    # Remember to add to profile
    google-cloud-sdk is installed at /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk. Add your profile:

    for bash users
      source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
      source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

    for zsh users
      source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
      source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

    for fish users
      source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
    ~~~
    
  * Check some basic information

        gcloud version
        gcloud info

  * Init
  
        gcloud init
  

