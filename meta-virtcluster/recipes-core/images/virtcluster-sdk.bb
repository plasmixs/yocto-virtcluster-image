require virtcluster-core.bb

DESCRIPTION = "virtcluster image with debug tools and symbols"

IMAGE_FEATURES += "tools-debug debug-tweaks"

#Extra features:
#dev-pkgs dbg-pkgs tools-sdk tools-profile

IMAGE_INSTALL_append = " kernel-dev"

