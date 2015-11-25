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
         NSLog(@"Completion handler got response: %ld", modalResponse) ;
     }] ;
}

- (IBAction)done:(id)sender {
    NSLog(@"Done") ;
    NSWindow* sheetParentWindow = self.sheet.sheetParent ;
    
    [sheetParentWindow endSheet:self.sheet
                     returnCode:1234] ;
    /* If, instead of the above, you send the message without the return
     code, [NSWindow endSheet:], the completion handler will get modal
     response NSModalResponseStop. */
}

@end
