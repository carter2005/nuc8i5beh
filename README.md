# nuc8i5beh
clover/opencore uefi bootloader for Mojave, Catalina, Big Surf and monterey

# Bios

- Disable **Secure Boot**
- Disable **Legacy Boot**, always use uefi boot
- Disable **Wi-Fi**, wifi works now by ltlwm.kext, but I use ethernet

# Hardware

- CPU: Intel® Core™ i5-8259U Processor (6M Cache, up to 3.80 GHz)
- SSD: S750 512GB
- RAM: Kingston HyperX 8GB x 2
- BIOS: 0089
- Monitor: Dell U2723QE, 4K

# Status

- Mojave 10.14.6 OK
- Catalina 10.15.7 OK
- Big Suf 11.6 OK
- monterey 12.4 OK
- works perfect with native power, graphics, ethernet, audio and bluetooth, wifi need enable by itlwm.kext manually.

# QnA

1. macbook pro 15.2 vs macmini 8,1

   could work on both configuration, but mbp is much more energy save than macmini(typical 8W vs 12W) and bluetooth is more easier to work.
