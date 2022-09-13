/* ... */
//-----------------------------------------------------------------------------
//
// Copyright(C) 2009 Simon Howard
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
// 02111-1307, USA.
//
//-----------------------------------------------------------------------------

#include <AppKit/AppKit.h>
#include "Execute.h"
#include "LauncherManager.h"

@implementation LauncherManager

// Save configuration.  Invoked when we launch the game or quit.

- (void) saveConfig
{
    NSUserDefaults *defaults;

    // Save command line arguments.

    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self->commandLineArguments stringValue]
              forKey:@"command_line_args"];
}

// Load configuration, invoked on startup.

- (void) setConfig
{
    NSUserDefaults *defaults;
    NSString *args;

    defaults = [NSUserDefaults standardUserDefaults];

    args = [defaults stringForKey:@"command_line_args"];

    if (args != nil)
    {
        [self->commandLineArguments setStringValue:args];
    }
}

- (void) launchpooch: (id)sender
{
    NSString *args;

    [self saveConfig];

    args = [self->commandLineArguments stringValue];

    ExecuteProgram("pooch", [args UTF8String]);
}

- (void) awakeFromNib
{
    [self->packageLabel setStringValue: @"Pooch Launcher"];
    [self->launcherWindow setTitle: @"Pooch Launcher"];
    [self setConfig];
}

@end
