FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

PR := "${PR}.1"

COMPATIBLE_MACHINE_x86vm = "x86vm"

KBRANCH_x86vm  = "standard/common-pc/base"

KERNEL_FEATURES_append_x86vm += " cfg/smp.scc"

SRC_URI += "file://x86vm-standard.scc \
            file://x86vm-user-config.cfg \
            file://x86vm-user-patches.scc \
            file://x86vm-user-features.scc \
           "

# uncomment and replace these SRCREVs with the real commit ids once you've had
# the appropriate changes committed to the upstream linux-yocto repo
#SRCREV_machine_pn-linux-yocto_x86vm ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
#SRCREV_meta_pn-linux-yocto_x86vm ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
#LINUX_VERSION = "3.14"
