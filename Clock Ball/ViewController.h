//
//  ViewController.h
//  Clock Ball
//
//  Created by YANAGIDA on 2013/12/29.
//  Copyright (c) 2013年 YANAGIDA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *Choushin;
@property (weak, nonatomic) IBOutlet UIImageView *Tanshin;

@property (weak, nonatomic) IBOutlet UIImageView *tanchinBlack;
@property (weak, nonatomic) IBOutlet UIImageView *choushinBlack;


@property (weak, nonatomic) IBOutlet UIView *nightView;
@property (weak, nonatomic) IBOutlet UIView *dayView;

-(void)driveClock : (NSTimer *)timer;

@end
