# JackItNG

JackItNG is a modern Textual-based TUI evolution of the original JackIt
project: https://github.com/insecurityofthings/jackit

It provides an interactive interface for scanning, identifying, and
interacting with Logitech Unifying devices using a Crazyradio PA
adapter.

------------------------------------------------------------------------

## Overview

JackItNG modernizes the original CLI experience by introducing:

-   A full-screen Textual-based terminal UI
-   Fixed-width RF device table
-   Live activity tracking
-   Configurable RF dwell duration and scan interval
-   Payload browser and viewer
-   Selective or bulk attack modes
-   SQLite device logging

The goal is to provide a cleaner, more structured operator workflow
while preserving compatibility with the original research foundations.

------------------------------------------------------------------------

## Disclaimer

This tool is intended strictly for:

-   Security research
-   Educational use
-   Authorized penetration testing

Only use this tool against devices you own or have explicit permission
to test.

------------------------------------------------------------------------

## Requirements

You will need:

-   A Crazyradio PA adapter
-   MouseJack firmware flashed onto the device

Crazyradio PA: https://www.seeedstudio.com/item_detail.html?p_id=2104

Firmware tools: https://github.com/RFStorm/mousejack

Follow Bastille's firmware flashing instructions before continuing.

------------------------------------------------------------------------

## Installation

Clone and install:

    git clone https://github.com/curiousmaster/JackItNG.git
    cd JackItNG
    make requirements
    make install

------------------------------------------------------------------------

## Usage

Launch the application:

    sudo jackitng

------------------------------------------------------------------------

## CLI Options

    --debug             Enable debug
    --script PATH       Ducky file to use for injection
    --lowpower          Disable LNA on CrazyPA
    --interval INTEGER  Interval between scan cycles (default: 5)
    --duration INTEGER  RF dwell time per scan cycle (default: 5)
    --layout TEXT       Keyboard layout (us, gb, de, ...)
    --address TEXT      Address of device to target
    --vendor TEXT       Vendor of target device (required with --address)
    --reset             Reset CrazyPA before initialization
    --autopwn           Automatically attack all targets
    --all-channels      Send attack to all detected channels
    --keylogging        Log keystrokes (CLI mode only)
    --help              Show help

------------------------------------------------------------------------

## Scan Behavior

JackItNG separates:

-   RF dwell duration (`--duration`)
-   Scan cycle interval (`--interval`)

Example:

    --duration 3 --interval 5

This listens for 3 seconds and waits 2 seconds before the next scan.

For continuous scanning:

    --duration 5 --interval 5

------------------------------------------------------------------------

## TUI Keybindings
```
  Key   Action
  ----- ------------------------
  s     Start / Stop scan
  p     Select payload
  v     View loaded payload
  a     Attack selected device
  A     Attack all devices
  q     Quit
```
------------------------------------------------------------------------

## Identifying Your Own Device

To determine which RF address belongs to your mouse:

1.  Start scanning
2.  Move only your mouse
3.  Observe which row's COUNT increases
4.  That address corresponds to your device

You may also power-cycle your mouse to confirm disappearance and
reappearance.

------------------------------------------------------------------------

## Database

Discovered devices are stored in an SQLite3 database.

You can inspect stored entries using:

    sudo jacklst

Planned improvements include:

-   Custom database file selection
-   Optional database usage
-   Reuse of stored device metadata

------------------------------------------------------------------------

## Recommended Scan Settings

Reliable detection:

    --duration 3 --interval 3

Maximum capture:

    --duration 5 --interval 5

Light scan:

    --duration 1 --interval 5

------------------------------------------------------------------------

## Architecture Notes

JackItNG separates:

-   RF scanning logic
-   UI rendering
-   Payload management
-   Attack execution
-   Scan scheduling

This makes tuning detection reliability and attack behavior
significantly easier.

------------------------------------------------------------------------

## Roadmap

-   Device filtering in UI
-   Multi-select attack mode
-   Activity highlighting
-   Attack confirmation dialog
-   Adaptive RF duration
-   Config file support
-   Device detail side panel

------------------------------------------------------------------------

## Credits

Original research and core concepts:

-   phikshun
-   infamy
-   Bastille Security Research Team

Original JackIt project is BSD licensed.

Files within the lib directory originate from Bastille's MouseJack
research and are GPLv3 licensed.
