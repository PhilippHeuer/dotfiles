{ lib, ... }:

{
  # prevent replacing the running kernel w/o reboot
  # security.protectKernelImage = true;

  ###
  # Kernel hardening
  boot.blacklistedKernelModules = [
    # obscure networking protocols
    "dccp"
    "sctp"
    "rds"
    "tipc"
    "n-hdlc"
    "x25"
    "decnet"
    "econet"
    "af_802154"
    "ipx"
    "appletalk"
    "psnap"
    "p8023"
    "p8022"
    "can"
    "atm"
    "vivid" # vivid driver is only useful for testing purposes and has been the cause of privilege escalation vulnerabilities

    # various rare filesystems
    "jffs2"
    "hfsplus"
    "squashfs"
    "udf"
    "cifs"
    "nfs"
    "nfsv3"
    "nfsv4"
    "gfs2"

    # disable bluetooth
    "bluetooth"
    "btusb"
  
    # disable webcam
    "uvcvideo"

    # disable thunderbolt and firewire to prevent DMA attacks
    "thunderbolt"
    "firewire-core"
  ];

  boot.kernelModules = [
    "tcp_bbr" # BBR congestion control algorithm
  ];

  boot.kernelParams = [
    # Disable slab merging which significantly increases the difficulty of heap
    # exploitation by preventing overwriting objects from merged caches and by
    # making it harder to influence slab cache layout
    "slab_nomerge"

    # Disable vsyscalls as they are obsolete and have been replaced with vDSO.
    # vsyscalls are also at fixed addresses in memory, making them a potential
    # target for ROP attacks
    "vsyscall=none"

    # Disable debugfs which exposes a lot of sensitive information about the
    # kernel
    "debugfs=off"

    # Sometimes certain kernel exploits will cause what is known as an "oops".
    # This parameter will cause the kernel to panic on such oopses, thereby
    # preventing those exploits
    "oops=panic"

    # Only allow kernel modules that have been signed with a valid key to be
    # loaded, which increases security by making it much harder to load a
    # malicious kernel module
    "module.sig_enforce=1"

    # The kernel lockdown LSM can eliminate many methods that user space code
    # could abuse to escalate to kernel privileges and extract sensitive
    # information. This LSM is necessary to implement a clear security boundary
    # between user space and the kernel
    "lockdown=confidentiality"

    # These parameters prevent information leaks during boot and must be used
    # in combination with the kernel.printk
    # "quiet" "loglevel=0"
  ];

  boot.kernel.sysctl = {
    # Prevent boot console kernel log information leaks
    # "kernel.printk" = "3 3 3 3";

    # Restrict loading TTY line disciplines to the CAP_SYS_MODULE capability to
    # prevent unprivileged attackers from loading vulnerable line disciplines with
    # the TIOCSETD ioctl
    "dev.tty.ldisc_autoload" = "0";

    # The Magic SysRq key is a key combo that allows users connected to the
    # system console of a Linux kernel to perform some low-level commands.
    # Disable it, since we don't need it, and is a potential security concern.
    "kernel.sysrq" = 0;

    # Restrict usage of ptrace to only processes with the CAP_SYS_PTRACE
    # capability
    "kernel.yama.ptrace_scope" = "2";

    ###
    # TCP hardening
    #

    # Prevent bogus ICMP errors from filling up logs.
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;

    # Reverse path filtering causes the kernel to do source validation of
    # packets received from all interfaces. This can mitigate IP spoofing.
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;

    # Do not accept IP source route packets (we're not a router)
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;

    # Don't send ICMP redirects (again, we're not a router)
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;

    # Disable accepting IPv6 router advertisements
    "net.ipv6.conf.all.accept_ra" = "0";
    "net.ipv6.default.accept_ra" = "0";

    # Refuse ICMP redirects (MITM mitigations)
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;

    # Protects against SYN flood attacks
    "net.ipv4.tcp_syncookies" = 1;

    # Incomplete protection again TIME-WAIT assassination
    "net.ipv4.tcp_rfc1337" = 1;

    # Disable TCP SACK. SACK is commonly exploited and unnecessary for many circumstances
    "net.ipv4.tcp_sack" = "0";
    "net.ipv4.tcp_dsack" = "0";

    # Avoid leaking system time with TCP timestamps
    "net.ipv4.tcp_timestamps" = "0";

    ###
    # TCP optimization

    # TCP Fast Open is a TCP extension that reduces network latency by packing
    # data in the sender’s initial TCP SYN. Setting 3 = enable TCP Fast Open for
    # both incoming and outgoing connections:
    "net.ipv4.tcp_fastopen" = 3;

    # Bufferbloat mitigations + slight improvement in throughput & latency
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "cake";

    # Only swap when absolutely necessary
    "vm.swappiness" = "1";
  };

  # services.usbguard.enable = true;
}
