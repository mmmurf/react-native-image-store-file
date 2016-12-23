#import <UIKit/UIKit.h>
#import <React/RCTConvert.h>
#import <React/RCTLog.h>
#import <React/RCTUtils.h>
#import "RCTImageStoreManager.h"

#import "RNImageStoreFileManager.h"
@implementation RNImageStoreFileManager

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

RCT_EXPORT_METHOD(writeImageStoreFile:(NSString *)imageTag
                  outputPath:(NSString *)outputPath
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  [self->_bridge.imageStoreManager getImageDataForTag:imageTag
                                            withBlock:^(NSData *imageData) {
      if (imageData) {
        [imageData writeToFile:outputPath atomically:YES];
        resolve(nil);
      }
      else {
          // TODO imageTag in message
        reject(nil, nil, RCTErrorWithMessage(@"No image data for image tag"));
      }
   }];
}

@end
