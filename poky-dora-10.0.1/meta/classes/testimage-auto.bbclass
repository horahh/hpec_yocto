# Copyright (C) 2013 Intel Corporation
#
# Released under the MIT license (see COPYING.MIT)


# Run tests automatically on an image after the image is constructed
# (as opposed to testimage.bbclass alone where tests must be called
# manually using bitbake -c testimage <image>).
#
# NOTE: to use this class, simply set TEST_IMAGE = "1" - no need to
# inherit it since that will be done in image.bbclass when this variable
# has been set.
#
# See testimage.bbclass for the test implementation.

inherit testimage

python do_testimage_auto() {
    testimage_main(d)
}
addtask testimage_auto before do_build after do_rootfs
do_testimage_auto[depends] += "qemu-native:do_populate_sysroot"
do_testimage_auto[depends] += "qemu-helper-native:do_populate_sysroot"
