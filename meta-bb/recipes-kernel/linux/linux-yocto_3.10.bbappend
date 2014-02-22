FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

PR := "${PR}.1"

COMPATIBLE_MACHINE_bb = "bb"


KBRANCH_bb  = "standard/beagleboard"

KERNEL_FEATURES_append_bb += " cfg/smp.scc"

SRC_URI += "file://bb-standard.scc \
            file://bb-user-config.cfg \
            file://bb-user-patches.scc \
            file://bb-user-features.scc \
           "

# uncomment and replace these SRCREVs with the real commit ids once you've had
# the appropriate changes committed to the upstream linux-yocto repo
#SRCREV_machine_pn-linux-yocto_bb ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
#SRCREV_meta_pn-linux-yocto_bb ?= "459165c1dd61c4e843c36e6a1abeb30949a20ba7"
#LINUX_VERSION = "3.10.9"
