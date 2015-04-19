//
//  ViewController.m
//  03-图片浏览器
//
//  Created by Ibokan on 15/3/28.
//  Copyright (c) 2015年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray * _labledesc;//在这里定义属性,默认是private
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle * path = [NSBundle mainBundle];
    NSString * textpath = [path pathForResource:@"picDescription" ofType:@"plist"];//查找全路径下的plist文件
    //    NSLog(@"%@",textpath);
    //启用数组，从上面到文件路径－－找到放置的text描述
    _labledesc = [NSArray arrayWithContentsOfFile:textpath];
    //    NSLog(@"%@",textdesc[picnum]);
    _picDesc.text = _labledesc[0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//1.拖拽系统控件，完成图片浏览器页面布局
//2.找到合适的图片
//3.监听slider
//4.设置滑动条value
//5.设置lable对应滑动条的值,添加了各个控件成为控制器属性
//6.设置图片对应滑动条值
//7.增加plist
//8.把textfield和滑动条对应起来
//9.优化代码，频繁读写文件有损性能
- (IBAction)slider:(UISlider *)sender {
    int picnum = (int)[sender value];
//    NSLog(@"滑动条正在滑动^_^,输出滑动条值:%d",picNum );
    
    _picNum.text = [NSString stringWithFormat:@"%d/22",picnum + 1];
    NSString * picname = [NSString stringWithFormat:@"%d.jpg",picnum];
    _pic.image = [UIImage imageNamed:picname];
    
    NSBundle * path = [NSBundle mainBundle];
//    NSLog(@"%@",path);//若是找不到路径怎么办,bundle来帮忙
    NSString * textpath = [path pathForResource:@"picDescription" ofType:@"plist"];//查找全路径下的plist文件
//    NSLog(@"%@",textpath);
    //启用数组，从上面到文件路径－－找到放置的text描述
//    NSArray * textdesc = [NSArray arrayWithContentsOfFile:textpath];
  
    _labledesc = [NSArray arrayWithContentsOfFile:textpath];
    _picDesc.text = _labledesc[picnum];
//    NSLog(@"%@",_labledesc[picnum]);
}
#pragma mark 添加一个uiview 子控件，本来以为添加uibutton
- (IBAction)setup {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGRect window = _upWindow.frame;
    //利用self对象很好
    if (_upWindow.frame.origin.y == self.view.frame.size.height) {
        window.origin.y -= _upWindow.frame.size.height;
    }
    else {
        window.origin.y += _upWindow.frame.size.height;
    }
    
    _upWindow.frame = window;
    [UIView commitAnimations];
}

- (IBAction)nightModeSwitch:(UISwitch *)sender {
    if (sender.on == YES) {
        self.view.backgroundColor = [UIColor darkGrayColor];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}
- (IBAction)picZoom:(UISlider *)sender {
    _pic.transform = CGAffineTransformMakeScale(sender.value, sender.value);
}
@end
