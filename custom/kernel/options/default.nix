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

  KUNIT = no;
  EXPERT = yes;


  #
  # Networking
  #
  QRTR = no;
  HSR = no;
  TCP_CONG_BIC = no;
  TCP_CONG_WESTWOOD = no;
  TCP_CONG_HTCP = no;
  TCP_CONG_HSTCP = no;
  TCP_CONG_HYBLA = no;
  TCP_CONG_NV = no;
  TCP_CONG_YEAH = no;
  TCP_CONG_VEGAS = no;
  TCP_CONG_SCALABLE = no;
  TCP_CONG_LP = no;
  TCP_CONG_VENO = no;
  TCP_CONG_ILLINOIS = no;
  TCP_CONG_DCTCP = no;
  TCP_CONG_CDG = no;
  TCP_CONG_BBR = module;
  NETLABEL = no;
  IP_DCCP = no;
  IP_DCCP_CCID3 = forceOptionNo;
  IP_SCTP = no;
  RDS = no;
  TIPC = no;
  ATM = no;
  L2TP = no;
  L2TP_ETH = forceOptionNo;
  L2TP_IP = forceOptionNo;
  L2TP_V3 = forceOptionNo;
  NET_DSA = no;
  DECNET = no;
  LLC2 = no;
  ATALK = no;
  X25 = no;
  LAPB = no;
  PHONET = no;
  "6LOWPAN" = no;
  IEEE802154 = no;
  BATMAN_ADV = no;
  OPENVSWITCH = no;
  VSOCKETS = no;
  MPLS = no;
  NET_NSH = no;
  CEPH_LIB = no;
  NFC = no;
  CAIF = no;
  CAN = no;
    # Bluetooth
    BT_HCIBTUSB_BCM = no;
    BT_HCIBTUSB_MTK = forceNo;
    BT_HCIVHCI = no;
    BT_HCIBTUSB_RTL = no;
    BT_MRVL = no;
    BT_HCIBFUSB = no;
    BT_HCIUART = forceNo;
    BT_HCIUART_QCA = forceOptionNo;
    BT_HCIUART_SERDEV = forceOptionNo;
    BT_QCA = forceOptionNo;
    BT_ATH3K = no;
    BT_MTKUART = no;
    BT_VIRTIO = no;
    BT_HCIBPA10X = no;
    BT_HCIBCM203X = no;


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
  HSI = no;
  FW_CFG_SYSFS = no;
  RC_CORE = forceNo;
  LIRC = forceOptionNo;
  RC_MAP = forceOptionNo;
  MMC = no; #?
  MMC_BLOCK_MINORS = mkForce (option (freeform "32"));
  MEMSTICK = no;
  AUXDISPLAY = forceNo;

    # SCSI
    SCSI_PROC_FS = no;
    SCSI_LOWLEVEL_PCMCIA = forceOptionNo;
    SCSI_LOWLEVEL = forceNo;
    CHR_DEV_ST = no;
    MEGARAID_NEWGEN = forceOptionNo;
    AIC79XX_DEBUG_ENABLE = forceOptionNo;
    AIC7XXX_DEBUG_ENABLE = forceOptionNo;
    AIC94XX_DEBUG = forceOptionNo;

    # Character device
    SERIAL_NONSTANDARD = no;
    NOZOMI = no;
    IPMI_HANDLER = no;
    IPMB_DEVICE_INTERFACE = no;
    HW_RANDOM_INTEL = no;
    HW_RANDOM_BA431 = no;
    HW_RANDOM_VIA = no;
    HW_RANDOM_VIRTIO = no;
    HW_RANDOM_XIPHERA = no;
    APPLICOM = no;
    MWAVE = no;
    TELCLOCK = no;
    XILLYBUS = no;
    XILLYUSB = no;

    # I2C

    # GPIO
    GPIO_DWAPB = no;
    GPIO_EXAR = no;

    # Hardware monitor
    SENSORS_ABITUGURU = no;
    SENSORS_ABITUGURU3 = no;
    SENSORS_AD7314 = no;
    SENSORS_AXI_FAN_CONTROL = no;
    SENSORS_AD7418 = no;
    SENSORS_ADM1021 = no;
    SENSORS_ADM1025 = no;
    SENSORS_ADM1026 = no;
    SENSORS_ADM1029 = no;
    SENSORS_ADM1031 = no;
    SENSORS_ADM1177 = no;
    SENSORS_ADM9240 = no;
    SENSORS_ADT7310 = no;
    SENSORS_ADT7410 = no;
    SENSORS_ADT7411 = no;
    SENSORS_ADT7462 = no;
    SENSORS_ADT7470 = no;
    SENSORS_ADT7475 = no;
    SENSORS_AHT10 = no;
    SENSORS_AQUACOMPUTER_D5NEXT = no;
    SENSORS_AS370 = no;
    SENSORS_ASC7621 = no;
    SENSORS_K8TEMP = no;
    SENSORS_K10TEMP = no;
    SENSORS_APPLESMC = no;
    SENSORS_ASB100 = no;
    SENSORS_ASPEED = no;
    SENSORS_ATXP1 = no;
    SENSORS_CORSAIR_CPRO = no;
    SENSORS_CORSAIR_PSU = no;
    SENSORS_DRIVETEMP = no;
    SENSORS_DS620 = no;
    SENSORS_DS1621 = no;
    SENSORS_DELL_SMM = no;
    SENSORS_I5K_AMB = no;
    SENSORS_F71805F = no;
    SENSORS_F71882FG = no;
    SENSORS_F75375S = no;
    SENSORS_MC13783_ADC = no;
    SENSORS_FSCHMD = no;
    SENSORS_FTSTEUTATES = no;
    SENSORS_GL518SM = no;
    SENSORS_GL520SM = no;
    SENSORS_G760A = no;
    SENSORS_G762 = no;
    SENSORS_HIH6130 = no;
    SENSORS_I5500 = no;
    SENSORS_CORETEMP = no;
    SENSORS_IT87 = no;
    SENSORS_JC42 = no;
    SENSORS_POWR1220 = no;
    SENSORS_LINEAGE = no;
    SENSORS_LTC2945 = no;
    SENSORS_LTC2947_I2C = no;
    SENSORS_LTC2947_SPI = no;
    SENSORS_LTC2990 = no;
    SENSORS_LTC2992 = no;
    SENSORS_LTC4151 = no;
    SENSORS_LTC4215 = no;
    SENSORS_LTC4222 = no;
    SENSORS_LTC4245 = no;
    SENSORS_LTC4260 = no;
    SENSORS_LTC4261 = no;
    SENSORS_MAX1111 = no;
    SENSORS_MAX127 = no;
    SENSORS_MAX16065 = no;
    SENSORS_MAX1619 = no;
    SENSORS_MAX1668 = no;
    SENSORS_MAX197 = no;
    SENSORS_MAX31722 = no;
    SENSORS_MAX31730 = no;
    SENSORS_MAX6620 = no;
    SENSORS_MAX6621 = no;
    SENSORS_MAX6639 = no;
    SENSORS_MAX6642 = no;
    SENSORS_MAX6650 = no;
    SENSORS_MAX6697 = no;
    SENSORS_MAX31790 = no;
    SENSORS_MCP3021 = no;
    SENSORS_TC654 = no;
    SENSORS_TPS23861 = no;
    SENSORS_MENF21BMC_HWMON = no;
    SENSORS_MR75203 = no;
    SENSORS_ADCXX = no;
    SENSORS_LM63 = no;
    SENSORS_LM70 = no;
    SENSORS_LM73 = no;
    SENSORS_LM75 = no;
    SENSORS_LM77 = no;
    SENSORS_LM78 = no;
    SENSORS_LM80 = no;
    SENSORS_LM83 = no;
    SENSORS_LM85 = no;
    SENSORS_LM87 = no;
    SENSORS_LM90 = no;
    SENSORS_LM92 = no;
    SENSORS_LM93 = no;
    SENSORS_LM95234 = no;
    SENSORS_LM95241 = no;
    SENSORS_LM95245 = no;
    SENSORS_AD7414 = no;
    SENSORS_PC87360 = no;
    SENSORS_PC87427 = no;
    SENSORS_NCT6683 = no;
    SENSORS_NCT6775 = no;
    SENSORS_NCT7802 = no;
    SENSORS_NCT7904 = no;
    SENSORS_NPCM7XX = no;
    SENSORS_NZXT_KRAKEN2 = no;
    SENSORS_NZXT_SMART2 = no;
    SENSORS_PCF8591 = no;
    SENSORS_PECI_CPUTEMP = no;
    SENSORS_PECI_DIMMTEMP = no;
    PMBUS = no;
    SENSORS_SBTSI = no;
    SENSORS_SBRMI = no;
    SENSORS_SHT15 = no;
    SENSORS_SHT21 = no;
    SENSORS_SHT3x = no;
    SENSORS_SHT4x = no;
    SENSORS_SHTC1 = no;
    SENSORS_SIS5595 = no;
    SENSORS_SY7636A = no;
    SENSORS_DME1737 = no;
    SENSORS_EMC1403 = no;
    SENSORS_EMC2103 = no;
    SENSORS_EMC6W201 = no;
    SENSORS_SMSC47M1 = no;
    SENSORS_SMSC47M192 = no;
    SENSORS_SMSC47B397 = no;
    SENSORS_SCH5627 = no;
    SENSORS_SCH5636 = no;
    SENSORS_STTS751 = no;
    SENSORS_SMM665 = no;
    SENSORS_ADC128D818 = no;
    SENSORS_ADS7828 = no;
    SENSORS_ADS7871 = no;
    SENSORS_AMC6821 = no;
    SENSORS_INA209 = no;
    SENSORS_INA2XX = no;
    SENSORS_INA238 = no;
    SENSORS_INA3221 = no;
    SENSORS_TC74 = no;
    SENSORS_THMC50 = no;
    SENSORS_TMP102 = no;
    SENSORS_TMP103 = no;
    SENSORS_TMP108 = no;
    SENSORS_TMP401 = no;
    SENSORS_TMP421 = no;
    SENSORS_TMP464 = no;
    SENSORS_TMP513 = no;
    SENSORS_VIA_CPUTEMP = no;
    SENSORS_VIA686A = no;
    SENSORS_VT1211 = no;
    SENSORS_VT8231 = no;
    SENSORS_W83773G = no;
    SENSORS_W83781D = no;
    SENSORS_W83791D = no;
    SENSORS_W83792D = no;
    SENSORS_W83793 = no;
    SENSORS_W83795 = no;
    SENSORS_W83L785TS = no;
    SENSORS_W83L786NG = no;
    SENSORS_W83627HF = no;
    SENSORS_W83627EHF = no;
    SENSORS_XGENE = no;
    SENSORS_INTEL_M10_BMC_HWMON = no;
    SENSORS_ASUS_EC = no;

    # Power supply
    #:continue
    PDA_POWER = no;
    IP5XXX_POWER = no;
    TEST_POWER = no;
    CHARGER_LTC4162L = no;
    CHARGER_ADP5061 = no;
    CHARGER_MAX14577 = no;
    CHARGER_MAX77693 = no;
    CHARGER_MAX77976 = no;
    CHARGER_MT6360 = no;
    CHARGER_BQ2415X = no;
    CHARGER_BQ24190 = no;
    CHARGER_BQ24257 = no;
    CHARGER_BQ24735 = no;
    CHARGER_BQ2515X = no;
    CHARGER_BQ25890 = no;
    CHARGER_BQ25980 = no;
    CHARGER_BQ256XX = no;
    CHARGER_SMB347 = no;
    CHARGER_LT3651 = no;

    # Input devices
    #:continue
    MOUSE_PS2_VMMOUSE = forceOptionNo;

    # Mutlimedia
    MEDIA_SUPPORT = forceNo;
    MEDIA_CAMERA_SUPPORT = forceOptionNo;
    MEDIA_ANALOG_TV_SUPPORT = forceOptionNo;
    MEDIA_DIGITAL_TV_SUPPORT = forceOptionNo;
    MEDIA_CONTROLLER = forceOptionNo;
    MEDIA_ATTACH = forceOptionNo;
    MEDIA_PCI_SUPPORT = forceOptionNo;
    MEDIA_USB_SUPPORT = forceOptionNo;
    VIDEO_STK1160_COMMON = forceOptionNo;

    # USB
    USB_MON = no;
    USB_C67X00_HCD = no;
    USB_OXU210HP_HCD = no;
    USB_MDC800 = no;
    USB_ISP116X_HCD = no;
    USB_FOTG210_HCD = no;
    USB_MAX3421_HCD = no;
    USB_SL811_HCD = no;
    USB_R8A66597_HCD = no;
    USB_HCD_BCMA = no;
    USB_HCD_SSB = no;
    USB_ACM = no;
    USB_PRINTER = no;
    USB_TMC = no;
    USB_STORAGE_REALTEK = no;
    USB_STORAGE_DATAFAB = no;
    USB_STORAGE_FREECOM = no;
    USB_STORAGE_ISD200 = no;
    USB_STORAGE_USBAT = no;
    USB_STORAGE_JUMPSHOT = no;
    USB_STORAGE_SDDR09 = no;
    USB_STORAGE_SDDR55 = no;
    USB_STORAGE_ALAUDA = no;
    USB_STORAGE_ONETOUCH = no;
    USB_STORAGE_KARMA = no;
    USB_STORAGE_CYPRESS_ATACB = no;
    USB_STORAGE_ENE_UB6250 = no;
    USB_MICROTEK = no;
    USBIP_CORE = no;
    USB_CDNS_SUPPORT = no;
    USB_MUSB_HDRC = no;
    USB_DWC3 = no;
    USB_DWC2 = no;
    USB_CHIPIDEA = no;
    USB_ISP1760 = no;
    USB_SERIAL = no;
    USB_SERIAL_GENERIC = forceOptionNo;
      # Misc drivers
      USB_EMI62 = no;
      USB_EMI26 = no;
      USB_ADUTUX = no;
      USB_SEVSEG = no;
      USB_LEGOTOWER = no;
      USB_LCD = no;
      USB_CYPRESS_CY7C63 = no;
      USB_CYTHERM = no;
      USB_IDMOUSE = no;
      USB_FTDI_ELAN = no;
      USB_APPLEDISPLAY = no;
      APPLE_MFI_FASTCHARGE = no;
      USB_SISUSBVGA = no;
      USB_LD = no;
      USB_TRANCEVIBRATOR = no;
      USB_IOWARRIOR = no;
      USB_TEST = no;
      USB_EHSET_TEST_FIXTURE = no;
      USB_ISIGHTFW = no;
      USB_YUREX = no;
      USB_EZUSB_FX2 = no;
      USB_HUB_USB251XB = no;
      USB_HSIC_USB3503 = no;
      USB_HSIC_USB4604 = no;
      USB_LINK_LAYER_TEST = no;
      USB_CHAOSKEY = no;
      NOP_USB_XCEIV = no;
      USB_GPIO_VBUS = no;
      TAHVO_USB = no;
      USB_ISP1301 = no;
    USB_FOTG210_UDC = no;
    USB_GR_UDC = no;
    USB_R8A66597 = no;
    USB_PXA27X = no;
    USB_MV_UDC = no;
    USB_MV_U3D = no;
    USB_M66592 = no;
    USB_BDC_UDC = no;
    USB_AMD5536UDC = no;
    USB_NET2272 = no;
    USB_NET2280 = no;
    USB_GOKU = no;
    USB_EG20T = no;
    USB_MAX3420_UDC = no;
    USB_DUMMY_HCD = no;

    # Graphics
    #:continue
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
    #:continue
    SND_SOC_INTEL_SOUNDWIRE_SOF_MACH = forceOptionNo;
    SND_VIRMIDI = no;
      # HD audio
      SND_HDA_SCODEC_CS35L41_I2C = no;
      SND_HDA_SCODEC_CS35L41_SPI = no;
      SND_HDA_CODEC_ANALOG = no;
      SND_HDA_CODEC_SIGMATEL = no;
      SND_HDA_CODEC_VIA = no;
      SND_HDA_CODEC_CIRRUS = no;
      SND_HDA_CODEC_CS8409 = no;
      SND_HDA_CODEC_CONEXANT = no;
      SND_HDA_CODEC_CA0110 = no;
      SND_HDA_CODEC_CA0132 = no;
      SND_HDA_CODEC_CMEDIA = no;
      SND_HDA_CODEC_SI3054 = no;
      # SoC
      SND_SOC_ADI = no;
      SND_ATMEL_SOC = no;
      SND_BCM63XX_I2S_WHISTLER = no;
      SND_DESIGNWARE_I2S = no;
      SND_SOC_FSL_ASRC = no;
      SND_SOC_FSL_SAI = no;
      SND_SOC_FSL_AUDMIX = no;
      SND_SOC_FSL_SSI = no;
      SND_SOC_FSL_SPDIF = no;
      SND_SOC_FSL_ESAI = no;
      SND_SOC_FSL_MICFIL = no;
      SND_SOC_FSL_XCVR = no;
      SND_SOC_FSL_RPMSG = no;
      SND_SOC_IMX_AUDMUX = no;
      SND_I2S_HI6210_I2S = no;
      SND_SOC_INTEL_SST_TOPLEVEL = no;
      SND_SOC_INTEL_AVS = no;
      SND_SOC_MTK_BTCVSD = no;
      SND_SOC_SOF_INTEL_TOPLEVEL = forceNo;
      SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES = forceOptionNo;
      SND_SOC_SOF_APOLLOLAKE = forceOptionNo;
      SND_SOC_SOF_CANNONLAKE = forceOptionNo;
      SND_SOC_SOF_COFFEELAKE = forceOptionNo;
      SND_SOC_SOF_COMETLAKE = forceOptionNo;
      SND_SOC_SOF_ELKHARTLAKE = forceOptionNo;
      SND_SOC_SOF_GEMINILAKE = forceOptionNo;
      SND_SOC_SOF_HDA_AUDIO_CODEC = forceOptionNo;
      SND_SOC_SOF_HDA_LINK = forceOptionNo;
      SND_SOC_SOF_ICELAKE = forceOptionNo;
      SND_SOC_SOF_JASPERLAKE = forceOptionNo;
      SND_SOC_SOF_MERRIFIELD = forceOptionNo;
      SND_SOC_SOF_TIGERLAKE = forceOptionNo;
      SND_SOC_XILINX_I2S = no;
      SND_SOC_XILINX_AUDIO_FORMATTER = no;
      SND_SOC_XILINX_SPDIF = no;
      SND_SOC_XTFPGA_I2S = no;
        # Codec
        SND_SOC_ADAU1372_I2C = no;
        SND_SOC_ADAU1372_SPI = no;
        SND_SOC_ADAU1761_SPI = no;
        SND_SOC_ADAU7118_HW = no;
        SND_SOC_ADAU7118_I2C = no;
        SND_SOC_AK4104 = no;
        SND_SOC_AK4118 = no;
        SND_SOC_AK4375 = no;
        SND_SOC_AK4458 = no;
        SND_SOC_AK4554 = no;
        SND_SOC_AK4613 = no;
        SND_SOC_AK4642 = no;
        SND_SOC_AK5386 = no;
        SND_SOC_AK5558 = no;

    # Block devices
    BLK_DEV_FD = no;
    BLK_DEV_DRBD = no;
    BLK_DEV_NBD = no;
    BLK_DEV_SX8 = no;
    CDROM_PKTCDVD = no;
    ATA_OVER_ETH = no;
    VIRTIO_BLK = no;
    BLK_DEV_RBD = no;

    # NVMe
    NVME_TCP = no;
    NVME_FC = no;
    NVME_TARGET_FC = no;
    NVME_TARGET_TCP = no;

    # Misc
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
    SOUNDWIRE = no;
    GNSS = no;
    PARPORT = no;
    FUSION = forceNo;
    TARGET_CORE = no;
    FIREWIRE = no;
    FIREWIRE_NOSY = no;
    MACINTOSH_DRIVERS = no;

    # Misc devices
    HABANA_AI = no;
    AD525X_DPOT = no;
    IBM_ASM = no;
    PHANTOM = no;
    ICS932S401 = no;
    HP_ILO = no;
    APDS9802ALS = no;
    ISL29003 = no;
    ISL29020 = no;
    SENSORS_TSL2550 = no;
    SENSORS_BH1770 = no;
    BCM_VK = no;
    MISC_RTSX_USB = no;
    MISC_RTSX_PCI = no;
    MISC_ALCOR_PCI = no;
    ECHO = no;
    GENWQE = no;
    VMWARE_VMCI = no;
    SENSORS_APDS990X = no;
    HMC6352 = no;
    DS1682 = no;
    LATTICE_ECP3_CONFIG = no;
    DW_XDATA_PCIE = no;
    XILINX_SDFEC = no;
    C2PORT = no;
    TI_ST = no;
    EEPROM_AT24 = no;
    EEPROM_AT25 = no;
    EEPROM_LEGACY = no;
    EEPROM_MAX6875 = no;
    EEPROM_93XX46 = no;
    EEPROM_IDT_89HPESX = no;
    EEPROM_EE1004 = no;
    SENSORS_LIS3_I2C = no;
    INTEL_MEI = no;
    INTEL_MEI_ME = no;
    INTEL_MEI_TXE = no;

    # libata
    SATA_INIC162X = no;
    SATA_ACARD_AHCI = no;
    SATA_SIL24 = no;

    # Network device
    EQUALIZER = no;
    NET_FC = forceNo;
    IFB = no;
    GTP = no;
    BAREUDP = no;
    GENEVE = no;
    ARCNET = no;
    ATM_DRIVERS = option no;
    PPP = no;
    PPP_FILTER = forceOptionNo;
    PPP_MULTILINK = forceOptionNo;
    SLIP = no;
    SLIP_COMPRESSED = forceOptionNo;
    SLIP_SMART = forceOptionNo;
    MICREL_KS8995MA = no;
    NET_SB1000 = no;
      # Ethernet drivers
      ETHERNET = no;
      "8139TOO_8129" = forceOptionNo;
      "8139TOO_PIO" = forceOptionNo;
    FDDI = no;
    HIPPI = forceNo;
    MHI_NET = no;
    PCS_XPCS = no;
      # USB ethernet
      USB_CATC = no;
      USB_KAWETH = no;
      USB_PEGASUS = no;
      USB_NET_ZAURUS = no;
      USB_NET_KALMIA = no;
      USB_NET_QMI_WWAN = no;
      USB_HSO = no;
      USB_NET_INT51X1 = no;
      USB_SIERRA_NET = no;
      USB_VL600 = no;
      USB_NET_CH9200 = no;
      USB_NET_AQC111 = no;
      USB_RTL8153_ECM = no;
      USB_RTL8150 = no;
      USB_RTL8152 = no;
      USB_LAN78XX = no;
      USB_NET_CX82310_ETH = no;
      USB_ARMLINUX = no;
      USB_BELKIN = no;
    WAN = forceNo;
    WWAN = no;
      # Wireless LAN
      WLAN_VENDOR_ADMTEK = no;
      WLAN_VENDOR_ATH = no;
      WLAN_VENDOR_ATMEL = no;
      WLAN_VENDOR_BROADCOM = no;
      WLAN_VENDOR_CISCO = no;
      WLAN_VENDOR_INTERSIL = no;
      WLAN_VENDOR_MARVELL = no;
      WLAN_VENDOR_MEDIATEK = no;
      WLAN_VENDOR_MICROCHIP = no;
      WLAN_VENDOR_RALINK = no;
      WLAN_VENDOR_REALTEK = no;
      WLAN_VENDOR_RSI = no;
      WLAN_VENDOR_ST = no;
      WLAN_VENDOR_TI = no;
      WLAN_VENDOR_ZYDAS = no;
      WLAN_VENDOR_QUANTENNA = no;
      MAC80211_HWSIM = no;
      USB_NET_RNDIS_WLAN = no;
      RT2800USB_RT53XX = forceOptionNo;
      RT2800USB_RT55XX = forceOptionNo;
      RTW88 = forceOptionNo;
      RTW88_8822BE = forceOptionNo;
      RTW88_8822CE = forceOptionNo;
    VMXNET3 = no;
    FUJITSU_ES = no;

    # HID
    HID_A4TECH = no;
    HID_ACCUTOUCH = no;
    HID_ACRUX = no;
    HID_ACRUX_FF = forceOptionNo;
    HID_APPLE = no;
    HID_APPLEIR = no;
    HID_AUREAL = no;
    HID_BELKIN = no;
    HID_BETOP_FF = no;
    HID_BIGBEN_FF = no;
    HID_CHERRY = no;
    INTEL_ISH_HID = no;
    HID_CHICONY = no;
    HID_CORSAIR = no;
    HID_COUGAR = no;
    HID_MACALLY = no;
    HID_PRODIKEYS = no;
    HID_CMEDIA = no;
    HID_CP2112 = no;
    HID_CREATIVE_SB0540 = no;
    HID_CYPRESS = no;
    HID_DRAGONRISE = no;
    DRAGONRISE_FF = forceOptionNo;
    HID_EMS_FF = no;
    HID_PICOLCD = no;
    HID_MCP2221 = no;
    HID_ALPS = no;
    HID_ZYDACRON = no;
    HID_ZEROPLUS = no;
    ZEROPLUS_FF = forceOptionNo;
    HID_XINMO = no;
    HID_WIIMOTE = no;
    HID_WACOM = no;
    HID_U2FZERO = no;
    HID_UDRAW_PS3 = no;
    HID_THRUSTMASTER = no;
    THRUSTMASTER_FF = forceOptionNo;
    HID_THINGM = no;
    HID_TOPSEED = no;
    HID_TIVO = no;
    HID_SMARTJOYPLUS = no;
    SMARTJOYPLUS_FF = forceOptionNo;
    HID_GREENASIA = no;
    GREENASIA_FF = forceOptionNo;
    HID_ELAN = no;
    HID_ELECOM = no;
    HID_ELO = no;
    HID_EZKEY = no;
    HID_FT260 = no;
    HID_GEMBIRD = no;
    HID_GFRM = no;
    HID_GLORIOUS = no;
    HID_HOLTEK = no;
    HOLTEK_FF = forceOptionNo;
    HID_VIVALDI = no;
    HID_MAGICMOUSE = no;
    HID_MALTRON = no;
    HID_MAYFLASH = no;
    HID_REDRAGON = no;
    HID_PLAYSTATION = no;
    PLAYSTATION_FF = forceOptionNo;
    HID_SONY = no;
    SONY_FF = forceOptionNo;
    HID_MICROSOFT = no;
    HID_LENOVO = no;
    HID_PLANTRONICS = no;
    HID_RMI = no;
    HID_SUNPLUS = no;
    HID_STEELSERIES = no;
    HID_STEAM = no;
    HID_SPEEDLINK = no;
    HID_SIGMAMICRO = no;
    HID_SEMITEK = no;
    HID_SAMSUNG = no;
    HID_GT683R = no;
    HID_KEYTOUCH = no;
    HID_KYE = no;
    HID_UCLOGIC = no;
    HID_WALTOP = no;
    HID_VIEWSONIC = no;
    HID_XIAOMI = no;
    HID_GYRATION = no;
    HID_ICADE = no;
    HID_ITE = no;
    HID_JABRA = no;
    HID_TWINHAN = no;
    HID_KENSINGTON = no;
    HID_LCPOWER = no;
    HID_LED = no;
    HID_LETSKETCH = no;
    HID_MONTEREY = no;
    HID_NTI = no;
    HID_NTRIG = no;
    HID_ORTEK = no;
    HID_PANTHERLORD = no;
    HID_PENMOUNT = no;
    HID_PETALYNX = no;
    HID_RAZER = no;
    HID_PRIMAX = no;
    HID_RETRODE = no;
    HID_ROCCAT = no;
    HID_SAITEK = no;

    # Sound
    SND_PCSP = no;
    SND_AC97_POWER_SAVE = forceNo;
    SND_MPU401 = no;
    SND_SERIAL_U16550 = no;
    SND_MTPAV = no;
    SND_VIRTIO = no;
      # PCI sound devices
      SND_AD1889 = no;
      SND_ALS300 = no;
      SND_ALS4000 = no;
      SND_ALI5451 = no;
      SND_ASIHPI = no;
      SND_ATIIXP = no;
      SND_ATIIXP_MODEM = no;
      SND_CTXFI = no;
      SND_AU8810 = no;
      SND_AU8820 = no;
      SND_AU8830 = no;

    # MTD
    MTD_HYPERBUS = no;
    MTD_LPDDR = no;
    MTD_PMC551 = no;
    MTD_DATAFLASH = no;
    MTD_MCHP23K256 = no;
    MTD_MCHP48L640 = no;
    MTD_SST25L = no;
    MTD_MTDRAM = no;
    MTD_DOCG3 = no;
    SM_FTL = no;
    SSFDC = no;

    # H


  #
  # Filesystems
  #
  F2FS_FS = forceNo;
  F2FS_FS_COMPRESSION = forceOptionNo;
  REISERFS_FS = no;
  JFS_FS = no;
  GFS2_FS = no;
  OCFS2_FS = no;
  NILFS2_FS = no;
  NTFS_FS = no;
  DLM = no;
  XFS_FS = no;
  BTRFS_FS = no;
  BTRFS_FS_POSIX_ACL = forceOptionNo;
  QFMT_V1 = no;
  NFS_FS = no;
  SUNRPC_DEBUG = forceOptionNo;
  NFSD_V2_ACL = forceOptionNo;
  NFSD_V3_ACL = forceOptionNo;
  NFSD_V4 = forceOptionNo;
  NFSD_V4_SECURITY_LABEL = forceOptionNo;
  NFS_FSCACHE = forceOptionNo;
  NFS_SWAP = forceOptionNo;
  NFS_V3_ACL = forceOptionNo;
  NFS_V4_1 = forceOptionNo;
  NFS_V4_2 = forceOptionNo;
  NFS_V4_SECURITY_LABEL = forceOptionNo;
  NFSD = no;
  "9P_FS" = no;

    # Network filesystems
    CEPH_FS = no;
    CEPH_FSCACHE = forceOptionNo;
    CEPH_FS_POSIX_ACL = forceOptionNo;
    CIFS = no;
    CIFS_DFS_UPCALL = forceOptionNo;
    CIFS_FSCACHE = forceOptionNo;
    CIFS_UPCALL = forceOptionNo;
    CIFS_XATTR = forceOptionNo;
    SMB_SERVER = no;
    CODA_FS = no;
    AFS_FS = no;

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
    ROMFS_FS = no;


  #
  # Security
  #
  SECURITY_APPARMOR = forceNo;
  DEFAULT_SECURITY_APPARMOR = forceOptionNo;
  SECURITY_SELINUX = no;


  #
  # Power management & ACPI
  #
  INTEL_IDLE = forceOptionNo;
  X86_INTEL_PSTATE = forceNo;
  X86_POWERNOW_K8 = no;
  X86_SPEEDSTEP_CENTRINO = no;
  X86_P4_CLOCKMOD = no;


  #
  # Processor type and features
  #
  HYPERVISOR_GUEST = forceNo;
  XEN = forceOptionNo;
  KVM_GUEST = forceOptionNo;
  X86_EXTENDED_PLATFORM = no;
  X86_MCE_INTEL = no;
  MICROCODE_INTEL = forceOptionNo;
  NR_CPUS = mkForce (freeform "32");
    # Processor select
    PROCESSOR_SELECT = yes;
    CPU_SUP_AMD = yes;
    CPU_SUP_INTEL = no;
    CPU_SUP_HYGON = no;
    CPU_SUP_CENTAUR = no;
    CPU_SUP_ZHAOXIN = no;
  X86_SGX = forceOptionNo;
  X86_SGX_KVM = forceOptionNo;
}
