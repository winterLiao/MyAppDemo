//
//  DefineTheme.h
//  MyApp
//
//  Created by liaowentao on 17/3/27.
//  Copyright © 2017年 Haochuang. All rights reserved.
//
// 定义控件大小、字体大小、各类颜色

#ifndef DefineTheme_h
#define DefineTheme_h

//RGB转UIColor（不带alpha值）
#define UIColorFromRGB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB转UIColor（带alpha值）
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

//颜色
#define TITLE_COLOR [UIColor blackColor]//标题颜色
#define TEXT_COLOR [UIColor grayColor]//正文颜色
#define TIPTEXT_COLOR UIColorFromRGB(0x888888)//提示语文本颜色
#define MAIN_GROUNDCOLOR UIColorFromRGB(0x2ab1e7)//主题景色
#define BACKGROUNDCOLOR UIColorFromRGB(0xF7F7F7)//背景颜色
//字体大小
#define TITLEFONT [UIFont systemFontOfSize:18]
#define TEXTFONT [UIFont systemFontOfSize:16]
#define TIPTEXTFONT [UIFont systemFontOfSize:12]

//app中统一的一些size定义
#define Cell_Height 50
#define LeftOrigin 20 //控件左边距
#define Button_Height 45
#define Button_Width SCREEN_WIDTH - LeftOrigin * 2
#define ButtonLayerCornerRadius 2 //按钮圆角
#define LineColor UIColorFromRGB(0xCCCCCC) //线条颜色
#define LineWidth 0.5f //线条粗度
#define WHITCOLOR [UIColor whiteColor]
/**根据6为标准适配*/
#define ADAPTATIONIPHONE(Height) [CommonMethods adaptationIphone6Height:Height]


#endif /* DefineTheme_h */
