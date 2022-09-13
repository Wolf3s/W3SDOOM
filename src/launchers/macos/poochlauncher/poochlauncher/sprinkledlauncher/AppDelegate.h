//
//  AppDelegate.h
//  sprinkled-launcher
//
//  Created by Adam Bilbrough on 27.11.2021.
//

#import <Cocoa/Cocoa.h>
#include <AppKit/AppKit.h>

#ifndef LAUNCHER_APPCONTROLLER_H
#define LAUNCHER_APPCONTROLLER_H

@interface AppDelegate : NSObject
{
}

+ (void)initialize;

- (id)init;
- (void)dealloc;

- (void)awakeFromNib;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotif;
- (BOOL)applicationShouldTerminate:(id)sender;
- (void)applicationWillTerminate:(NSNotification *)aNotif;
- (BOOL)application:(NSApplication *)application openFile:(NSString *)fileName;
- (void)showPrefPanel:(id)sender;

@end

#endif
