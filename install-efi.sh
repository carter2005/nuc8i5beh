#!/bin/bash

efibootmgr -c -w -L "opencore" -d /dev/nvme0n1 -p 1 -l \\EFI\\BOOT\\BOOTx64.efi
