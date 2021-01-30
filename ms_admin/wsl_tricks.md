# WSL Tricks
* Tricks when using Windows Subsystem Linux

## ~~Start WSL and cron when Windows starts~~ THIS DOES NOT ACTUALLY WORK AS SUPPOSED! 
* Create a file **wsl_start_cron.vbs** with content below.
* Put the script file to C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
* It might possible to hide the process with `, vbhide` in the end of the second line, but I prefer to see that the cron is running.
~~~
set ws=wscript.createobject("wscript.shell")
ws.run "wsl.exe -d Debian -u root service cron start; echo 'Do not close this window. Cronjob is running in Windows Subsystem Linux.'; cat"
~~~

## New installation Debian/Ubuntu
* Upgrade, install, set vim config, disable bell
~~~
sudo apt-get update; \
sudo apt-get -y upgrade; \
sudo apt-get install -y tmux wget vim; \
cd && \
wget https://gist.githubusercontent.com/iisti/bf7769f0eaa8e863e7cb0dd324b6dcf5/raw/ed4169aa875a73013ada73f71b9f8f577c2cb981/.vimrc ; \
sudo sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc; \
printf "\n# Stop bell sounds\nexport LESS=\"$LESS -R -Q\"" >> ~/.profile; \
sudo chmod u+s /bin/ping
~~~

## ping: socket: Operation not permitted
* This is already added to the initial installation/configuration above.
* Error:
~~~
$ ping google.com
ping: socket: Operation not permitted
~~~
* Fix:
`sudo chmod u+s /bin/ping`

## vimrc
* https://gist.githubusercontent.com/iisti/bf7769f0eaa8e863e7cb0dd324b6dcf5/raw/ed4169aa875a73013ada73f71b9f8f577c2cb981/.vimrc
  * The above is fork from this https://gist.github.com/simonista/8703722

## Disable bell
* Source
  * https://stackoverflow.com/questions/36724209/disable-beep-of-linux-bash-on-windows-10
~~~
sudo sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc; \
printf "\n# Stop bell sounds\nexport LESS=\"$LESS -R -Q\"" >> ~/.profile

# This is in the vimrc above, so no need to do
printf "\n\" Stop bell sounds\nset visualbell\n" >> ~/.vimrc
~~~

## Change \~/dir color in the user@doh:\~/dir$
* Source
  * https://superuser.com/questions/1365258/how-to-change-the-dark-blue-in-wsl-to-something-brighter
* Right click terminal -> properties -> Screen text

## Tmux tips
* Copying without hassle, press SHIFT and select with mouse.
 * Source: https://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu/
