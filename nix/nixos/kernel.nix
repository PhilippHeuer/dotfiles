{
  lib,
  pkgs,
  config,
  ...
}:

{
  boot = {
    # enable in-memory /tmp
    # tmp.useTmpfs = true;
    tmp.cleanOnBoot = !config.boot.tmp.useTmpfs;

    # supported filesystems
    supportedFilesystems = [ "ntfs" ];

    # kernel packages
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

    # kernel parameters
    kernelParams = lib.optionals config.boot.initrd.systemd.enable [
      #"systemd.show_status=false" # hide boot information
      #"quiet" # hide splash screen
      #"fbcon=nodefer" # disable framebuffer console

      "preempt=full" # kernel preemption
      #"vt.global_cursor_default=0"
      #"kernel.modules_disabled=1"
      #"lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
      #"usbcore.autosuspend=-1"
      #"video4linux"
      #"acpi_rev_override=5"
      #"security=selinux"
    ];

    # kernel sysctl
    kernel.sysctl = {
      # performance
      "kernel.sched_cfs_bandwidth_slice_us" = 3000;
      "vm.max_map_count" = 2147483642;
      "fs.inotify.max_user_instances" = 8192;
      "fs.inotify.max_user_watches" = 524288;

      # network
      "net.ipv4.tcp_fin_timeout" = 5; # reduce TCP FIN timeout
      #"net.ipv4.conf.all.forwarding" = 1;
      #"net.ipv6.conf.all.forwarding" = 1;
      #"net.ipv4.conf.all.accept_redirects" = 1;
      #"net.ipv6.conf.all.accept_redirects" = 1;

      # security
      "kernel.dmesg_restrict" = 1; # restrict access to dmesg messages

      # misc
      "kernel.sysrq" = 1; # enable sysrq
    };

    #extraModprobeConfig = ''
    #  options vfio_iommu_type1 allow_unsafe_interrupts=1
    #  options kvm ignore_msrs=1
    #  options kvm report_ignored_msrs=0
    #'';

    # initrd systemd
    initrd.systemd.enable = lib.mkDefault true;
  };

  # enable in-memory compression and swap by zram kernel module
  zramSwap.enable = lib.mkDefault true;

  # enable firmware
  # hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  # update AMD microcode
  hardware.cpu.amd.updateMicrocode = true;

  environment.systemPackages = with pkgs; [
    policycoreutils # SELinux
  ];

  # eBPF scheduling extensions (sched-ext)
  #services.scx = {
  #  enable = true;
  #  scheduler = "sxc_lavd";
  #};
}
