#import "ReferenceLibraryView.h"
#import <UIKit/UIReferenceLibraryViewController.h>
#import "AppDele.h"

// not sure which dependency is needed here
#import <React/RCTUtils.h>
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

@implementation ReferenceLibraryView

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(showDefinitionForTerm:(NSString*)term callback:(RCTResponseSenderBlock)callback)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    UIReferenceLibraryViewController *referenceLibraryVC = [[UIReferenceLibraryViewController alloc] initWithTerm:term];
    UIViewController *ctrl = RCTPresentedViewController();
    [ctrl presentViewController:referenceLibraryVC animated:YES completion:nil];
  });

  if (callback == nil)
    return;

  BOOL hasDefinition = NO;
  if ([UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:term])
  {
    hasDefinition = YES;
  }

  callback(@[@(hasDefinition)]);
}

@end
