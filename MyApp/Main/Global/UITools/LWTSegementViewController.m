//
//  LWTSegementViewController.m
//  SegementViewControllerDemo
//
//  Created by liaowentao on 17/3/9.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "LWTSegementViewController.h"

#define titleWidth 80
#define titleHeight 40

@interface LWTSegementViewController ()<UIScrollViewDelegate> {
    UIButton *selectButton;
    UIView *_sliderView;
    UIScrollView *_scrollView;
    //    UIScrollView *_scroll;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;

@end


@implementation LWTSegementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonArray = [[NSMutableArray alloc] init];
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = [[NSArray alloc] initWithArray:titleArray];
    [self initWithTitleButton];
}

- (void)setControllerArray:(NSMutableArray *)controllerArray {
    _controllerArray = controllerArray;
    [self initWithController];
}

- (void)initWithTitleButton
{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    scroll.contentSize = CGSizeMake(titleWidth*_titleArray.count, 40);
    scroll.bounces = NO;
    scroll.scrollEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    [scroll flashScrollIndicators];
    scroll.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scroll];
    _scroll = scroll;
    
    for (int i = 0; i < _titleArray.count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(titleWidth*i, 0, titleWidth, titleHeight);
        [titleButton setTitle:_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        titleButton.backgroundColor = [UIColor whiteColor];
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [scroll addSubview:titleButton];
        if (i == 0) {
            selectButton = titleButton;
            [selectButton setTitleColor:MAIN_GROUNDCOLOR forState:UIControlStateNormal];
        }
        [_buttonArray addObject:titleButton];
    }
    
    //    滑块
    UIView *sliderV=[[UIView alloc]initWithFrame:CGRectMake(15, titleHeight-2, titleWidth - 30, 2)];
    sliderV.backgroundColor = MAIN_GROUNDCOLOR;
    [scroll addSubview:sliderV];
    _sliderView=sliderV;
    
}

- (void)setTheTextColor:(UIColor *)textColor sliderColor:(UIColor *)sliderColor
{
    
}

- (void)scrollViewSelectToIndex:(UIButton *)button
{
    
    [self selectButton:button.tag-100];
    
    [UIView animateWithDuration:0 animations:^{
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH*(button.tag-100), 0);
        
        
    }];
}

//选择某个标题
- (void)selectButton:(NSInteger)index
{
    
    [selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    selectButton = _buttonArray[index];
    [selectButton setTitleColor:MAIN_GROUNDCOLOR forState:UIControlStateNormal];
    CGRect rect = [selectButton.superview convertRect:selectButton.frame toView:self.view];
    [UIView animateWithDuration:0 animations:^{
        CGPoint contentOffset = _scroll.contentOffset;
        if (contentOffset.x - (SCREEN_WIDTH/2-rect.origin.x-titleWidth/2)<=0) {
            [_scroll setContentOffset:CGPointMake(0, contentOffset.y) animated:YES];
        } else if (contentOffset.x - (SCREEN_WIDTH/2-rect.origin.x-titleWidth/2)+SCREEN_WIDTH>=_titleArray.count*titleWidth) {
            [_scroll setContentOffset:CGPointMake(_titleArray.count*titleWidth-SCREEN_WIDTH, contentOffset.y) animated:YES];
        } else {
            [_scroll setContentOffset:CGPointMake(contentOffset.x - (SCREEN_WIDTH/2-rect.origin.x-titleWidth/2), contentOffset.y) animated:YES];
        }
    }];
    
}

//监听滚动事件判断当前拖动到哪一个了
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    double index = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    _sliderView.frame = CGRectMake(titleWidth*index + 15, titleHeight-2, titleWidth - 30, 2);
    
    if (scrollView == _scrollView) {
        [self selectButton:index];
    } else {
        
    }
}

- (void)initWithController
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self.navigationController.navigationBar) {
        [self.navigationController.navigationBar setTranslucent:NO];
        scrollView.frame = CGRectMake(0, CGRectGetMaxY(_scroll.frame), SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight);
    } else {
        _scroll.frame = CGRectMake(0, 10, SCREEN_WIDTH, 40);
        scrollView.frame = CGRectMake(0, CGRectGetMaxY(_scroll.frame), SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight);
    }
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor colorWithWhite:0.900 alpha:1.000];
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_controllerArray.count, SCREEN_HEIGHT-titleHeight);
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    for (int i = 0; i < _controllerArray.count; i++) {
        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        UIViewController *viewcontroller = _controllerArray[i];
        viewcon = viewcontroller.view;
        viewcon.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//                viewcon.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];        
        [scrollView addSubview:viewcon];
        
    }
}


@end
