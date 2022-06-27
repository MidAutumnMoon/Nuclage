{ lib }:

with lib.kernel;

let

  inherit (lib)
    mkForce;

  forceNo =
    mkForce no;

  forceOptionNo =
    mkForce (option no);

in

{

  ANDROID = forceNo;
  SURFACE_PLATFORMS = forceNo;

  CHROME_PLATFORMS = forceNo;
  CHROMEOS_TBMC = forceOptionNo;
  CROS_EC = forceOptionNo;
  CROS_EC_I2C = forceOptionNo;
  CROS_EC_SPI = forceOptionNo;
  CROS_EC_LPC = forceOptionNo;
  CROS_EC_ISHTP = forceOptionNo;
  CROS_KBD_LED_BACKLIGHT = forceOptionNo;
  CHROMEOS_LAPTOP = forceOptionNo;
  CHROMEOS_PSTORE = forceOptionNo;


  #
  # Drivers
  #
  PCCARD = no;
  RAPIDIO = no;
  COMEDI = no;
  VIRT_DRIVERS = forceNo;
  ACCESSIBILITY = forceNo;
  GREYBUS = no;
  STAGING = forceNo;

    # SCSI
    SCSI_PROC_FS = no;
    SCSI_LOWLEVEL_PCMCIA = forceOptionNo;

    # Input devices
    MOUSE_PS2_VMMOUSE = forceOptionNo;

    # Mutlimedia
    MEDIA_CAMERA_SUPPORT = forceNo;
    MEDIA_ANALOG_TV_SUPPORT = forceNo;
    MEDIA_DIGITAL_TV_SUPPORT = forceNo;
    MEDIA_CONTROLLER = forceOptionNo;
    MEDIA_ATTACH = mkForce (option yes);
    VIDEO_STK1160_COMMON = forceOptionNo;

    # Graphics
    DRM_GUD = no;
    DRM_I915 = no;
    DRM_I915_GVT = forceOptionNo;
    DRM_I915_GVT_KVMGT = forceOptionNo;
    DRM_GMA500 = forceNo;
    DRM_ETNAVIV = no;
    DRM_CIRRUS_QEMU = no;
    DRM_GM12U320 = no;
    DRM_BOCHS = no;
    DRM_RADEON = no;
    DRM_NOUVEAU = no;
    DRM_MGAG200 = no;
    DRM_AST = no;
    DRM_VMWGFX = no;
    DRM_VMWGFX_FBCON = forceOptionNo;
    DRM_QXL = no;
    TINYDRM_ST7735R = no;
    TINYDRM_ST7586 = no;
    TINYDRM_REPAPER = no;
    TINYDRM_MI0283QT = no;
    TINYDRM_ILI9486 = no;
    TINYDRM_ILI9341 = no;
    TINYDRM_ILI9225 = no;
    TINYDRM_HX8357D = no;

    # X86
    HUAWEI_WMI = no;
    PEAQ_WMI = no;
    XIAOMI_WMI = no;
    GIGABYTE_WMI = no;
    YOGABOOK_WMI = no;
    ACER_WMI = no;
    ACERHDF = no;
    ACER_WIRELESS = no;
    ADV_SWBUTTON = no;
    APPLE_GMUX = no;
    MERAKI_MX100 = no;
    EEEPC_LAPTOP = no;
    EEEPC_WMI = no;
    X86_PLATFORM_DRIVERS_DELL = forceNo;
    AMILO_RFKILL = no;
    FUJITSU_LAPTOP = no;
    FUJITSU_TABLET = no;
    GPD_POCKET_FAN = no;
    HP_ACCEL = no;
    HP_WMI = no;
    IBM_RTL = no;
    IDEAPAD_LAPTOP = no;
    SENSORS_HDAPS = no;
    THINKPAD_ACPI = no;
    THINKPAD_LMI = no;
    INTEL_ATOMISP2_LED = no;
    INTEL_ATOMISP2_PM = no;
    INTEL_SAR_INT1092 = no;
    INTEL_SKL_INT3472 = no;
    INTEL_PMC_CORE = no;
    INTEL_SPEED_SELECT_INTERFACE = no;
    INTEL_TELEMETRY = forceOptionNo;
    INTEL_WMI_SBL_FW_UPDATE = no;
    INTEL_WMI_THUNDERBOLT = no;
    INTEL_UNCORE_FREQ_CONTROL = no;
    INTEL_HID_EVENT = no;
    INTEL_VBTN = no;
    INTEL_INT0002_VGPIO = no;
    INTEL_OAKTRAIL = no;
    INTEL_BXTWC_PMIC_TMU = no;
    INTEL_MRFLD_PWRBTN = forceOptionNo;
    INTEL_PUNIT_IPC = no;
    INTEL_RST = no;
    INTEL_SMARTCONNECT = no;
    MSI_LAPTOP = no;
    MSI_WMI = no;
    PCENGINES_APU2 = no;
    SAMSUNG_LAPTOP = no;
    SAMSUNG_Q10 = no;
    TOSHIBA_BT_RFKILL = no;
    TOSHIBA_HAPS = no;
    TOSHIBA_WMI = no;
    ACPI_CMPC = no;
    COMPAL_LAPTOP = no;
    LG_LAPTOP = no;
    PANASONIC_LAPTOP = no;
    SONY_LAPTOP = no;
    SYSTEM76_ACPI = no;
    TOPSTAR_LAPTOP = no;
    MLX_PLATFORM = no;
    X86_ANDROID_TABLETS = no;
    INTEL_IPS = no;
    INTEL_SCU_PLATFORM = no;
    SIEMENS_SIMATIC_IPC = no;

    # Sound
    SND_SOC_INTEL_SOUNDWIRE_SOF_MACH = forceOptionNo;

    # Misc
    HABANA_AI = no;
    AD525X_DPOT = no;
    IBM_ASM = no;
    PHANTOM = no;
    INFINIBAND = forceNo;
    INFINIBAND_IPOIB = forceOptionNo;
    INFINIBAND_IPOIB_CM = forceOptionNo;
    IIO = no;
    NTB = no;
    IPACK_BUS = no;
    MOST = no;
    UNISYS_VISORBUS = no;
    SIOX = no;
    SLIMBUS = no;
    COUNTER = no;
    STM = no;
    INTEL_TH = no;
    MCB = no;
    FPGA = no;
    RESET_TI_SYSCON = no;
    SOUNDWIRE = no;


  #
  # FS
  #

  # MISC_FILESYSTEMS
  ORANGEFS_FS = no;
  ADFS_FS = no;
  AFFS_FS = no;
  ECRYPT_FS = no;
  HFS_FS = no;
  HFSPLUS_FS = no;
  BEFS_FS = no;
  BFS_FS = no;
  EFS_FS = no;
  JFFS2_FS = no;
  UBIFS_FS = no;
  CRAMFS = no;
  VXFS_FS = no;
  MINIX_FS = no;
  OMFS_FS = no;
  HPFS_FS = no;
  QNX4FS_FS = no;
  QNX6FS_FS = no;
  SYSV_FS = no;
  UFS_FS = no;
  EROFS_FS = no;


  #
  # Processor type and features
  #
  HYPERVISOR_GUEST = forceNo;
  XEN = forceOptionNo;
  KVM_GUEST = forceOptionNo;
  X86_EXTENDED_PLATFORM = no;
}
