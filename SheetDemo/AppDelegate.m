#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSWindow *sheet;

@end

@implementation AppDelegate

- (IBAction)showSheet:(id)sender {
    [self.window beginSheet:self.sheet
     completionHandler:^void(
                             NSModalResponse modalResponse) {
         NSLog(@"Got response: %ld", modalResponse) ;
     }] ;
}

- (IBAction)done:(id)sender {
    NSWindow* parentWindow = [self.sheet parentWindow] ;
    if (!parentWindow) {
        NSLog(@"Nil parentWindow!  Workaround being used") ;
        parentWindow = self.window ;
    }
    [parentWindow endSheet:self.sheet
                returnCode:123] ;
}

@end
