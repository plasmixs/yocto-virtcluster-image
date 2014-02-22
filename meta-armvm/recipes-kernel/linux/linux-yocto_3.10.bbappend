FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

PR := "${PR}.1"

COMPATIBLE_MACHINE_armvm = "armvm"

KBRANCH_armvm  = "standard/arm-versatile-926ejs"

KERNEL_FEATURES_append_armvm += " cfg/smp.scc"

SRC_URI += "file://armvm-standard.scc \
            file://armvm-user-config.cfg \
            file://armvm-user-patches.scc \
            file://armvm-user-features.scc \
           "

# uncomment and replace these SRCREVs with the real commit ids once you've had
# the appropriate changes committed to the upstream linux-yocto repo
#SRCREV_machine_pn-linux-yocto_armvm ?= "b170394a475b96ecc92cbc9e4b002bed0a9f69c5"
#SRCREV_meta_pn-linux-yocto_armvm ?= "c2ed0f16fdec628242a682897d5d86df4547cf24"
#LINUX_VERSION = "3.10.9"
