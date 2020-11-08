# Fixing picom slowness with nvidia graphics card

To fix the performance issues using picom on an nvidia graphics card with a GSync display you need to create a rule to ignore the picom process from the VRR override.

The file `picom-rc` in this directory should be symlinked to `~/.nv/nvidia-application-profiles-rc.d/picom-rc`.
