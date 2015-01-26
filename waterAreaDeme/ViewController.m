//
//  ViewController.m
//  waterAreaDeme
//
//  Created by jamalping on 15-1-26.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  问题 file:///Users/silvercreek/Desktop/waterAreaDeme/TheQuestion.png
     *  @brief  思路，两次遍历、、先遍历出最大值，然后分别从左和右顺序遍历（直到找到最大值）
     *  第二次从左开始遍历的:初始化一个最大值为0，当数组中的元素大于这个最大值的时候，更新最大值（将该元素
     *  的值赋值给最大值），数组中的元素小于这个最大值时，这时就可以装水了，我们得累加他们之间的差
     *  值
     *  从右开始遍历和从左开始遍历是一个原理
     */
    
    NSString *QustionPath = [[NSBundle mainBundle] pathForResource:@"TheQuestion" ofType:@"png"];
//    NSArray *array = @[@"2",@"5",@"1",@"2",@"3",@"4",@"7",@"2",@"6"];
//    NSArray *array = @[@"6",@"1",@"4",@"6",@"7",@"5",@"1",@"6",@"4"];
    NSArray *array = @[@"6",@"1",@"4",@"6",@"7",@"5",@"1",@"2",@"4"];
    
    NSInteger result = [self calculatWaterArea:array];
    NSLog(@"result = %d",(int)result);
}

// 计算积水的面积
- (NSInteger)calculatWaterArea:(NSArray *)array {
    NSInteger sum = 0;
    // 第一次遍历，（从左向右遍历）
    NSInteger SecondLargest = 0;
    NSInteger Max = [self getMAXOfTheArray:array];
    for (id aa in array) {
        NSInteger element = [aa integerValue];
        if (element == Max) {
            break;
        }else {
            if (SecondLargest<element) {
                SecondLargest = element;
            }else {
                sum+= SecondLargest-element;
            }
        }
        NSLog(@"sum = %d",(int)sum);
    }
    // 第二次遍历(从右开始遍历)
    SecondLargest = 0;
    for (NSInteger i = array.count-1; i >= 0; i--) {
        NSInteger element = [array[i] integerValue];
        if (element == Max) {
            return sum;
        }else {
            if (SecondLargest<element) {
                SecondLargest = element;
            }else {
                sum+= SecondLargest-element;
            }
        }
        NSLog(@"sum = %d",(int)sum);
    }
    return sum;
}

// 获取数组中的最大值
- (NSInteger)getMAXOfTheArray:(NSArray *)array {
    static NSInteger max = 0;
    for (id element in array) {
        NSInteger aa = [element integerValue];
        if (aa>max) {
            max = aa;
        }
    }
    return max;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
