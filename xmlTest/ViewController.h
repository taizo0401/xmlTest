//
//  ViewController.h
//  xmlTest
//
//  Created by Taizo Takahira on 2013/08/19.
//  Copyright (c) 2013年 Taizo Takahira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSXMLParserDelegate> {
    NSString *nowTagStr;
    NSString *txtBuffer;
}
@property (weak, nonatomic) IBOutlet UITextView *myTextView;

@end
