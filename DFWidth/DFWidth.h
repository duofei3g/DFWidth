//
//  DFWidth.h
//  NewFloodControl
//
//  Created by 软件技术中心 on 2017/5/19.
//  Copyright © 2017年 duofei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFWidth : NSObject
//根据传入的数值自动计算在不同屏幕（iphone）的相对大小
+(CGFloat )Width:(CGFloat)width;
+(CGFloat )Height:(CGFloat)height;
+(CGFloat )string:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize;
+(void)showAlertWithContext:(NSString *)text controller:(UIViewController *)vc;
+(void)showAlertAndPopWithContext:(NSString *)text controller:(UIViewController *)vc;
+ (BOOL)isNum:(NSString *)checkedNumString;//判断字符串是否为纯数字
+(BOOL)isOnlyhasNumberAndpointWithString:(NSString *)string;//是否只包含数字，小数点，负号
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+(UIView *)drawDashLine:(CGRect )frame lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;
/**自动计算文本高度
 ** string:   文本内容
 ** font:     字体大小
 ** width:    文本所占的宽度
 **/
+(CGFloat )stringHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width;
+(void)showAlertWithContext:(NSString *)text controller:(UIViewController *)vc doneBlock:(void(^)())doneBlock cancelBlock:(void (^)())cancelBlock;
+(void)showHWOAAlertWithContext:(NSString *)text controller:(UIViewController *)vc doneBlock:(void(^)())doneBlock cancelBlock:(void (^)())cancelBlock;
+(void)showSureAlertWithContext:(NSString *)text controller:(UIViewController *)vc doneBlock:(void(^)())doneBlock;
///自定义按钮名称，带block
+(void)showCommenAlertContext:(NSString *)text BtnTitleA:(NSString *)titleA BtnTitleB:(NSString *)titleB controller:(UIViewController *)vc doneBlock:(void(^)(void))doneBlock cancelBlock:(void (^)(void))cancelBlock;
+(NSAttributedString *)getAttribuedWithName:(NSString *)name value:(NSString *)value DanWei:(NSString *)danwei fontSize1:(UIFont *)font1 fontSize2:(UIFont *)font2 fontSize3:(UIFont *)font3 color1:(UIColor *)color1;
//回到列表页并刷新
+(void)toHome:(UIViewController *)vc;
///pageNum :回退的页数
+(void)toHome:(UIViewController *)vc BackPage:(NSInteger)pageNum;

+(void)showPopAlertWithContext:(NSString *)text controller:(UIViewController *)vc;

+ (NSString *)dfTimaeFormetter:(NSString *)dateStr;
+(void)saveUserInfo;
+ (BOOL)valiMobile:(NSString *)mobile;

+(NSMutableArray *)getSubString:(NSString *)str;//拆解返回的长字符串(超标水质以及倍数)

/*
 专门转换因为后台懒没有转换时间格式的问题！！！
 dateStr:返回的数据库格式的时间例如：Aug 23, 2018 12:00:00 AM-Aug 23
 formmater：你想要转成的格式如：yyyy-MM-dd
 */
///专门转换后台懒，没有转换时间格式的问题！！！
+(NSString *)dateStr:(NSString *)dateStr Formmater:(NSString *)formmater;

+(CAGradientLayer *)ColorTranslationWithBegin:(UIColor *)beginColor End:(UIColor *)endColor frame:(CGRect)frame StartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint;
/*
 比较两个日期：
 返回值：0 相等 1：开始时间小于结束时间 2：开始时间大于结束时间
 */
+(NSInteger)CompareBegin:(NSString *)begin end:(NSString *)end;
@end
