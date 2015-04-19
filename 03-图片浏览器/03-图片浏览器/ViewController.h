//
//  ViewController.h
//  03-图片浏览器
//
//  Created by Ibokan on 15/3/28.
//  Copyright (c) 2015年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
//视频中，要求auto layout 去掉勾选。。。
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *picNum;
@property (weak, nonatomic) IBOutlet UIImageView *pic;

@property (weak, nonatomic) IBOutlet UILabel *picDesc;

//@property (weak, nonatomic) IBOutlet UISwitch *nightMode;
//@property (weak, nonatomic) IBOutlet UISlider *picZoom;
@property (weak, nonatomic) IBOutlet UIView *upWindow;

- (IBAction)slider:(UISlider *)sender;
- (IBAction)setup;

- (IBAction)nightModeSwitch:(UISwitch *)sender;

- (IBAction)picZoom:(UISlider *)sender;

@end

