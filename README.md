# dabao
打包 (dǎ bāo or daa2 baau1), which means to take out (food) in Chinese, is a wireless, portable 36-key keyboard with a thumb trackpoint, designed for maximum flexibility and convenience.

> ![pcb as unibody](images/pcb-mono.jpeg)
> <sub>Keyboard can be used as a unibody...</sub>
>
> ![pcb as split](images/pcb-split.jpeg)
> <sub>... or as a split!</sub>

## Design Rationale
I found that split keyboards can be cumbersome when I’m not working at a desk. Managing two independent halves (as well as a laptop) while moving between coworking spaces, cafés, or even working from the couch quickly becomes unwieldy, and I thought there had to be a better way.

This project explores a keyboard that can seamlessly switch between a unibody form factor (easy to pick up and carry) and a fully split configuration when there's space for a full ergonomic setup. An integrated pointing device is included to reduce the need for external peripherals, making it truly portable.

Albeit unconventional, the trackpoint is positioned under the thumb to:
- Enable the use of hotswap sockets while keeping the overall keyboard height low
- Eliminate the need to modify keycaps for trackpoint clearance
- Allow the fingers to remain on the home row during pointing tasks

In practice, using the thumb instead of the index finger feels functionally similar. After a short adjustment period, I personally haven't experienced a meaningful loss in accuracy or precision.

## Features
- **Unibody or Split:** Unique magnetic 4-pin connector allows the keyboard to be used as a single unibody or split into two halves via a USB-C cable. Use unibody mode on the go, and split mode at your desk!
- **Single Microcontroller:** Uses one microcontroller and a GPIO expander, eliminating the need for two controllers or batteries to reduce costs and avoid managing uneven battery discharge.
- **Integrated Trackpoint:** For convenient and precise cursor control.
- **Reversible PCB:** Keeps ordering PCBs affordable. Also enables the trackpoint to be installed on the left or right side.
- **Wireless:** Wireless operation (between the host computer) for portability.
- **Hotswap Switches:** Supports Choc V1 or V2 switches. Can also be soldered directly if desired.

## Firmware

See [zmk-config](https://github.com/justinmklam/zmk-config).

## Case

*Coming soon!* - The case will make the magnetic interface more robust, which will allow the keyboard to be lifted from either side without it collapsing in half. Additional magnets will likely be added to make the connection more secure.

## Build Guide
*Coming soon!*

## Acknowledgements

This design was inspired by the following keyboards:
- [TPS42](https://github.com/crehmann/TPS42)
- [duet](https://github.com/zzeneg/duet)
- [Santoku](https://www.reddit.com/r/ErgoMechKeyboards/comments/oisnad/i_made_this_santoku_gen_2_trackpoint_as_a/?chainedPosts=t3_g4m3f6)

Helpful trackpoint resources:
- [infused-kim's Trackpoint Driver](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver) - outdated for the recent versions of zmk, but still a treasure trove of information
- [Jorne Trackpoint Wiki](https://github.com/joric/jorne/wiki/Tracking)
- [TheMK Wiki - TrackPoint Overview](https://wiki.themk.org/index.php/TrackPoint)
- [KBD News - Trackpoint Integration Guide](https://kbd.news/How-to-integrate-a-trackpoint-into-your-keyboard-2447.html)
- [r/Trackpoint_Builders](https://www.reddit.com/r/TrackPoint_Builders/)
- [Trackpoint Builders Discord](https://discord.gg/48gM4jZkW)

## Support

Thank you to my sponsors for making this project possible!

<a href="https://shop.beekeeb.com" target="_blank"><img src="https://beekeeb.com/beekeeb-logo.png" align="left" width="200" ></a>

<a href="https://pcbway.com" target="_blank"><img src="https://freight.cargo.site/w/800/i/a931690205c27162476213b8bcc171585aad9d84d65cdc121ca425e813114121/0x0.png" align="left" width="200" ></a>

