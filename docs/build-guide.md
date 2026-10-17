# Build Guide

This is the build guide for the dabao keyboard.

Difficulty level: **intermediate/advanced** (due to the fine pitch of the through hole USB C receptacle)

## Parts List
### PCB

| Qty | Component                                                      | Reference                                                      |
| --- | -------------------------------------------------------------- | -------------------------------------------------------------- |
| 36  | 1N4148 Diode SOD-323                                           | D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18 |
| 36  | Choc v1/v2 Hotswap Sockets (optional)                          | S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18 |
| 2   | USB 2.0 C Receptacle 16+8POS (USB4085-GF-A)                    | J2                                                             |
| 1   | 4-pin Right Angle Magnetic Pogo Pin Connector Male/Female Pair | J4                                                             |
| 4   | 4.7k Resistor 0805                                             | R2,R3,R4,R5                                                    |
| 1   | 10k Resistor 0805                                              | R1                                                             |
| 1   | JST Battery Connector (PH S2B-PH-K 1x02 P2.00mm Horizontal)    | J5                                                             |
| 1   | Reset Switch (3x4x2mm Tactile Switch Turtle 2pin)              | SW1                                                            |
| 1   | Power Switch (MSK12C02)                                        | SW2                                                            |
| 1   | GPIO Expander (MCP23017T-E/SO)                                 | U2                                                             |
| 1   | 100k Resistor 0805 (for trackpoint reset)                      | R8                                                             |
| 1   | 2.2uF Capacitor 0805 (for trackpoint reset)                    | C1                                                             |

Here's an example of the magnetic pogo pin connector to purchase ([link](https://www.aliexpress.com/item/1005006525401310.html)):

![](images/aliex-magnetic-pogo-pin.png)

> [!NOTE]
> For the resistor R8 and capacitor C1 used in the trackpoint reset circuit, this should technically not be necessary and can be controlled by the MCU instead. If going this path, uncomment out [this line](https://github.com/justinmklam/zmk-config/blob/204022fa73cc7d1d807504aa6fad1bef3adb5fb0/boards/shields/dabao/dabao_trackpoint.dtsi#L9) in the trackpoint driver and leave R8 and C1 unpopulated.

Parts that you'll need to provide yourself:

| Qty | Description                                         |
| --- | --------------------------------------------------- |
| 1   | nice!nano (or other pro micro equivalent) + headers |
| 1   | Trackpoint Module*                                  |
| 1   | Trackpoint Nub                                      |
| 1   | 3.7 V 301230 031230P 110mAh LiPo battery            |
| 36  | Keycaps (Choc spacing)                              |
| 36  | Choc v1/v2 Switches                                 |
| 1   | OLED or nice!view display (optional)                |

\*Wondering where to find a trackpoint module? See [Trackpoint Sourcing](./trackpoint-sourcing.md).

> [!WARNING]
> For the display, the PCB was designed to support a display and it *should* work, but is currently untested. The case would need to be modified to accommodate the display, so if this interests you please feel free to contribute the changes to this repo! The zmk firmware would also need to be updated by following the docs for adding display support [here](https://zmk.dev/docs/config/displays).
### Case
Hardware for the case:

| Qty | Description                  |
| --- | ---------------------------- |
| 12  | M2x3x3 Heatset Inserts       |
| 12  | M2x4mm Countersunk Fasteners |

The table below consists of the parts to 3D print, where the files can be found [here](../cad/3dprint). 

| Qty | Description           |
| --- | --------------------- |
| 1   | Left Top              |
| 1   | Left Bottom           |
| 1   | Right Top             |
| 1   | Right Bottom          |
| 1   | Power Switch          |
| 1   | Trackpoint Stem Multi |

My parts were printed in Charcoal Black Matte PLA on a BambuLab P1S (no AMS). For the main case parts, the settings were:
- 0.12mm High Quality Profile
- Enable Support, On Build Plate Only

For the Power Switch and Trackpoint Stem Multi, the settings were:
- 0.08mm Extra Fine Profile

## Tools
- Temperature adjustable soldering iron
- Tweezers
- Side cutters
- X-acto knife
- Flux
- Thin wire for the trackpoint module (e.g. I used 30 AWG)

## Instructions
The PCBs are reversible, so it's recommended to label each side with masking tape during assembly to avoid confusion.

![](images/pcb-bare.png)

> [!NOTE]
> Note that some of the pictures shown were taken retroactively, so don't be confused if the PCB doesn't look exactly as yours during assembly. Please refer to the [schematic](../pcb/dabao/exports/dabao-schematic.pdf) or the [kicad design files](../pcb/dabao) if more clarity is needed.
### Right Side
First, solder all the components on the backside, starting with the diodes, ensuring the orientation of the diode is correct.

![](images/pasted-image-20261012102836.png)

Then install the power switch.

![](images/pasted-image-20261012103142.png)

Place the hotswap sockets, then solder them, ensuring they're oriented correctly.

![](images/pasted-image-20261012103855.png)

Solder the reset switch on the bottom side. 

![](images/pasted-image-20261012104757.png)


Solder the four 4.7K resistors on R2, R3, R4, R5 below the reset switch:

![](images/pasted-image-20261014211810.png)

For the display, solder the corresponding jumper pads depending on the type of communication protocol your display uses (JP12/JP11 for I2c, or JP10/JP9 for SPI). Note this is untested, but it _should_ work.

Solder the jumper pads for the right side:

![](images/pasted-image-20261014211618.png)

To solder the USB C connector pins, apply flux on the pads. Then melt a glob of solder on to the soldering iron tip, and drag the solder across the pads. There are some instructional videos on youtube if you need assistance with this step. 

Solder the battery connector. 

![](images/pasted-image-20261014212122.png)


Solder the magnetic pogo pin connector. For this step, make sure the bottom of the connector is aligned with the top of the PCB.

![](images/pasted-image-20261014211001.png)

Solder the headers, then socket the nice!nano by placing kapton tape on the headers, and use diode legs (or similar) as the pins. Snip them off when complete.

![](images/pasted-image-20261012104959.png)

Now it's time to install the trackpoint module.

![](images/pasted-image-20261012105354.png)

Turn the module over on its back:

![](images/pasted-image-20261012105528.png)

And carefully desolder the pins, making sure to not apply too much heat to the pads to avoid destroying the pads.

![](images/pasted-image-20261012105600.png)

Solder the ribbon cable of the trackpoint sensor to the underside:

![](images/pasted-image-20261012105713.png)

And the trackpoint module board from the top side. I used diode legs for the top connections to give it more rigidity since it's just floating, and thin wire for the left connections.

Also at this point, solder C1 and R8 if using.

![](images/pasted-image-20261012105758.png)

The trackpoint stem has different sized openings (at the bottom), so pick the one that has the best fit. Use an X-acto knife to separate it, as side cutters may warp the plastic.

![](images/pasted-image-20261014210822.png)

Install the trackpoint stem, and the right side is now complete!

![](images/pasted-image-20261012105958.png)
## Left Side

The left side is much simpler and follows the same process:
1. Solder diodes
2. Solder hotswap sockets
3. Solder jumper pads
4. Solder magnetic pogo pin connector and USB C connector

Then solder the MCP23017 gpio expander:

![](images/pasted-image-20261012104739.png)

As well as the 10K resistor on R1. 

Note: Ignore the blue wire, that was a bodge that isn't necessary for PCB revisions >= 1.0.

![](images/pasted-image-20261014211100.png)

## Case

If 3D printing the case with FDM, first you'll need  to remove the supports. Use side cutters to clean up the support interface if needed, to make sure the mating connection is clean and snug.

![](images/pasted-image-20261014210536.png)

Slide the power switch into the opening:

![](images/pasted-image-20261014210613.png)

![](images/pasted-image-20261014210620.png)

Install the heat set inserts into each of the bosses:

![](images/pasted-image-20261014210642.png)

Optional, but recommended: Install a thin piece of foam to dampen the switches, otherwise typing may sound quite hollow and cheap. Be sure to leave a cutout for the trackpoint backing.

![](images/pasted-image-20261014210735.png)

> [!NOTE]
> At this point, it's recommended to try flashing the MCU before closing everything up, since the LEDs are not visible so it'll be difficult to diagnose in case the flash isn't successful.

Slide on the top cover, then install the switches to secure the cover to the PCB.

![](images/pasted-image-20261014212311.png)

Install the keycaps and the trackpoint stem + cap, and your board is now ready to be flashed! 

![](images/pasted-image-20261014212225.png)

## Flashing

See [zmk-config](https://github.com/justinmklam/zmk-config) for the latest firmware. To flash firmware on to the board:
1. Connect the MCU to the computer.
2. Double press the reset button to put the MCU in bootloader mode. The MCU should now show up as a mass storage device on your computer.
3. Drag the `.uf2` firmware file on to the device.
4. Wait a few seconds, and the MCU should eject and reboot automatically, and then show up as the dabao keyboard.
