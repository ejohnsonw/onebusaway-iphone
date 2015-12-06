//
//  OBACustomApiViewController.h
//  org.onebusaway.iphone
//
//  Created by Sebastian Kießling on 12.08.13.
//  Copyright (c) 2013 OneBusAway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBAApplicationDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface OBACustomApiViewController : UITableViewController<UITextFieldDelegate>
- (instancetype)initWithApplicationDelegate:(OBAApplicationDelegate*)appDelegate modelDao:(OBAModelDAO*)modelDao;
@end

NS_ASSUME_NONNULL_END