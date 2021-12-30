#import "YM.Subscriber.h"

typedef void (^URLSessionHandler)(NSData *data, NSURLResponse *response, NSError *error);


%hook NSURLSession
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(URLSessionHandler)completionHandler
{
    NSString *stringURL = request.URL.absoluteString;
    if ([stringURL containsString:@"/account/status"]) { 
        URLSessionHandler old_handler = completionHandler;
        completionHandler = ^(NSData *data, NSURLResponse *response, NSError *error) {

        data = [NSData dataWithContentsOfFile:Premium];
        old_handler(data, response, error);
	    };        
    }

    return %orig(request, completionHandler);
}
%end


%hook AsyncImageView

- (UIImage *)image {
   UIImage *imageView = %orig;

    if([imageView.imageAsset.assetName isEqualToString:@"user_placeholder"]) {

    NSString *logo = NSHomeDirectory();
    UIImage *userAvatar = [[UIImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/Documents/logo.png", logo]];

    imageView = userAvatar;        
    }

  return imageView;
}

%end 

%hook YPLabel

- (void)setText:(NSString *)text {

  if([text isEqualToString:@"uid-eusno56j"]) {
      text = @"Взломано Networke";
    }

  %orig;
}

%end 

%ctor {

    NSFileManager *fileManager = [NSFileManager defaultManager];

    if(![fileManager fileExistsAtPath:Premium]) {
        NSData *blockFile = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://resoft.pw/block.json"]];
        [blockFile writeToFile:Premium atomically:YES];

    } 
/*
    if(![fileManager fileExistsAtPath:Logo]) {
        NSData *userAvatar = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://resoft.pw/logo.png"]];
        [userAvatar writeToFile:Logo atomically:YES];
    }
*/

    %init(AsyncImageView = objc_lookUpClass("YPCommonUI.AsyncImageView"), YPLabel = objc_lookUpClass("YPCommonUI.YPLabel"));

}

