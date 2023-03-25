#!/bin/bash

rm -rf tmp
mkdir tmp
cd tmp

# 获取latest release tag
NVMeFix_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/NVMeFix/tags | grep 'name' | cut -d\" -f4 | head -1 )
IntelMausi_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/IntelMausi/tags | grep 'name' | cut -d\" -f4 | head -1 )
VirtualSMC_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/VirtualSMC/tags | grep 'name' | cut -d\" -f4 | head -1 )
Lilu_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/Lilu/tags | grep 'name' | cut -d\" -f4 | head -1 )
WhateverGreen_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/WhateverGreen/tags | grep 'name' | cut -d\" -f4 | head -n 2 | tail -n 1 )
OpenCorePkg_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/OpenCorePkg/tags | grep 'name' | cut -d\" -f4 | head -1 )
AppleALC_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/AppleALC/tags | grep 'name' | cut -d\" -f4 | head -1 )
Hackintool_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/headkaze/Hackintool/tags | grep 'name' | cut -d\" -f4 | head -1 )
IntelBluetoothFirmware_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/OpenIntelWireless/IntelBluetoothFirmware/tags | grep 'name' | cut -d\" -f4 | head -1 )
# BrcmPatchRAM_TAG=$(wget --no-check-certificate -qO- https://api.github.com/repos/acidanthera/BrcmPatchRAM/tags | grep 'name' | cut -d\" -f4 | head -1 )
BrcmPatchRAM_TAG="2.6.1"

# 输出 release tag
cat > ./ReleaseTag << EOF
${OpenCorePkg_TAG}
OpenCorePkg=${OpenCorePkg_TAG}
AppleALC=${AppleALC_TAG}
IntelMausi=${IntelMausi_TAG}
Lilu=${Lilu_TAG}
VirtualSMC=${VirtualSMC_TAG}
WhateverGreen=${WhateverGreen_TAG}
NVMeFix=${NVMeFix_TAG}
IntelBluetoothFirmware=${IntelBluetoothFirmware_TAG}
BrcmPatchRAM=${BrcmPatchRAM_TAG}
EOF

# 下载最新release文件
wget -q https://github.com/acidanthera/NVMeFix/releases/download/${NVMeFix_TAG}/NVMeFix-${NVMeFix_TAG}-RELEASE.zip
wget -q https://github.com/acidanthera/IntelMausi/releases/download/${IntelMausi_TAG}/IntelMausi-${IntelMausi_TAG}-RELEASE.zip
wget -q https://github.com/acidanthera/VirtualSMC/releases/download/${VirtualSMC_TAG}/VirtualSMC-${VirtualSMC_TAG}-RELEASE.zip
wget -q https://github.com/acidanthera/Lilu/releases/download/${Lilu_TAG}/Lilu-${Lilu_TAG}-RELEASE.zip
wget -q https://github.com/acidanthera/WhateverGreen/releases/download/${WhateverGreen_TAG}/WhateverGreen-${WhateverGreen_TAG}-RELEASE.zip
wget -q https://github.com/acidanthera/OpenCorePkg/releases/download/${OpenCorePkg_TAG}/OpenCore-${OpenCorePkg_TAG}-RELEASE.zip
wget -q https://github.com/acidanthera/AppleALC/releases/download/${AppleALC_TAG}/AppleALC-${AppleALC_TAG}-RELEASE.zip
wget -q https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases/download/${IntelBluetoothFirmware_TAG}/IntelBluetoothFirmware-${IntelBluetoothFirmware_TAG}.zip
wget -q https://github.com/acidanthera/BrcmPatchRAM/releases/download/${BrcmPatchRAM_TAG}/BrcmPatchRAM-${BrcmPatchRAM_TAG}-RELEASE.zip
git clone https://github.com/acidanthera/OcBinaryData.git

# 下载最新黑苹果工具
wget -q -O ${PWD}/OCC.zip https://mackie100projects.altervista.org/apps/opencoreconf/download-new-build.php?version=last
wget -q -O ${PWD}/CCG.zip https://mackie100projects.altervista.org/apps/cloverconf/download-new-build.php?version=global
wget -q https://github.com/headkaze/Hackintool/releases/download/${Hackintool_TAG}/Hackintool.zip

# 解压
unzip -q AppleALC-${AppleALC_TAG}-RELEASE.zip -d ./AppleALC
unzip -q IntelMausi-${IntelMausi_TAG}-RELEASE.zip -d ./IntelMausi
unzip -q Lilu-${Lilu_TAG}-RELEASE.zip -d ./Lilu
unzip -q NVMeFix-${NVMeFix_TAG}-RELEASE.zip -d ./NVMeFix
unzip -q OpenCore-${OpenCorePkg_TAG}-RELEASE.zip -d ./OpenCore
unzip -q VirtualSMC-${VirtualSMC_TAG}-RELEASE.zip -d ./VirtualSMC
unzip -q WhateverGreen-${WhateverGreen_TAG}-RELEASE.zip -d ./WhateverGreen
unzip -q IntelBluetoothFirmware-${IntelBluetoothFirmware_TAG}.zip -d ./IntelBluetoothFirmware
unzip -q BrcmPatchRAM-${BrcmPatchRAM_TAG}-RELEASE.zip -d ./BrcmPatchRAM
# 下载 HfsPlus.efi 到 OC Drivers
wget -q -P ./OpenCore/X64/EFI/OC/Drivers/ https://raw.githubusercontent.com/acidanthera/OcBinaryData/master/Drivers/HfsPlus.efi
zip -q -r HfsPlus.zip ./OpenCore/X64/EFI/OC/Drivers/HfsPlus.efi


# # 创建 Components 文件夹
# mkdir -p ./Components/OC
# # 复制 kext 文件到 Components 文件夹
# cp -r ./AppleALC/AppleALC.kext ./Components/
# cp -r ./IntelMausi/IntelMausi.kext ./Components/
# cp -r ./Lilu/Lilu.kext ./Components/
# cp -r ./NVMeFix/NVMeFix.kext ./Components/
# cp -r ./WhateverGreen/WhateverGreen.kext ./Components/
# cp -r ./IntelBluetoothFirmware/IntelBluetoothFirmware.kext ./Components/
# cp -r ./BrcmPatchRAM/BlueToolFixup.kext ./Components

# # 复制 VirtualSMC kext 到 Components
# cp -r ./VirtualSMC/Kexts/VirtualSMC.kext ./Components/
# cp -r ./VirtualSMC/Kexts/SMCSuperIO.kext ./Components/
# cp -r ./VirtualSMC/Kexts/SMCProcessor.kext ./Components/
# # 复制 OpenCore 核心组件到 Components
# cp -r ./OpenCore/X64/EFI/BOOT/BOOTx64.efi ./Components/OC/
# cp -r ./OpenCore/X64/EFI/OC/OpenCore.efi ./Components/OC/
# cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenRuntime.efi ./Components/OC/
# #cp -r ./OpenCore/X64/EFI/OC/Drivers/HfsPlus.efi ./Components/OC/
# cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenCanopy.efi ./Components/OC/
# cp -r ./OpenCore/X64/EFI/OC/Drivers/ext4_x64.efi ./Components/OC/
# cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenLinuxBoot.efi ./Components/OC/
# cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenHfsPlus.efi ./Components/OC/
# # 复制 VirtualSMC 和 OpenCore 文件夹到 Components
# cp -r ./VirtualSMC ./Components/
# cp -r ./OpenCore ./Components/
# # 复制VirtualSMC和OpenCore文件夹到Components
# cp -r ./VirtualSMC ./Components/
# cp -r ./OpenCore ./Components/


# 创建 OpenCore 模板
cp -r ./OpenCore/X64/EFI ./EFI
# 删除非必要文件
rm -rf ./EFI/OC/Bootstrap
rm -rf ./EFI/OC/Tools/*
rm -rf ./EFI/OC/Drivers/*

# 复制 OC Drivers
cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenRuntime.efi ./EFI/OC/Drivers/
#cp -r ./OpenCore/X64/EFI/OC/Drivers/HfsPlus.efi ./EFI/OC/Drivers/
cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenCanopy.efi ./EFI/OC/Drivers/
cp -r ./OpenCore/X64/EFI/OC/Drivers/ResetNvramEntry.efi ./EFI/OC/Drivers/
cp -r ./OcBinaryData/Drivers/ext4_x64.efi ./EFI/OC/Drivers/
cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenLinuxBoot.efi ./EFI/OC/Drivers/
cp -r ./OpenCore/X64/EFI/OC/Drivers/OpenHfsPlus.efi ./EFI/OC/Drivers/

# 复制 VirtualSMC Kexts
cp -r ./VirtualSMC/Kexts/VirtualSMC.kext ./EFI/OC/Kexts/
cp -r ./VirtualSMC/Kexts/SMCSuperIO.kext ./EFI/OC/Kexts/
cp -r ./VirtualSMC/Kexts/SMCProcessor.kext ./EFI/OC/Kexts/

# 复制 Kexts
cp -r ./AppleALC/AppleALC.kext ./EFI/OC/Kexts/
cp -r ./IntelMausi/IntelMausi.kext ./EFI/OC/Kexts/
cp -r ./Lilu/Lilu.kext ./EFI/OC/Kexts/
cp -r ./WhateverGreen/WhateverGreen.kext ./EFI/OC/Kexts/
cp -r ./NVMeFix/NVMeFix.kext ./EFI/OC/Kexts/
cp -r ./VirtualSMC/Kexts/SMCProcessor.kext ./EFI/OC/Kexts/
cp -r ./IntelBluetoothFirmware/IntelBluetoothFirmware-${IntelBluetoothFirmware_TAG}/IntelBluetoothFirmware.kext ./EFI/OC/Kexts/
cp -r ./BrcmPatchRAM/BlueToolFixup.kext ./EFI/OC/Kexts/

# 复制resources
rm -rf ./EFI/OC/Resources
cp -r OcBinaryData/Resources ./EFI/OC/
rm -rf ./EFI/OC/Resources/Audio/*
rm -rf ./EFI/OC/Resources/Image/Acidanthera/*

# 复制tools
cp -r ./OpenCore/X64/EFI/OC/Tools/OpenShell.efi ./EFI/OC/Tools/
cp -r ./OpenCore/X64/EFI/OC/Tools/CleanNvram.efi ./EFI/OC/Tools/
cp -r ./OpenCore/X64/EFI/OC/Tools/OpenControl.efi ./EFI/OC/Tools/

# 生成 README.md
cat > ./README.md << EOF
# Acidanthera && Hackintosh Tools

### Core EFI download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/Core-EFI.zip

### Core Components download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/Core-Components.zip

### All files download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/all-files.zip

| Components            | Version                       |
| --------------------- | ----------------------------- |
| OpenCorePkg           | ${OpenCorePkg_TAG}            |
| AppleALC              | ${AppleALC_TAG}               |
| IntelMausi            | ${IntelMausi_TAG}             |
| Lilu                  | ${Lilu_TAG}                   |
| VirtualSMC            | ${VirtualSMC_TAG}             |
| WhateverGreen         | ${WhateverGreen_TAG}          |
| NVMeFix               | ${NVMeFix_TAG}                |
| IntelBluetoothFirmware| ${IntelBluetoothFirmware_TAG} |
| BlueToolFixup         | ${BrcmPatchRAM_TAG_TAG}       |

### OpenCore Configurator download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/OCC.zip

### Clover Configurator download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/CCG.zip

### Hackintool download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/Hackintool.zip

| Hackintosh Tools      | Version           |
| --------------------- | ----------------- |
| OpenCore Configurator | Latest            |
| Clover Configurator   | Latest            |
| Hackintool            | ${Hackintool_TAG} |

EOF

# 生成 ReleaseNote.md
cat > ./ReleaseNote.md << EOF

### Core EFI download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/Core-EFI.zip

### Core Components download link
https://github.com/SuperNG6/Acidanthera-Hackintosh-Tools/releases/download/${OpenCorePkg_TAG}/Core-Components.zip

| Components            | Version                       |
| --------------------- | ----------------------------- |
| OpenCorePkg           | ${OpenCorePkg_TAG}            |
| AppleALC              | ${AppleALC_TAG}               |
| IntelMausi            | ${IntelMausi_TAG}             |
| Lilu                  | ${Lilu_TAG}                   |
| VirtualSMC            | ${VirtualSMC_TAG}             |
| WhateverGreen         | ${WhateverGreen_TAG}          |
| NVMeFix               | ${NVMeFix_TAG}                |
| IntelBluetoothFirmware| ${IntelBluetoothFirmware_TAG} |
| BlueToolFixup         | ${BrcmPatchRAM_TAG_TAG}       |

| Hackintosh Tools      | Version           |
| --------------------- | ----------------- |
| OpenCore Configurator | Latest            |
| Clover Configurator   | Latest            |
| Hackintool            | ${Hackintool_TAG} |

EOF

cd ..

echo "copy your ACPI Kexts and config.plist."

cp -r EFI/OC/ACPI/* tmp/EFI/OC/ACPI/
cp -r EFI/OC/Kexts/CPUFriend* tmp/EFI/OC/Kexts/
cp -r EFI/OC/Kexts/USBPorts.kext tmp/EFI/OC/Kexts/
cp -r EFI/OC/Resources/Image/Acidanthera/Sierra  tmp/EFI/OC/Resources/Image/Acidanthera/
cp EFI/OC/Config.plist tmp/EFI/OC/Config-old.plist
cp tmp/OpenCore/Docs/Sample.plist tmp/EFI/OC/