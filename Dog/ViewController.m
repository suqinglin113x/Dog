//
//  ViewController.m
//  Dog
//
//  Created by Lin on 2017/11/22.
//  Copyright © 2017年 国恒金服. All rights reserved.
//

#import "ViewController.h"
#import <TXScrollLabelView.h>
#import "BilayerLabel.h"

@interface ViewController () <TXScrollLabelViewDelegate, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 写了点东西，
    // 不知所以然
    
    // 在分支上提交点东西
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    NSArray *titles = @[@"你好，我是你阿爸爸", @"孙子，饿哦是"];
    TXScrollLabelView *tx_scroll = [TXScrollLabelView scrollWithTextArray:titles type:TXScrollLabelViewTypeLeftRight velocity:1 options:UIViewAnimationOptionRepeat inset:UIEdgeInsetsZero];
    [self.view addSubview:tx_scroll];
    tx_scroll.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    tx_scroll.scrollSpace = -100;
    tx_scroll.backgroundColor = [UIColor redColor];
    tx_scroll.scrollLabelViewDelegate = self;
    tx_scroll.frame = CGRectMake(20, 64, 300, 30);
    [tx_scroll beginScrolling];
    tx_scroll.pagingEnabled = YES;

    UITableView *tab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tab];
    tab.dataSource = self;
    tab.delegate =self;
    
    UIView *grayV = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];
    tab.tableHeaderView = grayV;
    grayV.backgroundColor = [UIColor grayColor];
    tab.contentInset = UIEdgeInsetsMake(-200, 0, -200, 0);
   
}

- (void)scrollLabelView:(TXScrollLabelView *)scrollLabelView didClickWithText:(NSString *)text atIndex:(NSInteger)index
{
    NSLog(@"%@", text);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}


- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"哈哈",@"哈哈",@"哈哈",@"哈哈",@"哈哈"];
    }
    return _dataSource;
}

- (void)ppp
{
    CGRect textRect = CGRectInset(self.view.bounds, 10, 20);
    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:CGSizeMake(textRect.size.width, CGFLOAT_MAX)];
    container.widthTracksTextView = YES;
    
    NSLayoutManager *manager = [[NSLayoutManager alloc] init];
    [manager addTextContainer:container];
    
    NSTextStorage *storage = [[NSTextStorage alloc] init];
    [storage addLayoutManager:manager];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:textRect textContainer:container];
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    textView.scrollEnabled = YES;
//    textView.editable = NO;
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}















@end
