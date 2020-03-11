#import "ReferenceLibraryView.h"
#import <UIKit/UIReferenceLibraryViewController.h>
#import "AppDele.h"

@implementation ReferenceLibraryView

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(showDefinitionForTerm:(NSString*)term callback:(RCTResponseSenderBlock)callback)
{
  if (callback == nil)
    return;

  BOOL hasDefinition = NO;
  if ([UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:term])
  {
    hasDefinition = YES;

    dispatch_async(dispatch_get_main_queue(), ^{
      UIReferenceLibraryViewController *referenceLibraryVC = [[UIReferenceLibraryViewController alloc] initWithTerm:term];
      // UIViewController *rootVC = ((AppDele*)[UIApplication sharedApplication].delegate).window.rootViewController;
      UIViewController *ctrl = RCTPresentedViewController();
      [ctrl presentViewController:referenceLibraryVC animated:YES completion:nil];
    });
  }

  callback(@[@(hasDefinition)]);
}

@end
