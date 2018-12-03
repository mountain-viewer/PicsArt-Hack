//
//  InitialPickerViewController.h
//  picsart.ai-hack
//
//  Created by Vladislav Shakhray on 02/12/2018.
//  Copyright © 2018 Vladislav Shakhray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CTAssetsPickerController/CTAssetsPickerController.h>
NS_ASSUME_NONNULL_BEGIN

@interface InitialPickerViewController : UIViewController  
@property (weak, nonatomic) IBOutlet UIButton *button;
@property bool isShowing;
@property NSArray* images;
@property NSArray* probabilities;
@property NSArray* photos;
@property NSArray* names;
@property NSArray* nicks;
@property (weak, nonatomic) IBOutlet UIButton *fffff;

@end

NS_ASSUME_NONNULL_END
