======================================================================
UnrealEngine2 Runtime 2226.19.03 README and Release Notes
======================================================================


For more information, visit the UnrealEngine2 Runtime web page, at:
http://udn.epicgames.com/pub/Powered/UnrealEngine2Runtime

     
  1  System Requirements
     
     1.1  Minimum System Requirements
     1.2  Recommended System Requirements

  2  Performance
     
     2.1  Resolution
     2.2  CPU speed
     2.3  Memory
     2.4  Considering upgrading?
     2.5  Getting better performance

  3  Troubleshooting
   
     3.1  Crashes
     3.2  Sound issues
     3.3  Network issues
     3.4  Control issues
     3.5  Direct3D
     3.6  NVIDIA 40.41 drivers
     3.7  GeForce 4 MX/Go issues
     3.8  Radeon 7x00 issues
     3.9  TNT2/ Kyro II/ Voodoo 3 issues
     3.10 OpenGL
     3.11 DirectX 8.1b
     3.12 Runtime is starting up windowed

  4  Controls
     
     4.1  Keyboard
     4.2  Mouse

  5  Dedicated Network Servers

     5.1  Explanation
     5.2  Launching
     5.3  Multiple server per machine
     5.4  General performance guidelines
     5.5  More information
  
  6  Copyright Notice


======================================================================
 1 System Requirements
======================================================================

Please note that third-party 3D content may increase these minimum and
recommended requirements.

1.1 Minimum System Requirements
-------------------------------

Operating System:    Windows 98/Me/2000/XP (Linux has separate README)

Processor:           Pentium III or AMD Athlon 733 MHz processor

Memory:              128 MByte RAM

Hard Disk Space:     65 MByte free HD space

Video:               16 MB TNT2-class or other DirectX version 8 
                     compliant video card* 

Sound:               Windows compatible sound card.  NVIDIA nForce or 
                     other motherboards/soundcards containing the
                     Dolby Digital Interactive Content Encoder
                     required for Dolby Digital audio.*

DirectX:             DirectX version 8.1b (download from Microsoft)
                     
Modem:               33.6 Kbps (for modem/Internet multi-user use)

Internet (TCP/IP) and LAN (TCP/IP) multi-user networking supported.

1.2 Recommended System Requirements
-----------------------------------

Operating System:    Windows 98/Me/2000/XP (Linux has separate README)

Processor:           Pentium III or AMD Athlon 733 MHz processor

Memory:              256 MByte RAM

Hard Disk Space:     65 MByte free HD space

Video:               NVIDIA GeForce2 or ATI Radeon (32-128 MB VRAM 
                     recommended)*

Sound:               Sound Blaster Audigy series sound card*

DirectX:             DirectX version 8.1b (download from Microsoft)

Modem:               56 Kbps (for modem/Internet multi-user use)

Internet (TCP/IP) and LAN (TCP/IP) multi-user networking supported.

* Indicates device should be compatible with DirectX, version 8.1 or
higher.

========================================================================
 2 Performance
========================================================================

2.1 Resolution
--------------

The resolution in which you run the Runtime will have the greatest
impact on performance if you are not in the lucky position of running
the latest top of the line graphics cards.  Running at 640x480 in 16
bit mode or even 512x384 in 16 bit mode should provide decent
performance even on older hardware.

2.2 CPU Speed
-------------

The engine is also very sensitive to CPU speed, memory bandwidth, and
cache performance.  Thus, it runs far better on leading-edge 
processors like those of AMD and Intel.  See section 1.2 for a
guideline on recommended specs.

If you have a fast CPU, but a slow or unsupported graphics card, you
may want to try the Pixomatic software renderer.

2.3 Memory
----------

UnrealEngine2's performance is highly dependent on the amount of RAM
you have in your machine, and the amount of memory that is available.
Machines with less memory will access their hard disk more frequently
to load data, which causes sporadic pauses while using the Runtime.
Thus, if you have a 128 MByte (or less) machine, you should make sure
that you don't have other unnecessary programs loaded in memory when
using the UnrealEngine2 Runtime.

How the engine will perform under different RAM conditions using
typical 3D content:

  * 64 MByte or less: lots of swapping

  * 128 MByte: minimal swapping with default settings

  * 256 MByte: might swap in rare cases with highest texture detail

  * 512 MByte or more: shouldn't swap

2.4 Considering upgrading?
--------------------------

For people considering upgrading their machines, here are some tips
based on our experience running UnrealEngine2 on a variety of
machines:

  1 The biggest performance gain for UnrealEngine2 comes from having
    a state of the art graphics chip with 64 MByte or more of onboard
    RAM.

  2 The next upgrade that tends to improve UnrealEngine2 performance
    is upgrading your CPU.

  3 Finally, lots of RAM helps.  With memory prices continually
    falling, it's now reasonably affordable to upgrade to 256 MByte or
    more of system memory.

2.5 Getting better performance
------------------------------

By default, the UnrealEngine2 Runtime picks hardware specific default
values the first time you run it which should result in decent
performance but there is always room left to tweak.

Resolution and texture detail levels have the greatest impact on 
performance, if you have a fast CPU.  You might want to tweak the 
settings to achieve the visual quality / performance tradeoff you 
desire.

If you have a fast graphics card, but a rather slow CPU you might want
to lower the World detail setting in the detail settings menu.

Last but not least, if you have both a fast CPU and a fast graphics
card you shouldn't have to read this!

======================================================================
 3 Troubleshooting
======================================================================

3.1 Crashes
------------

If the UnrealEngine2 Runtime stops with a "Ran out of virtual memory"
message, you need to free up more hard disk space on your primary
drive (C:) in order to view the 3D content you were using.  Some large
levels and rich textures can take up a lot of virtual memory.

On cards without hardware accelerated transform and lighting the
engine will crash reporting a problem in "DrawPrimitive" with DirectX
8.1.  The problem has been addressed by Microsoft for DirectX 8.1b. 
Please see section 3.11 for information on upgrading.  Certain older
NVIDIA drivers also exhibit this problem.  Please upgrade your video
drivers as well.

3.2 Sound issues
----------------

If using a 3D sound accelerator such as the Sound Blaster Audigy
series sound card, you can go into "Options/Audio" to enable EAX 3.0
by selecting the "Hardware 3D Sound + EAX" options.

You need to upgrade to the latest version of Sound Blaster Audigy
drivers in order to get acceptable 3D sound performance.

Using the UnrealEngine2 Runtime in conjunction with earlier versions
of the drivers MAY cause severe performance problems (major slowdowns
on the order of 30-50% while playing sound) in which case you should
change the option back to the default "Software 3D Audio".

If your computer is hooked up to a 5.1 speaker system, you should go
into "Options" and turn on "Hardware 3D Audio" to take advantage of
360-degree sound panning.

3.3 Network issues
-----------------------

The minimum speed connection for acceptable Internet multi-user
performance is a 33.3K modem connection to your Internet Service
Provider.

Known network issues:

  * When a new user enters a network level, clients may experience a
    1/4-second pause while the mesh, skin, and other data is loaded
    for that user.  This is by design.

  * UnrealEngine2's Internet multi-user performance is highly
    dependent on the bandwidth of your connection, the latency (ping
    time), and the packet loss.  Levels are designed to be usable up
    to 300 msec ping times, 5% packet loss, and 33.3K connection
    speeds.  Performance degrades heavily under worse latency, packet
    loss, and bandwidth connections.

  * If you have the Windows XP "Internet Connection Firewall" enabled,
    you won't be able to see LAN in progress.  To disable it,
    go into the Windows XP Start Menu / Network Settings / Local
    Area Connection Properties / Advanced and clear the
    "Internet Connection Firewall" checkbox.  This may be a security
    risk.

3.4 Control issues
------------------

Some PC keyboards can't recognize certain combinations of 3 or more
simultaneously pressed keys.

3.5 Direct3D
-----------------

Please ensure that you are running the latest drivers for your
graphics card as UnrealEngine2 stresses the hardware and drivers to a
greater extent than most applications and we rely on a number of
bug fixes hardware vendors incorporated into their latest drivers.  To
obtain the latest drivers please visit the website of your graphics
card manufacturer.

3.6 NVIDIA 40.41 drivers
------------------------

The NVIDIA 40.41 drivers are known to have visual flaws and
performance problems (hitching) with UnrealEngine2.  The issue has
been addressed by NVIDIA in more recent driver versions.

If you are currently running the 40.41 drivers please install newer
drivers.

The latest NVIDIA drivers can be found at the following URL:

http://www.nvidia.com/content/drivers/drivers.asp

3.7 GeForce 4 MX/Go issues
--------------------------

With GF4 MX/Go cards you might experience graphic corruption in 32 bit
mode.  The problem has been addressed by NVIDIA in recent driver
versions  A workaround is to use the UnrealEngine2 Runtime in 16 bit
mode, but upgrading to the latest drivers is recommended.

3.8 Radeon 7x00 issues
----------------------

Radeon 7x00 cards using older drivers can exhibit visual flaws with
certain 3D content.  We recommend using the 7.76 (Catalyst 2.3)
drivers or newer as they incorporate fixes for using UnrealEngine2.

3.9  TNT2 / Kyro II / Voodoo 3 issues
-------------------------------------

Due to the lack of certain key functionality like texture compression
and cubemap support, TNT2, Kyro II, Voodoo 3, G400, ... cards won't be
able to run UnrealEngine2 content at the full visual quality.  As
uncompressed textures are much larger than the compressed ones we have
to drastically scale down both size and color depth of the textures in
order to fit them into video memory.  This means you will notice
banding artifacts - especially in the menus. 

The lack of cubemap support means that reflections won't look correct 
though during use you'll most likely be hard pressed to spot the 
difference.

3.10 OpenGL
-----------

The OpenGL renderer is not officially supported on Windows but might
be a good choice on certain hardware / driver combinations as it might 
trigger fewer bugs in drivers.  Unless you are experiencing serious
visual flaws there is no reason to change to the OpenGL renderer,
though.  UnrealEngine2 was designed around D3D and offers the best
performance and visual quality with the D3D renderer.

Also please keep in mind that the OpenGL renderer is still work in 
progress and has higher system requirements than the D3D renderer.
For example, it relies on the presence of texture compression which
rules out e.g. TNT2 cards.

The OpenGL renderer is known to not work correctly with pre-7.76 ATI 
drivers.

3.11 Obtaining DirectX 8.1b
---------------------------

DirectX 8.1b is the minimum DirectX version required for using
UnrealEngine2, and contains bug fixes in the DirectX Runtime that are
required for the engine to run on cards without hardware transform and
lighting. e.g. TNT2, Kyro I/II, Voodoo 3, Radeon 7000, etc.

DirectX 9.0b is the latest DirectX version available, and also
includes these fixes.  You do not need to upgrade to 9.0b if other
software on your machine does not require it.  You can download
DirectX 9.0b from the main DirectX web site below:

http://www.microsoft.com/windows/directx/

If you do not need or want DirectX 9.0b, you can download DirectX 8.1b 
using the below links.

For Windows 98/Me:

http://www.microsoft.com/downloads/release.asp?ReleaseID=40175

For Windows 2000:

http://www.microsoft.com/downloads/release.asp?ReleaseID=40176

Windows XP users should upgrade to Service Pack 1a to update their
version of DirectX to 8.1b:

http://www.microsoft.com/WindowsXP/pro/downloads/servicepacks/sp1/

3.12 Runtime is starting up windowed
---------------------------------

If the Runtime fails to obtain keyboard focus when launching it will
start up windowed. In this case you can click on the window and press
ALT-ENTER to switch to fullscreen mode.

======================================================================
 4 Controls
======================================================================

4.1 Keyboard
------------

You can bind new keys to controls by clicking on the "Controls" tab of
the Preferences menu inside of the UnrealEngine2 Runtime.  There are
many controls to bind.

4.2 Mouse
---------

Although you can rely solely on your keyboard to move around in and
interact in the UnrealEngine2 Runtime's various 3D content, using both
the keyboard and mouse simultaneously gives you much more fluid and
responsive control.

When you use the mouse to control your rotational movement and
looking, you gain a degree of precision and speed that users using
keyboard-only controls can't match.  The keyboard is best used for
simple lateral and forward/backward movement, and for jumping.

To master the default controls in the UnrealEngine2 Runtime, keep your
left hand on the keyboard, using the arrow keys for movement and the
space bar for jumping.  Your right hand operates the mouse,
controlling rotation and looking.  Of course, you can customize these
controls to suit your preferences via the Options Menu.

======================================================================
 5 Dedicated Network Servers
======================================================================

5.1 Explanation
---------------

For optimal network multi-user performance, you can launch a dedicated
copy of the UnrealEngine2 Runtime server on a computer. This improves
performance compared to using a non-dedicated server but, of course,
it ties up the PC.

Anybody may freely run dedicated servers on the Internet; you don't
need to get permission or fill out any paperwork.  

5.2 Launching
-------------

You can launch a dedicated server from the command line by
running UE2Runtime.exe directly (which usually resides in the
C:\UnrealEngine2Runtime\System directory, or the System subdirectory
of whatever other directory you installed the Runtime in).  For example,
to launch the level "BusinessPark", run:

   UE2Runtime BusinessPark.urt -server

5.3 Multiple Servers Per Machine
--------------------------------

Each copy of the dedicated server can serve one and only one level at
a time.

However, you can run multiple level servers on one machine.  To do
this, you must give each server a unique TCP/IP port number.  The
default port number is 7777.  To specify a port, use the following
type of command line:

   UE2Runtime BusinessPark.urt -server -port=9999

5.4 General performance guidelines
----------------------------------

We find that an 600 MHz CPU can usually handle about 16 users with
decent performance.  The performance varies with level complexity and
other machine speed factors, so your mileage may differ.  Performance 
degrades as the number of users grows huge.

If you're running multiple servers simultaneously, Windows NT/2k/XP
outperforms Windows 9x due to its superior multitasking and TCP/IP
processing capabilities.

For best performance, we recommend having 128 MByte of memory per
running server.  For example, for running 2 simultaneous servers your
machine should at least be equipped with 256 MByte of memory.

The UnrealEngine2 Runtime server uses up at least 33.38 Kbits per 
second of outgoing bandwidth per user (on Internet), so if you run 
the server on a machine connected by a 28.8K modem, you'll only be 
able to support one client with decent performance.  Dedicated servers 
that support many users generally require the outgoing bandwidth 
of a T1 line or better.

5.5 More Information
--------------------

Visit the Unreal Developer Network's UnrealEngine2 Runtime page for
extensive information about running servers.

======================================================================
 6 Copyright Notices
======================================================================

UnrealEngine2 Runtime Copyright © 2003 Epic Games, Inc. Raleigh, N.C.,
USA.

Unreal and the Unreal logo are registered trademarks of Epic Games,
Inc.  ALL RIGHTS RESERVED.

MathEngine and Karma and the MathEngine and Karma logos are registered
trademarks or trademarks of MathEngine PLC, used under license.

UnrealEngine2 utilizes the Ogg and Vorbis reference libraries from
Xiph.org (http://www.xiph.org/ogg/vorbis/) for streaming music, under
the following license:

    Copyright (c) 2002, Xiphophorus
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    
    - Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    
    - Redistributions in binary form must reproduce the above
    copyright notice, this list of conditions and the following
    disclaimer in the documentation and/or other materials provided
    with the distribution.
    
    - Neither the name of the Xiphophorus nor the names of its
    contributors may be used to endorse or promote products derived
    from this software without specific prior written permission.
    
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
    CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
    INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE
    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
    OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
    TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
    THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
    SUCH DAMAGE.

All other trademarks and trade names are the property of their
respective owners.
