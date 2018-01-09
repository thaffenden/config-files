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


## Enabling keyboard backlight
Because the keyboard backlight is turned off by default, as script has to be added to `~/.config/autostart/.desktop` to enable it.

Run the `install.sh` script to set the correct path for `kb_backlight.sh` script in the `.desktop` file and create a symlink from the git repo to `~/.config/autostart/.desktop` so any changes made in the git repository will be automatically enabled.

