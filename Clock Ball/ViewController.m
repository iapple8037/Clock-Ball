//
//  ViewController.m
//  Clock Ball
//
//  Created by YANAGIDA on 2013/12/29.
//  Copyright (c) 2013年 YANAGIDA. All rights reserved.



#import "ViewController.h"


@interface ViewController ()<UICollisionBehaviorDelegate>
{
    int lastHour;
}

@property (nonatomic, strong)UIDynamicAnimator* animator;
@property (nonatomic, strong)UIGravityBehavior* gravity;
@property (nonatomic, strong)UICollisionBehavior* collision;
@property (strong, nonatomic) UIDynamicItemBehavior *animationOptions;
//@property (strong, nonatomic) DropitBehavior *dropitBehavior;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //sound付ける//音を鳴らす
    NSString *path = [[NSBundle mainBundle] pathForResource:@"oto02" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
	
    //TODO: タイマーの作成（動作開始）
    [NSTimer scheduledTimerWithTimeInterval:1.0      // 時間間隔（秒）
                                     target:self          // 呼び出すオブジェクト
                                   selector:@selector(driveClock:) //呼び出すメソッド
                                   userInfo:nil         // ユーザ利用の情報オブジェクト
                                    repeats:YES];        // 繰り返し
    //------------------------------------------------------------------------
 //アニメーターを設定
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //衝突判定
    self.collision = [[UICollisionBehavior alloc] initWithItems:nil];
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    self.collision.collisionDelegate = self;
    //重力を設定
    self.gravity = [[UIGravityBehavior alloc]initWithItems:nil];
    
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
    
    //collisionBezier
    // Group 12
        //// Bezier Drawing
        
        //int path12LandX =
        //int path12LandY =
    int path12PortrX = 127;
    int path12PortrY = 138;
    
    // 縦画面１２
    UIBezierPath* bezierPath12 = [UIBezierPath bezierPath];
    [bezierPath12 moveToPoint: CGPointMake(path12PortrX + 41.12, path12PortrY + 100)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 27.93, path12PortrY + 100)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX +  27.93, path12PortrY + 19.76)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 9.71, path12PortrY + 34.99)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 1.96, path12PortrY + 25.88)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 29.29, path12PortrY + 3.71)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 41.12, path12PortrY + 3.71)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 41.12, path12PortrY + 100)];
    [bezierPath12 closePath];
    [bezierPath12 moveToPoint: CGPointMake(path12PortrX + 141.49, path12PortrY + 100)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 78.66, path12PortrY + 100)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 78.66, path12PortrY + 87.35)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 117.01, path12PortrY + 49.27)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 124.49, path12PortrY + 39.89) controlPoint1: CGPointMake(path12PortrX + 119.91, path12PortrY + 46.28) controlPoint2: CGPointMake(path12PortrX + 122.41, path12PortrY + 43.15)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 127.62, path12PortrY + 28.87) controlPoint1: CGPointMake(path12PortrX + 126.58, path12PortrY + 36.62) controlPoint2: CGPointMake(path12PortrX + 127.62, path12PortrY + 32.95)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 126.26, path12PortrY +22) controlPoint1: CGPointMake(path12PortrX + 127.62, path12PortrY + 26.33) controlPoint2: CGPointMake(path12PortrX + 127.17, path12PortrY + 24.04)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 122.59, path12PortrY + 16.77) controlPoint1: CGPointMake(path12PortrX + 125.35, path12PortrY + 19.96) controlPoint2: CGPointMake(path12PortrX + 124.13, path12PortrY + 18.22)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 117.15, path12PortrY + 13.44) controlPoint1: CGPointMake(path12PortrX + 121.05, path12PortrY + 15.32) controlPoint2: CGPointMake(path12PortrX + 119.23, path12PortrY + 14.21)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 110.48, path12PortrY + 12.28) controlPoint1: CGPointMake(path12PortrX + 115.06, path12PortrY + 12.67) controlPoint2: CGPointMake(path12PortrX + 112.84, path12PortrY + 12.28)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 98.38, path12PortrY + 16.97) controlPoint1: CGPointMake(path12PortrX + 105.59, path12PortrY + 12.28) controlPoint2: CGPointMake(path12PortrX + 101.55, path12PortrY + 13.84)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 92.4, path12PortrY + 29.01) controlPoint1: CGPointMake(path12PortrX + 95.21, path12PortrY + 20.1) controlPoint2: CGPointMake(path12PortrX + 93.21, path12PortrY + 24.11)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 79.48, path12PortrY + 26.83)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 82.94, path12PortrY + 16.7) controlPoint1: CGPointMake(path12PortrX + 80.02, path12PortrY + 23.21) controlPoint2: CGPointMake(path12PortrX + 81.18, path12PortrY + 19.83)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 89.68, path12PortrY + 8.54) controlPoint1: CGPointMake(path12PortrX + 84.71, path12PortrY + 13.57) controlPoint2: CGPointMake(path12PortrX + 86.96, path12PortrY + 10.85)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 99.13, path12PortrY + 3.17) controlPoint1: CGPointMake(path12PortrX + 92.4, path12PortrY + 6.23) controlPoint2: CGPointMake(path12PortrX + 95.55, path12PortrY + 4.44)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 110.62, path12PortrY + 1.26) controlPoint1: CGPointMake(path12PortrX + 102.71, path12PortrY + 1.9) controlPoint2: CGPointMake(path12PortrX + 106.54, path12PortrY + 1.26)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 122.11, path12PortrY + 3.03) controlPoint1: CGPointMake(path12PortrX + 114.61, path12PortrY + 1.26) controlPoint2: CGPointMake(path12PortrX + 118.44, path12PortrY + 1.85)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 131.84, path12PortrY + 8.2) controlPoint1: CGPointMake(path12PortrX + 125.78, path12PortrY + 4.21) controlPoint2: CGPointMake(path12PortrX + 129.03,path12PortrY + 5.93)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 138.57, path12PortrY + 16.77) controlPoint1: CGPointMake(path12PortrX + 134.65, path12PortrY + 10.47) controlPoint2: CGPointMake(path12PortrX + 136.89, path12PortrY + 13.32)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 141.08, path12PortrY + 28.6) controlPoint1: CGPointMake(path12PortrX + 140.25, path12PortrY + 20.21) controlPoint2: CGPointMake(path12PortrX + 141.08, path12PortrY + 24.16)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 139.86, path12PortrY + 37.17) controlPoint1: CGPointMake(path12PortrX + 141.08, path12PortrY + 31.68) controlPoint2: CGPointMake(path12PortrX + 140.68, path12PortrY + 34.54)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 136.53, path12PortrY + 44.65) controlPoint1: CGPointMake(path12PortrX + 139.04, path12PortrY + 39.8) controlPoint2: CGPointMake(path12PortrX + 137.93, path12PortrY + 42.29)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 131.56, path12PortrY + 51.38) controlPoint1: CGPointMake(path12PortrX + 135.12,path12PortrY +  47.01) controlPoint2: CGPointMake(path12PortrX + 133.47, path12PortrY + 49.25)];
    [bezierPath12 addCurveToPoint: CGPointMake(path12PortrX + 125.58, path12PortrY + 57.7) controlPoint1: CGPointMake(path12PortrX + 129.66, path12PortrY + 53.51) controlPoint2: CGPointMake(path12PortrX + 127.67, path12PortrY + 55.62)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 94.3, path12PortrY + 88.17)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 141.49, path12PortrY + 88.17)];
    [bezierPath12 addLineToPoint: CGPointMake(path12PortrX + 141.49, path12PortrY + 100)];
    [bezierPath12 closePath];
    
    [_collision addBoundaryWithIdentifier:@"bezierPath12" forPath:bezierPath12];
    
    
    //------------------------------------------------------------------------------
    //ベジエ曲線で3を描きcollisionを設定　縦画面。
    //// Bezier Drawing
    int portraX = 261;
    int portraY = 258;
	//int landX =
	//int landY =
    
    UIBezierPath* bezierPath3 = [UIBezierPath bezierPath];
    [bezierPath3 moveToPoint: CGPointMake(portraX+25.01, portraY+44.24)];
    [bezierPath3 addLineToPoint: CGPointMake(portraX+29.22, portraY+44.24)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+37.18, portraY+43.49) controlPoint1: CGPointMake(portraX+31.94, portraY+44.24) controlPoint2: CGPointMake(portraX+34.6, portraY+43.99)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+44.05, portraY+40.91) controlPoint1: CGPointMake(portraX+39.76, portraY+42.99) controlPoint2: CGPointMake(portraX+42.05, portraY+42.13)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+48.88, portraY+35.94) controlPoint1: CGPointMake(portraX+46.04, portraY+39.68) controlPoint2: CGPointMake(portraX+47.65, portraY+38.03)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+50.71, portraY+28.19) controlPoint1: CGPointMake(portraX+50.1, portraY+33.86) controlPoint2: CGPointMake(portraX+50.71, portraY+31.27)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+49.35, portraY+21.6) controlPoint1: CGPointMake(portraX+50.71, portraY+25.74) controlPoint2: CGPointMake(portraX+50.26, portraY+23.55)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+45.61, portraY+16.63) controlPoint1: CGPointMake(portraX+48.45, portraY+19.65) controlPoint2: CGPointMake(portraX+47.2, portraY+17.99)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+40.17, portraY+13.44) controlPoint1: CGPointMake(portraX+44.03, portraY+15.27) controlPoint2: CGPointMake(portraX+42.21, portraY+14.21)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+33.71, portraY+12.28) controlPoint1: CGPointMake(portraX+38.13, portraY+12.67) controlPoint2: CGPointMake(portraX+35.98, portraY+12.28)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+23.31, portraY+15.41) controlPoint1: CGPointMake(portraX+29.63, portraY+12.28) controlPoint2: CGPointMake(portraX+26.16, portraY+13.32)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+16.85, portraY+24.11) controlPoint1: CGPointMake(portraX+20.45, portraY+17.49) controlPoint2: CGPointMake(portraX+18.3, portraY+20.39)];
    [bezierPath3 addLineToPoint: CGPointMake(portraX+4.88, portraY+19.9)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+16.24, portraY+6.23) controlPoint1: CGPointMake(portraX+7.24, portraY+14.09) controlPoint2: CGPointMake(portraX+11.02, portraY+9.54)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+34.26, portraY+1.26) controlPoint1: CGPointMake(portraX+21.45, portraY+2.92) controlPoint2: CGPointMake(portraX+27.46, portraY+1.26)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+45.61, portraY+2.96) controlPoint1: CGPointMake(portraX+38.25, portraY+1.26) controlPoint2: CGPointMake(portraX+42.03, portraY+1.83)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+55.06, portraY+7.93) controlPoint1: CGPointMake(portraX+49.19, portraY+4.1) controlPoint2: CGPointMake(portraX+52.34, portraY+5.75)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+61.52, portraY+16.09) controlPoint1: CGPointMake(portraX+57.78, portraY+10.1) controlPoint2: CGPointMake(portraX+59.94, portraY+12.82)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+63.9, portraY+27.38) controlPoint1: CGPointMake(portraX+63.11, portraY+19.35) controlPoint2: CGPointMake(portraX+63.9, portraY+23.11)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+62.61, portraY+34.99) controlPoint1: CGPointMake(portraX+63.9, portraY+30.1) controlPoint2: CGPointMake(portraX+63.47, portraY+32.63)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+59.08, portraY+41.38) controlPoint1: CGPointMake(portraX+61.75, portraY+37.35) controlPoint2: CGPointMake(portraX+60.57, portraY+39.48)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+53.7, portraY+46.28) controlPoint1: CGPointMake(portraX+57.58, portraY+43.29) controlPoint2: CGPointMake(portraX+55.79, portraY+44.92)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+46.9, portraY+49.27) controlPoint1: CGPointMake(portraX+51.62, portraY+47.64) controlPoint2: CGPointMake(portraX+49.35, portraY+48.64)];
    [bezierPath3 addLineToPoint: CGPointMake(portraX+46.9, portraY+49.54)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+54.72, portraY+52.4) controlPoint1: CGPointMake(portraX+49.71, portraY+50.09) controlPoint2: CGPointMake(portraX+52.32, portraY+51.04)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+60.91, portraY+57.5) controlPoint1: CGPointMake(portraX+57.13, portraY+53.76) controlPoint2: CGPointMake(portraX+59.19, portraY+55.46)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+64.99, portraY+64.5) controlPoint1: CGPointMake(portraX+62.63, portraY+59.54) controlPoint2: CGPointMake(portraX+63.99, portraY+61.87)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+66.49, portraY+73.07) controlPoint1: CGPointMake(portraX+65.99, portraY+67.13) controlPoint2: CGPointMake(portraX+66.49, portraY+69.99)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+63.77, portraY+85.79) controlPoint1: CGPointMake(portraX+66.49, portraY+77.88) controlPoint2: CGPointMake(portraX+65.58, portraY+82.12)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+56.56, portraY+94.97) controlPoint1: CGPointMake(portraX+61.95, portraY+89.46) controlPoint2: CGPointMake(portraX+59.55, portraY+92.52)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+46.22, portraY+100.54) controlPoint1: CGPointMake(portraX+53.57, portraY+97.42) controlPoint2: CGPointMake(portraX+50.12, portraY+99.27)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+34.26, portraY+102.45) controlPoint1: CGPointMake(portraX+42.33, portraY+101.81) controlPoint2: CGPointMake(portraX+38.34, portraY+102.45)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+14.13, portraY+97.28) controlPoint1: CGPointMake(portraX+26.64, portraY+102.45) controlPoint2: CGPointMake(portraX+19.93, portraY+100.73)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+1.48, portraY+81.23) controlPoint1: CGPointMake(portraX+8.33, portraY+93.83) controlPoint2: CGPointMake(portraX+4.11, portraY+88.49)];
    [bezierPath3 addLineToPoint: CGPointMake(portraX+13.72, portraY+77.15)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+21.13, portraY+87.35) controlPoint1: CGPointMake(portraX+15.17, portraY+81.32) controlPoint2: CGPointMake(portraX+17.64, portraY+84.72)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+33.98, portraY+91.3) controlPoint1: CGPointMake(portraX+24.62, portraY+89.98) controlPoint2: CGPointMake(portraX+28.91, portraY+91.3)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+41.12, portraY+90.14) controlPoint1: CGPointMake(portraX+36.43, portraY+91.3) controlPoint2: CGPointMake(portraX+38.81, portraY+90.91)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+47.31, portraY+86.67) controlPoint1: CGPointMake(portraX+43.44, portraY+89.37) controlPoint2: CGPointMake(portraX+45.5, portraY+88.21)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+51.66, portraY+80.96) controlPoint1: CGPointMake(portraX+49.13, portraY+85.13) controlPoint2: CGPointMake(portraX+50.58, portraY+83.23)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+53.3, portraY+72.94) controlPoint1: CGPointMake(portraX+52.75, portraY+78.69) controlPoint2: CGPointMake(portraX+53.3, portraY+76.02)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+51.12, portraY+64.5) controlPoint1: CGPointMake(portraX+53.3, portraY+69.58) controlPoint2: CGPointMake(portraX+52.57, portraY+66.77)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+45.48, portraY+59) controlPoint1: CGPointMake(portraX+49.67, portraY+62.24) controlPoint2: CGPointMake(portraX+47.79, portraY+60.4)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+37.66, portraY+56) controlPoint1: CGPointMake(portraX+43.16, portraY+57.59) controlPoint2: CGPointMake(portraX+40.56, portraY+56.59)];
    [bezierPath3 addCurveToPoint: CGPointMake(portraX+29.09, portraY+55.12) controlPoint1: CGPointMake(portraX+34.75, portraY+55.41) controlPoint2: CGPointMake(portraX+31.9, portraY+55.12)];
    [bezierPath3 addLineToPoint: CGPointMake(portraX+25.01, portraY+55.12)];
    [bezierPath3 addLineToPoint: CGPointMake(portraX+25.01, portraY+44.24)];
    [bezierPath3 closePath];
    [self.collision addBoundaryWithIdentifier:@"bezierPath3" forPath:bezierPath3];
    
  //-----------------------------------------------------------------------------
    
    // Group 6 　横画面

        //int path6LandX =
        //int path6LandY =
        int path6PortrX = 142;
        int path6PortrY = 376;
        
    //// Bezier Drawing
    UIBezierPath* bezierPath6 = [UIBezierPath bezierPath];
    [bezierPath6 moveToPoint: CGPointMake(path6PortrX + 25.46, path6PortrY + 40.47)];
    [bezierPath6 addLineToPoint: CGPointMake(path6PortrX + 25.59, path6PortrY + 40.74)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 31.03, path6PortrY + 38.84) controlPoint1: CGPointMake(path6PortrX + 26.95, path6PortrY + 39.93) controlPoint2: CGPointMake(path6PortrX + 28.77, path6PortrY + 39.29)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 37.56, path6PortrY + 38.16) controlPoint1: CGPointMake(path6PortrX + 33.3, path6PortrY + 38.39) controlPoint2: CGPointMake(path6PortrX + 35.47, path6PortrY + 38.16)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 49.32, path6PortrY + 40.4) controlPoint1: CGPointMake(path6PortrX + 41.73, path6PortrY + 38.16) controlPoint2: CGPointMake(path6PortrX + 45.65, path6PortrY + 38.91)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 58.91, path6PortrY + 46.66) controlPoint1: CGPointMake(path6PortrX + 53, path6PortrY + 41.9) controlPoint2: CGPointMake(path6PortrX + 56.19, path6PortrY + 43.99)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 65.3, path6PortrY + 56.25) controlPoint1: CGPointMake(path6PortrX + 61.63, path6PortrY + 49.33) controlPoint2: CGPointMake(path6PortrX + 63.76, path6PortrY + 52.53)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 67.62, path6PortrY + 68.35) controlPoint1: CGPointMake(path6PortrX + 66.85, path6PortrY + 59.97) controlPoint2: CGPointMake(path6PortrX + 67.62, path6PortrY + 64)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 65.1, path6PortrY + 81.48) controlPoint1: CGPointMake(path6PortrX + 67.62, path6PortrY + 73.16) controlPoint2: CGPointMake(path6PortrX + 66.78, path6PortrY + 77.53)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 58.1,path6PortrY +  91.61) controlPoint1: CGPointMake(path6PortrX + 63.42, path6PortrY + 85.42) controlPoint2: CGPointMake(path6PortrX + 61.09, path6PortrY +  + 88.8)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 47.56, path6PortrY + 98.14) controlPoint1: CGPointMake(path6PortrX + 55.1, path6PortrY + 94.42) controlPoint2: CGPointMake(path6PortrX + 51.59, path6PortrY +  + 96.59)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 34.43, path6PortrY + 100.45) controlPoint1: CGPointMake(path6PortrX + 43.52, path6PortrY + 99.68) controlPoint2: CGPointMake(path6PortrX + 39.15, path6PortrY +  + 100.45)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 21.1,path6PortrY +  98.07) controlPoint1: CGPointMake(path6PortrX + 29.63, path6PortrY + 100.45) controlPoint2: CGPointMake(path6PortrX + 25.18, path6PortrY +  + 99.65)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 10.56, path6PortrY + 91.47) controlPoint1: CGPointMake(path6PortrX + 17.02, path6PortrY + 96.48) controlPoint2: CGPointMake(path6PortrX + 13.51, path6PortrY +  + 94.28)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 3.63, path6PortrY + 81.41) controlPoint1: CGPointMake(path6PortrX + 7.62, path6PortrY + 88.66) controlPoint2: CGPointMake(path6PortrX + 5.31, path6PortrY +  + 85.31)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 1.11, path6PortrY + 68.76) controlPoint1: CGPointMake(path6PortrX + 1.95, path6PortrY + 77.51) controlPoint2: CGPointMake(path6PortrX + 1.11, path6PortrY +  + 73.29)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 3.7, path6PortrY + 54.48) controlPoint1: CGPointMake(path6PortrX + 1.11, path6PortrY + 63.5) controlPoint2: CGPointMake(path6PortrX + 1.97, path6PortrY +  + 58.74)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 10.5, path6PortrY + 41.42) controlPoint1: CGPointMake(path6PortrX + 5.42, path6PortrY + 50.22) controlPoint2: CGPointMake(path6PortrX + 7.69, path6PortrY +  + 45.87)];
    [bezierPath6 addLineToPoint: CGPointMake(path6PortrX + 35.66, path6PortrY + 1.71)];
    [bezierPath6 addLineToPoint: CGPointMake(path6PortrX + 51.3, path6PortrY + 1.71)];
    [bezierPath6 addLineToPoint: CGPointMake(path6PortrX + 25.46, path6PortrY + 40.47)];
    [bezierPath6 closePath];
    [bezierPath6 moveToPoint: CGPointMake(path6PortrX + 14.44, path6PortrY + 68.9)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 15.87, path6PortrY + 76.85) controlPoint1: CGPointMake(path6PortrX + 14.44, path6PortrY + 71.71) controlPoint2: CGPointMake(path6PortrX + 14.92, path6PortrY + 74.36)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 19.95, path6PortrY + 83.31) controlPoint1: CGPointMake(path6PortrX + 16.82, path6PortrY + 79.35) controlPoint2: CGPointMake(path6PortrX + 18.18, path6PortrY + 81.5)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 26.27, path6PortrY + 87.66) controlPoint1: CGPointMake(path6PortrX + 21.72, path6PortrY + 85.13) controlPoint2: CGPointMake(path6PortrX + 23.82, path6PortrY + 86.58)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 34.43, path6PortrY + 89.3) controlPoint1: CGPointMake(path6PortrX + 28.72, path6PortrY + 88.75) controlPoint2: CGPointMake(path6PortrX + 31.44, path6PortrY + 89.3)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 42.52, path6PortrY + 87.8) controlPoint1: CGPointMake(path6PortrX + 37.42, path6PortrY + 89.3) controlPoint2: CGPointMake(path6PortrX + 40.12, path6PortrY + 88.8)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 48.78, path6PortrY + 83.52) controlPoint1: CGPointMake(path6PortrX + 44.93, path6PortrY + 86.8) controlPoint2: CGPointMake(path6PortrX + 47.01, path6PortrY + 85.37)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 52.86, path6PortrY + 76.99) controlPoint1: CGPointMake(path6PortrX + 50.55, path6PortrY + 81.66) controlPoint2: CGPointMake(path6PortrX + 51.91, path6PortrY + 79.48)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 54.29, path6PortrY + 68.76) controlPoint1: CGPointMake(path6PortrX + 53.81, path6PortrY + 74.49) controlPoint2: CGPointMake(path6PortrX + 54.29, path6PortrY + 71.75)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 52.86, path6PortrY + 60.74) controlPoint1: CGPointMake(path6PortrX + 54.29, path6PortrY + 65.86) controlPoint2: CGPointMake(path6PortrX + 53.81, path6PortrY + 63.18)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 48.92, path6PortrY + 54.34) controlPoint1: CGPointMake(path6PortrX + 51.91, path6PortrY + 58.29) controlPoint2: CGPointMake(path6PortrX + 50.59, path6PortrY + 56.16)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 42.73, path6PortrY + 50.13) controlPoint1: CGPointMake(path6PortrX + 47.24, path6PortrY + 52.53) controlPoint2: CGPointMake(path6PortrX + 45.18, path6PortrY + 51.13)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 34.57, path6PortrY + 48.63) controlPoint1: CGPointMake(path6PortrX + 40.28, path6PortrY + 49.13) controlPoint2: CGPointMake(path6PortrX + 37.56, path6PortrY + 48.63)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 26.34, path6PortrY + 50.13) controlPoint1: CGPointMake(path6PortrX + 31.58, path6PortrY + 48.63) controlPoint2: CGPointMake(path6PortrX + 28.83, path6PortrY + 49.13)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 19.95, path6PortrY + 54.34) controlPoint1: CGPointMake(path6PortrX + 23.85, path6PortrY + 51.13) controlPoint2: CGPointMake(path6PortrX + 21.72, path6PortrY + 52.53)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 15.87, path6PortrY + 60.74) controlPoint1: CGPointMake(path6PortrX + 18.18, path6PortrY + 56.16) controlPoint2: CGPointMake(path6PortrX + 16.82, path6PortrY + 58.29)];
    [bezierPath6 addCurveToPoint: CGPointMake(path6PortrX + 14.44, path6PortrY + 68.9) controlPoint1: CGPointMake(path6PortrX + 14.92, path6PortrY + 63.18) controlPoint2: CGPointMake(path6PortrX + 14.44, path6PortrY + 65.9)];
    [bezierPath6 closePath];
    

    [self.collision addBoundaryWithIdentifier:@"bezierPath6" forPath:bezierPath6];
    
//----------------------------------------------------------------
    //bezierPath9
    int path9PortrX = 21;
	int path9PortrY = 258;
    
    //// Bezier Drawing
    UIBezierPath* bezierPath9 = [UIBezierPath bezierPath];
    [bezierPath9 moveToPoint: CGPointMake(path9PortrX + 43.68, path9PortrY + 61.1)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 37.97, path9PortrY + 62.87) controlPoint1: CGPointMake(path9PortrX + 42.18, path9PortrY + 61.78) controlPoint2: CGPointMake(path9PortrX + 40.33, path9PortrY + 62.42)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 34.64, path9PortrY + 63.35) controlPoint1: CGPointMake(path9PortrX + 36.88, path9PortrY + 63.05) controlPoint2: CGPointMake(path9PortrX + 35.77, path9PortrY + 63.21)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 31.44, path9PortrY + 63.55) controlPoint1: CGPointMake(path9PortrX + 33.5, path9PortrY + 63.48) controlPoint2: CGPointMake(path9PortrX + 32.44, path9PortrY + 63.55)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 19.61, path9PortrY + 61.31) controlPoint1: CGPointMake(path9PortrX + 27.18, path9PortrY + 63.55) controlPoint2: CGPointMake(path9PortrX + 23.23, path9PortrY + 62.8)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 10.09, path9PortrY + 55.05) controlPoint1: CGPointMake(path9PortrX + 15.98, path9PortrY + 59.81) controlPoint2: CGPointMake(path9PortrX + 12.81, path9PortrY + 57.73)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 3.7, path9PortrY + 45.46) controlPoint1: CGPointMake(path9PortrX + 7.37, path9PortrY + 52.38) controlPoint2: CGPointMake(path9PortrX + 5.24, path9PortrY + 49.18)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 1.38, path9PortrY + 33.36) controlPoint1: CGPointMake(path9PortrX + 2.15, path9PortrY + 41.75) controlPoint2: CGPointMake(path9PortrX + 1.38, path9PortrY + 37.71)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 3.9, path9PortrY + 20.24) controlPoint1: CGPointMake(path9PortrX + 1.38, path9PortrY + 28.55) controlPoint2: CGPointMake(path9PortrX + 2.22, path9PortrY + 24.18)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 10.9, path9PortrY + 10.1) controlPoint1: CGPointMake(path9PortrX + 5.58, path9PortrY + 16.29) controlPoint2: CGPointMake(path9PortrX + 7.91, path9PortrY + 12.91)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 21.51, path9PortrY + 3.58) controlPoint1: CGPointMake(path9PortrX + 13.9, path9PortrY + 7.29) controlPoint2: CGPointMake(path9PortrX + 17.43, path9PortrY + 5.12)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 34.7, path9PortrY + 1.26) controlPoint1: CGPointMake(path9PortrX + 25.59, path9PortrY + 2.03) controlPoint2: CGPointMake(path9PortrX + 29.99, path9PortrY + 1.26)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 47.9, path9PortrY + 3.64) controlPoint1: CGPointMake(path9PortrX + 39.42, path9PortrY + 1.26) controlPoint2: CGPointMake(path9PortrX + 43.82, path9PortrY + 2.06)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 58.44, path9PortrY + 10.24) controlPoint1: CGPointMake(path9PortrX + 51.98, path9PortrY + 5.23) controlPoint2: CGPointMake(path9PortrX + 55.49, path9PortrY + 7.43)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 65.37, path9PortrY + 20.3) controlPoint1: CGPointMake(path9PortrX + 61.38, path9PortrY + 13.05) controlPoint2: CGPointMake(path9PortrX + 63.69, path9PortrY + 16.41)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 67.89, path9PortrY + 32.95) controlPoint1: CGPointMake(path9PortrX + 67.05, path9PortrY + 24.2) controlPoint2: CGPointMake(path9PortrX + 67.89, path9PortrY + 28.42)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 65.3, path9PortrY + 47.23) controlPoint1: CGPointMake(path9PortrX + 67.89, path9PortrY + 38.21) controlPoint2: CGPointMake(path9PortrX + 67.03, path9PortrY + 42.97)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 58.64, path9PortrY + 60.29) controlPoint1: CGPointMake(path9PortrX + 63.58, path9PortrY + 51.49) controlPoint2: CGPointMake(path9PortrX + 61.36, path9PortrY + 55.85)];
    [bezierPath9 addLineToPoint: CGPointMake(path9PortrX + 33.48, path9PortrY + 100)];
    [bezierPath9 addLineToPoint: CGPointMake(path9PortrX + 17.84, path9PortrY + 100)];
    [bezierPath9 addLineToPoint: CGPointMake(path9PortrX + 43.68, path9PortrY + 61.1)];
    [bezierPath9 closePath];
    [bezierPath9 moveToPoint: CGPointMake(path9PortrX + 54.7, path9PortrY + 32.82)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 53.27, path9PortrY + 24.86) controlPoint1: CGPointMake(path9PortrX + 54.7, path9PortrY + 30.01) controlPoint2: CGPointMake(path9PortrX + 54.22, path9PortrY + 27.35)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 49.19, path9PortrY + 18.33) controlPoint1: CGPointMake(path9PortrX + 52.32, path9PortrY + 22.37) controlPoint2: CGPointMake(path9PortrX + 50.96, path9PortrY + 20.19)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 42.86, path9PortrY + 13.91) controlPoint1: CGPointMake(path9PortrX + 47.42, path9PortrY + 16.47) controlPoint2: CGPointMake(path9PortrX + 45.31, path9PortrY + 15)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 34.7, path9PortrY + 12.28) controlPoint1: CGPointMake(path9PortrX + 40.42, path9PortrY + 12.82) controlPoint2: CGPointMake(path9PortrX + 37.7, path9PortrY + 12.28)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 26.54, path9PortrY + 13.84) controlPoint1: CGPointMake(path9PortrX + 31.71, path9PortrY + 12.28) controlPoint2: CGPointMake(path9PortrX + 28.99, path9PortrY + 12.8)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 20.22, path9PortrY + 18.13) controlPoint1: CGPointMake(path9PortrX + 24.1, path9PortrY + 14.89) controlPoint2: CGPointMake(path9PortrX + 21.99, path9PortrY + 16.31)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 16.14, path9PortrY + 24.66) controlPoint1: CGPointMake(path9PortrX + 18.45, path9PortrY + 19.94) controlPoint2: CGPointMake(path9PortrX + 17.09, path9PortrY + 22.12)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 14.71, path9PortrY + 32.95) controlPoint1: CGPointMake(path9PortrX + 15.19, path9PortrY + 27.19) controlPoint2: CGPointMake(path9PortrX + 14.71, path9PortrY + 29.96)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 16.14, path9PortrY + 40.98) controlPoint1: CGPointMake(path9PortrX + 14.71, path9PortrY + 35.85) controlPoint2: CGPointMake(path9PortrX + 15.19, path9PortrY + 38.53)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 20.15, path9PortrY + 47.37) controlPoint1: CGPointMake(path9PortrX + 17.09, path9PortrY + 43.42) controlPoint2: CGPointMake(path9PortrX + 18.43, path9PortrY +  45.55)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 26.41, path9PortrY + 51.58) controlPoint1: CGPointMake(path9PortrX + 21.87, path9PortrY + 49.18) controlPoint2: CGPointMake(path9PortrX + 23.96, path9PortrY + 50.59)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 34.57, path9PortrY + 53.08) controlPoint1: CGPointMake(path9PortrX + 28.86, path9PortrY + 52.58) controlPoint2: CGPointMake(path9PortrX + 31.58, path9PortrY + 53.08)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 42.8, path9PortrY + 51.58) controlPoint1: CGPointMake(path9PortrX + 37.56, path9PortrY + 53.08) controlPoint2: CGPointMake(path9PortrX + 40.3, path9PortrY + 52.58)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 49.19, path9PortrY + 47.37) controlPoint1: CGPointMake(path9PortrX + 45.29, path9PortrY + 50.59) controlPoint2: CGPointMake(path9PortrX + 47.42, path9PortrY + 49.18)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 53.27, path9PortrY + 40.98) controlPoint1: CGPointMake(path9PortrX + 50.96, path9PortrY + 45.55) controlPoint2: CGPointMake(path9PortrX + 52.32, path9PortrY + 43.42)];
    [bezierPath9 addCurveToPoint: CGPointMake(path9PortrX + 54.7, path9PortrY + 32.82) controlPoint1: CGPointMake(path9PortrX + 54.22, path9PortrY + 38.53) controlPoint2: CGPointMake(path9PortrX + 54.7, path9PortrY + 35.81)];
    [bezierPath9 closePath];
    
    [self.collision addBoundaryWithIdentifier:@"bezierPath9" forPath:bezierPath9];
    
    //-----------------------------------------------------
    // Oval-1 縦画面
    
    int pathOPortrX = 199;
    int pathOPortrY = 371;
    //// Bezier Drawing
    UIBezierPath* bezierPathOval = [UIBezierPath bezierPath];
    [bezierPathOval moveToPoint: CGPointMake(pathOPortrX + 28, pathOPortrY + 55)];
    [bezierPathOval addCurveToPoint: CGPointMake(pathOPortrX + 55, pathOPortrY + 28) controlPoint1: CGPointMake(pathOPortrX + 42.91, pathOPortrY + 55) controlPoint2: CGPointMake(pathOPortrX + 55, pathOPortrY + 42.91)];
    [bezierPathOval addCurveToPoint: CGPointMake(pathOPortrX + 28, pathOPortrY + 1) controlPoint1: CGPointMake(pathOPortrX + 55, pathOPortrY + 13.09) controlPoint2: CGPointMake(pathOPortrX + 42.91, pathOPortrY + 1)];
    [bezierPathOval addCurveToPoint: CGPointMake(pathOPortrX + 1, pathOPortrY + 28) controlPoint1: CGPointMake(pathOPortrX + 13.09, pathOPortrY + 1) controlPoint2: CGPointMake(pathOPortrX + 1, pathOPortrY + 13.09)];
    [bezierPathOval addCurveToPoint: CGPointMake(pathOPortrX + 28, pathOPortrY + 55) controlPoint1: CGPointMake(pathOPortrX + 1, pathOPortrY + 42.91) controlPoint2: CGPointMake(pathOPortrX + 13.09, pathOPortrY + 55)];
    [bezierPathOval closePath];
    [self.collision addBoundaryWithIdentifier:@"bezierPathOval" forPath:bezierPathOval];
    //-------------------------------------------------------------
    
    //立て画面centerPoint
    
	int centerPPotrX = 154;
	int centerPPortrY = 277;
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(centerPPotrX + 18.07, centerPPortrY + 3.93)];
    [bezier2Path addCurveToPoint: CGPointMake(centerPPotrX + 18.07, centerPPortrY + 18.07) controlPoint1: CGPointMake(centerPPotrX + 21.98, centerPPortrY + 7.83) controlPoint2: CGPointMake(centerPPotrX + 21.98, centerPPortrY + 14.17)];
    [bezier2Path addCurveToPoint: CGPointMake(centerPPotrX + 3.93, centerPPortrY + 18.07) controlPoint1: CGPointMake(centerPPotrX + 14.17, centerPPortrY + 21.98) controlPoint2: CGPointMake(centerPPotrX + 7.83, centerPPortrY + 21.98)];
    [bezier2Path addCurveToPoint: CGPointMake(centerPPotrX + 3.93, centerPPortrY + 3.93) controlPoint1: CGPointMake(centerPPotrX + 0.02, centerPPortrY + 14.17) controlPoint2: CGPointMake(centerPPotrX + 0.02, centerPPortrY + 7.83)];
    [bezier2Path addCurveToPoint: CGPointMake(centerPPotrX + 18.07, centerPPortrY + 3.93) controlPoint1: CGPointMake(centerPPotrX + 7.83, centerPPortrY + 0.02) controlPoint2: CGPointMake(centerPPotrX + 14.17, centerPPortrY + 0.02)];
    [bezier2Path closePath];
    [self.collision addBoundaryWithIdentifier:@"centerPoint" forPath:bezier2Path];



}

//TODO:タイマーから呼び出されるメソッド
-(void)driveClock:(NSTimer*)timer
{
    //タイマー動作時の処理
    //現在時刻を取得
    NSDate *today = [NSDate date];
    
    //現在時刻の時、分、秒を取得
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned flags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents * todayComponents = [calendar components:flags fromDate:today];
    
    int hour = [todayComponents hour];
    int min = [todayComponents minute];
    
    float fineHour = (hour % 12) + min / 60.0;
    
    
    //時針、分針、秒針の回転
    _Tanshin.transform = CGAffineTransformMakeRotation(M_PI * 2 * fineHour / 12.0);
    _Choushin.transform = CGAffineTransformMakeRotation(M_PI * 2 * min / 60.0);
    _tanchinBlack.transform = CGAffineTransformMakeRotation(M_PI * 2 * fineHour / 12.0);
    _choushinBlack.transform = CGAffineTransformMakeRotation(M_PI * 2 * min / 60.0);
    
    //時間を更新
    if (lastHour!=hour) {
        lastHour = hour;
        
        //21時になったらnightViewに切り替える。6時になったらdayViewに切り替わる。
        if (lastHour == 21) {
            _dayView.alpha = 1.0;
            [UIView animateWithDuration:3.0 animations:^{
                _dayView.alpha = 0.0;
                _nightView.alpha = 1.0;
            }];
        }
        if (lastHour == 6) {
            [UIView animateWithDuration:3.0 animations:^{
                _nightView.alpha = 0.0;
                _dayView.alpha = 1.0;
            }];
        }
        
        if (lastHour >= 0 && lastHour <= 5) {
            [UIView animateWithDuration:3.0 animations:^{
                _nightView.alpha = 1.0;
                _dayView.alpha = 0.0;
            }];
        }
        if (lastHour >= 7 && lastHour <= 19) {
            [UIView animateWithDuration:3.0 animations:^{
                _nightView.alpha = 0.0;
                _dayView.alpha = 1.0;
            }];
        }

        if (lastHour >= 22 && lastHour <= 23) {
            [UIView animateWithDuration:3.0 animations:^{
                _nightView.alpha = 1.0;
                _dayView.alpha = 0.0;
            }];
        }
    }

}


//TODO:タッチされた所を感知して円を描く。
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint p = [[touches anyObject] locationInView:self.view];
    UIView *circle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    circle.backgroundColor = [UIColor colorWithRed:0.236 green:0.658 blue:0.887 alpha:1];
    circle.layer.borderWidth = 0.0;
    circle.layer.cornerRadius = 20;
    circle. center = p;
    
    [self.view addSubview:circle];//画像の表示
    [self.gravity addItem:circle];//画像にdropitBehaviorの反映
    [self.collision addItem:circle];
        
    //ボールが消えて解放される。
    [UIView animateWithDuration:2.5f
                          delay:1.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         circle.alpha = 0.0;
                     }completion:^(BOOL finished){
                         [circle removeFromSuperview];
                         [self.gravity removeItem:circle];
                         [self.collision addItem:circle];
                         
                     }];
    
    //バウンドした時の動作ビヘビアー//
	UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[circle]];
	itemBehavior.elasticity = 0.7;
    
    [self.animator addBehavior:itemBehavior];

}

//touchesMovedでボールを出す。
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint p = [[touches anyObject]locationInView:self.view];
    UIView *circle =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    circle.backgroundColor = [UIColor colorWithRed:0.236 green:0.658 blue:0.887 alpha:1];
    circle.layer.borderWidth = 0.0;
    circle.layer.cornerRadius = 20;
    circle. center = p;
    
    [self.view addSubview:circle];//画像の表示
    [self.gravity addItem:circle];//画像に重力の反映
    [self.collision addItem:circle];//画像の衝突判定の反映
    
    [UIView animateWithDuration:2.5f
                          delay:1.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         circle.alpha = 0.0;
                     }completion:^(BOOL finished){
                         [circle removeFromSuperview];
                         [self.gravity removeItem:circle];
                         [self.collision removeItem:circle];
                         
                     }];
    
    
    //バウンドした時の動作ビヘビアー//
	UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[circle]];
	itemBehavior.elasticity = 0.7;
    
    [self.animator addBehavior:itemBehavior];
    
}


//衝突時に呼ぶメソッド,衝突の都度色が変わる。
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    //NSLog(@"Boundary contact occurred - %@", identifier);
    
    UIView* view = (UIView*)item;
    view.backgroundColor = [UIColor yellowColor];
    [UIView animateWithDuration:0.3 animations:^{
        view.backgroundColor = [UIColor orangeColor];
    }];
    
    //音を鳴らす
    AudioServicesPlaySystemSound(soundID);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
