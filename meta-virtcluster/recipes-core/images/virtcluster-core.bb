DESCRIPTION = "virtcluster image"

IMAGE_FEATURES += "package-management ssh-server-openssh"

IMAGE_INSTALL = " \
		 packagegroup-virtcluster-os \
		 packagegroup-virtcluster-connectivity \
		 packagegroup-virtcluster-tools \
		 packagegroup-virtcluster-apps \
		 ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
		 ${CORE_IMAGE_EXTRA_INSTALL} \
		 "

IMAGE_LINGUAS = "en-us"

LICENSE = "MIT"

inherit core-image

IMAGE_ROOTFS_SIZE = "8192"

