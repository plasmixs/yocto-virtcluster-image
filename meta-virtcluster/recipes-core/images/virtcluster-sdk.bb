require virtcluster-core.bb

DESCRIPTION = "virtcluster image with debug tools and symbols"

IMAGE_FEATURES += "dev-pkgs dbg-pkgs tools-sdk tools-debug tools-profile debug-tweaks"

IMAGE_INSTALL_append = " kernel-dev"

