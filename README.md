# Fork-Your-Ros-Package

This repository contains a template for a ROS package to be forked.


### Build the forked ROS package

```
docker compose up
```

If it can be built successfully, you will get two `.deb` packages in the `build` directory. And then, you can install it with `sudo dpkg -i <.deb file>` in your ros environment.