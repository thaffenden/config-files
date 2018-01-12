# config-files
Config files for programs used on multiple computers.

ConEmu: ConEmu.xml  
PyCharm: settings.jar 
Oh-my-zsh: .zshrc 


## Using .zshrc
To use ensure the `.zshrc` file is always up to date with any changes made, create a symlink in your home directory to the file in thsi git project. e.g.:

```sh
ln -s full/path/to/this/repo/.zshrc ~/.zshrc
```


## Install script
Confiures a few different things on fresh installs.

### Enabling keyboard backlight
Because the keyboard backlight is turned off by default, a script has to be added to `~/.config/autostart/.desktop` to enable it.

The `install.sh` script sets the correct path for `kb_backlight.sh` script in the `.desktop` file and creates a symlink from the git repo to `~/.config/autostart/.desktop` so any changes made in the git repository will be automatically enabled.


### Configuring default monitor settings
Used to ensure that the monitor settings at boot are what you configure them to be by default.
This is to avoid an issue where my second monitor which is usually off was showing the login screen.
Monitor prerfances should be configured before this is run, so they are correct when the file is copied.

