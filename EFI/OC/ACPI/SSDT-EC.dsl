/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190509 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-EC.aml, Sat Oct 17 13:47:22 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000005B (91)
 *     Revision         0x02
 *     Checksum         0x9C
 *     OEM ID           "hack"
 *     OEM Table ID     "_EC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_EC", 0x00000000)
{
    Device (_SB.EC)
    {
        Name (_HID, "EC000000")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}

