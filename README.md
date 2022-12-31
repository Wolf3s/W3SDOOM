# Pooch!
[![Pooch! Icon](https://github.com/wolfysdl/pooch-plus/blob/master/src/pooch_icon.png)](https://github.com/wolfysdl/pooch-plus)

Pooch is your old trusty Doom source port of WinMBF (Marine's Best Friend) that is revived for 64bit systems while being historically accurate, nothing more, nothing less.

Pooch was the worlds first 64bit port of MBF/WinMBF and predates Woof! By around 2 years.

# what is it
Pooch is a doom source port taken from the original MBF/WinMBF source port(s), with additions from other engines.  Its goal is to be historically accurate to MBF while running on modern systems.

# what works
Everything :)

# building
Use the appropriate makefile or project file(s) for your system (only 64bit is supported):

macOS, BSD, GNU/Linux, Unix - Use the CMake file provided.

For Windows - use the Visual Studio project files.

# is it fun
Definitely, Doom was always a great game and it's nice to play it on a source port that is relatively pure (and has dogs) :)

# how to get it
In the Releases tab, there is a release binary which is a 'download and play' zip.  It does NOT include any wads, but if you have the full game, then you just need to copy your wad and play.  If you want the demo, find 'doom1.wad' on the net, it's publicly available under shareware.

# where is the data?

1. Transmaps are saved (for UNIX) in HOME as a hidden file.  On Windows, they are saved in the location of the binary as a non-hidden file.
2. Config files (.cfg) are saved (for UNIX) in HOME (.config/pooch.cfg).  MacOS places them in ~/Library/Application Support/pooch.cfg and Windows has them in the same location as the binary.
3. WAD files are to always be placed in the same location as the binary, for all platforms.
4. Save games (.dsg) are saved in HOME for both UNIX and MacOS as a hidden file (.pooch_savX.dsg).  For Windows they are saved in the same location as the binary as a non-hidden file.

# accessibility

Pooch 1.01 supports those who cannot tolerate flickering lights, strobing and other harsh lighting effects.
Makesfiles and Projects have 'acc' in the name which will build with -DACCESSIBILITY which removes the following:
1. Flickering lights, strobing effects, slow glow and slow flickers are removed
2. Chaingun animated sprite when firing is removed

Thanks!

Enjoy it :)
