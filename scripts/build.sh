export CC=gcc
export CXX=g++

PLATFORM=$(uname -m)
BUILD_DIR="/root/ros_ws/build/$PLATFORM"
ROS_SRC_DIR="$BUILD_DIR/__src"

apt update -y
apt install python3-bloom python3-rosdep fakeroot debhelper dh-python -y
rm -rf /etc/ros/rosdep/sources.list.d/20-default.list

rm -rf $BUILD_DIR
mkdir -p $ROS_SRC_DIR/

cp -r ./rcl_logging_spdlog $ROS_SRC_DIR/

cd $ROS_SRC_DIR/

sudo rosdep fix-permissions
rosdep init
rosdep update

cd $ROS_SRC_DIR/rcl_logging_spdlog
bloom-generate rosdebian
DEB_BUILD_OPTIONS=nocheck fakeroot debian/rules binary

find $ROS_SRC_DIR -type f -name "*.deb" -exec mv '{}' $BUILD_DIR \;
rm -rf $ROS_SRC_DIR

echo "Building complete"