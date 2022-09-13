//
//  AppDelegate.m
//  sprinkled-launcher
//
//  Created by Adam Bilbrough on 27.11.2021.
//

#import "AppDelegate.h"

@implementation AppDelegate

+ (void)initialize
{
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];

    /*
     * Register your app's defaults here by adding objects to the
     * dictionary, eg
     *
     * [defaults setObject:anObject forKey:keyForThatObject];
     *
     */

    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)init
{
    if ((self = [super init]))
    {
    }

    return self;
}

- (void)dealloc
{

}

- (void)awakeFromNib
{
    [[NSApp mainMenu] setTitle:@"Pooch"];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotif
{
// Uncomment if your application is Renaissance-based
//  [NSBundle loadGSMarkupNamed:@"Main" owner:self];
}

- (BOOL)applicationShouldTerminate:(id)sender
{
    return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotif
{
}

- (BOOL)application:(NSApplication *)application openFile:(NSString *)fileName
{
    return NO;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)_ {
    return YES;
}

- (void)showPrefPanel:(id)sender
{
}

@end

