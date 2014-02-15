//
//  ViewController.m
//  Clock Ball
//
//  Created by YANAGIDA on 2013/12/29.
//  Copyright (c) 2013年 YANAGIDA. All rights reserved.
//

#import "ViewController.h"
#import "DropitBehavior.h"

@interface ViewController ()
{
    int lastHour;
}

@property (nonatomic, strong)UIDynamicAnimator* animator;
//@property (nonatomic, strong)UIGravityBehavior* gravity;
//@property (nonatomic, strong)UICollisionBehavior* collision;
@property (strong, nonatomic) DropitBehavior *dropitBehavior;

@end

@implementation ViewController

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (DropitBehavior *)dropitBehavior
{
    if (!_dropitBehavior) {
        _dropitBehavior = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropitBehavior];
    }
    return _dropitBehavior;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //TODO: タイマーの作成（動作開始）
    [NSTimer scheduledTimerWithTimeInterval:1.0      // 時間間隔（秒）
                                     target:self          // 呼び出すオブジェクト
                                   selector:@selector(driveClock:) //呼び出すメソッド
                                   userInfo:nil         // ユーザ利用の情報オブジェクト
                                    repeats:YES];        // 繰り返し
    
    
    //TODO:アニメーターを設定
    //_animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    //衝突判定
    //_collision = [[UICollisionBehavior alloc]initWithItems:nil];
    //_collision.translatesReferenceBoundsIntoBoundary = YES;
    ////_collision.collisionDelegate = self;//衝突時に呼ぶメソッドデリゲート
    //TODO:重力を設定
    //_gravity = [[UIGravityBehavior alloc]initWithItems:nil];
    
    //[_animator addBehavior:self.gravity];
    //[_animator addBehavior:self.collision];
    

    
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
    [self.dropitBehavior addItem:circle];//画像にdropitBehaviorの反映
    
    
    //ボールが消えて解放される。
    [UIView animateWithDuration:2.5f
                          delay:1.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         circle.alpha = 0.0;
                     }completion:^(BOOL finished){
                         [circle removeFromSuperview];
                         [self.dropitBehavior removeItem:circle];
                         
                     }];

    
    //TODO:バウンドした時の動作ビヘビアー//
	//UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[circle]];
	//itemBehavior.elasticity = 0.7;
    
    //[self.animator addBehavior:itemBehavior];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
