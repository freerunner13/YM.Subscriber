//
//     Created by Network
//
//     (c) 26.10.2021
//

#import <UIKit/UIKit.h>
#import "obfuscate.h"

#define Premium [NSHomeDirectory() stringByAppendingString:(AY_OBFUSCATE("/Documents/block.json"))]
#define Logo	[NSHomeDirectory() stringByAppendingString:(AY_OBFUSCATE("/Documents/logo.png"))]

@interface UIImageAsset ()
@property (nonatomic, copy) NSString *assetName;
@property (nonatomic, copy) NSString *imageAsset;
@end

