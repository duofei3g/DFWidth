
//
//  DFWidth.m DF  = duofei
//  NewFloodControl
//
//  Created by 软件技术中心 on 2017/5/19.
//  Copyright © 2017年 duofei. All rights reserved.
//

#import "DFWidth.h"
//#import "NSObject+GetIp.h"
#define IsIPHONE UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone
#define IsIPad UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

#define NUMBERS @"0123456789.-"

//数字
#define NUM @"0123456789"
//字母
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
//数字和字母
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
//数字和点
#define NUMANDD @".0123456789"

@implementation DFWidth
+(CGFloat )Width:(CGFloat)width{
    CGFloat w = (width/375) *kDeviceWidth;
    if (IsIPHONE) {
        return w;
    }else{
        return width;
    }
}

+(CGFloat )Height:(CGFloat)height{
    CGFloat h = (height/667) *KDeviceHeight;
    return h;
}

#pragma mark - 动态计算cell高度方法一
+(CGFloat )string:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    //返回文本绘制所需的空间
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}
#pragma mark-带block的alert-
+(void)showAlertWithContext:(NSString *)text controller:(UIViewController *)vc doneBlock:(void(^)())doneBlock cancelBlock:(void (^)())cancelBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示，您有新的通知！" message:text preferredStyle:UIAlertControllerStyleAlert];
    // 设置按钮
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"前往查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        doneBlock();
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"算了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelBlock();
    }];
    // 添加按钮
    [alert addAction:defult];
    [alert addAction:cancel];
    //显示
    [vc presentViewController:alert animated:YES completion:nil];
}

#pragma mark-通用带block的alert-
+(void)showCommenAlertContext:(NSString *)text BtnTitleA:(NSString *)titleA BtnTitleB:(NSString *)titleB controller:(UIViewController *)vc doneBlock:(void(^)(void))doneBlock cancelBlock:(void (^)(void))cancelBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:text message:nil preferredStyle:UIAlertControllerStyleAlert];
    // 设置按钮
    UIAlertAction *defult = [UIAlertAction actionWithTitle:titleA style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        doneBlock();
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:titleB style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelBlock();
    }];
    // 添加按钮
    [alert addAction:defult];
    [alert addAction:cancel];
    //显示
    [vc presentViewController:alert animated:YES completion:nil];
}

#pragma mark-海委OA专用带block的alert-
+(void)showHWOAAlertWithContext:(NSString *)text controller:(UIViewController *)vc doneBlock:(void(^)())doneBlock cancelBlock:(void (^)())cancelBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:text message:nil preferredStyle:UIAlertControllerStyleAlert];
    // 设置按钮
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"部门主要（其他负责人）" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        doneBlock();
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"其他人员（含正负除非领导职务）" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelBlock();
    }];
    // 添加按钮
    [alert addAction:defult];
    [alert addAction:cancel];
    //显示
    [vc presentViewController:alert animated:YES completion:nil];
}

#pragma mark-带且只带确定block的alert-
+(void)showSureAlertWithContext:(NSString *)text controller:(UIViewController *)vc doneBlock:(void(^)())doneBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:text message:nil preferredStyle:UIAlertControllerStyleAlert];
    // 设置按钮
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        doneBlock();
    }];
    // 添加按钮
    [alert addAction:defult];
    //显示
    [vc presentViewController:alert animated:YES completion:nil];
}



+(void)showAlertWithContext:(NSString *)text controller:(UIViewController *)vc{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示！" message:text preferredStyle:UIAlertControllerStyleAlert];
    // 设置按钮
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    // 添加按钮
    [alert addAction:defult];
    //显示
    [vc presentViewController:alert animated:YES completion:nil];
}

+(void)showPopAlertWithContext:(NSString *)text controller:(UIViewController *)vc{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示！" message:text preferredStyle:UIAlertControllerStyleAlert];
    // 设置按钮
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    // 添加按钮
    [alert addAction:defult];
    //显示
    [vc presentViewController:alert animated:YES completion:nil];
}

//适用已经是在模态的页面上在弹出alert
+(void)showAlertAndPopWithContext:(NSString *)text controller:(UIViewController *)vc{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示！" message:text preferredStyle:UIAlertControllerStyleAlert];
    // 设置按钮
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //pop回上上级页面
        int index = (int)[[vc.navigationController viewControllers]indexOfObject:vc];
        [vc.navigationController popToViewController:[vc.navigationController.viewControllers objectAtIndex:(index -2)] animated:YES];
    }];
    // 添加按钮
    [alert addAction:defult];
    //显示
    [vc presentViewController:alert animated:YES completion:nil];
}

+ (BOOL)isNum:(NSString *)checkedNumString {
    checkedNumString = [checkedNumString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(checkedNumString.length > 0) {
        return NO;
    }
    return YES;
}

#pragma mark -是否只包含数字，小数点，负号
+(BOOL)isOnlyhasNumberAndpointWithString:(NSString *)string{
    
    NSCharacterSet *cs=[[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    
    NSString *filter=[[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    return [string isEqualToString:filter];
    
}

//+(UIView *)getXuXian{
//    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, 100, kDeviceWidth-20, 1)];
//    [self drawDashLine:line lineLength:2 lineSpacing:1 lineColor:borderGray];
//}

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/


+(UIView *)drawDashLine:(CGRect )frame lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    UIView *lineView = [[UIView alloc]initWithFrame:frame];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
    
    return lineView;
}

+(CGFloat )stringHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width{
    CGFloat otherH = 15;
    //返回文本绘制所需的空间
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height+otherH;
}

#pragma mark -获取富文本3-
+(NSAttributedString *)getAttribuedWithName:(NSString *)name value:(NSString *)value DanWei:(NSString *)danwei fontSize1:(UIFont *)font1 fontSize2:(UIFont *)font2 fontSize3:(UIFont *)font3 color1:(UIColor *)color1{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@ %@",name,value,danwei]];
    
    //    [AttributedStr addAttribute:NSForegroundColorAttributeName
    //
    //                          value:TGray
    //
    //                          range:NSMakeRange(0, AttributedStr.length)];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:font1
     
                          range:NSMakeRange(0, name.length)];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:font2
     
                          range:NSMakeRange(name.length, value.length)];
    //    [AttributedStr addAttribute:NSFontAttributeName
    //
    //                          value:font3
    //
    //                          range:NSMakeRange(name+value.length, danwei.length)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color1
     
                          range:NSMakeRange(name.length, value.length)];
    
    
    return AttributedStr;
}

+(void)toHome:(UIViewController *)vc{
    UIViewController * viewVC = [vc.navigationController.viewControllers objectAtIndex:vc.navigationController.viewControllers.count - 3];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"xreload" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginRefresh" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadHome" object:nil];
    [vc.navigationController popToViewController:viewVC animated:YES];
}

+(void)toHome:(UIViewController *)vc BackPage:(NSInteger)pageNum{///pageNum :回退的页数
    UIViewController * viewVC = [vc.navigationController.viewControllers objectAtIndex:vc.navigationController.viewControllers.count - pageNum];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"xreload" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginRefresh" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadHome" object:nil];
    [vc.navigationController popToViewController:viewVC animated:YES];
}
+ (NSString *)dfTimaeFormetter:(NSString *)dateStr {
    
    NSDateFormatter *formarter = [[NSDateFormatter alloc]init];
    [formarter setDateFormat:@"MMM d, yyyy h:mm:ss aa"];
    [formarter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *now = [formarter dateFromString:dateStr];
//    NSLog(@"now :%@",now);
    NSDateFormatter *formarter2 = [[NSDateFormatter alloc]init];
    [formarter2 setDateFormat:@"aa hh:mm"];
    NSString *date = [formarter2 stringFromDate:now];
    
    return date;
}

//+(void)saveUserInfo{
//    NSString* userPhoneName = [[UIDevice currentDevice] name];
//    //设备名称
//    NSString* deviceName = [[UIDevice currentDevice] systemName];
//    //手机系统版本
//    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
//    //手机型号
//    NSString* phoneModel = [[UIDevice currentDevice] model];
//    //地方型号  （国际化区域名称）
//    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
//    
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    // 当前应用名称
//    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    // 当前应用软件版本  比如：1.0.1
//    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    //    // 当前应用版本号码   int类型
//    //    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
//    NSDictionary *IP =[NSObject getIPAddresses];
//    
//    NSLog(@"手机别名: %@", userPhoneName);
//    NSLog(@"设备名称: %@",deviceName );
//    NSLog(@"手机系统版本: %@", phoneVersion);
//    NSLog(@"手机型号: %@",phoneModel );
//    NSLog(@"国际化区域名称: %@",localPhoneModel );
//    NSLog(@"当前应用名称：%@",appCurName);
//    NSLog(@"当前应用软件版本:%@",appCurVersion);
//    NSLog(@"IIIIIPPPPP = %@",IP);
//    
//    if (!appCurName) {
//        appCurName = @"天津水资源";
//    }
//    NSArray *keyArr =  @[@"Phone_NM",@"Device_NM",@"Phone_VS",@"Phone_TP",@"Phone_NM2",@"APP_NM",@"APP_VS",@"IP"];
//    
//    NSArray *infoArr = @[userPhoneName,deviceName,phoneVersion,phoneModel,localPhoneModel,appCurName,appCurVersion,IP];
//    for (int i = 0; i<keyArr.count; i++) {
//        [kDefaluts setObject:infoArr[i] forKey:keyArr[i]];
//    }
//}

#pragma mark- 判断是否为正确的手机号-
+(BOOL)valiMobile:(NSString *)mobile{
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}
#pragma mark -拆解返回的长字符串-
+(NSMutableArray *)getSubString:(NSString *)str{
    NSMutableArray *dataArr = [NSMutableArray array];
    NSInteger startRange = 0;
    NSInteger startRange2 = 0;
again:{
    for (int i = 0; i<str.length; i++) {
        unichar temp = [str characterAtIndex:i];
        if ([[[NSString alloc]initWithCharacters:&temp length:1]isEqualToString:@")"]) {
            if (i == str.length-1) {
                NSLog(@"最后一个：%@",str);
                //                str = [str stringByReplacingOccurrencesOfString:@"," withString:@""];
                [dataArr addObject:[str stringByReplacingOccurrencesOfString:@"," withString:@""]];
                break;
            }
            unichar temp0 = [str characterAtIndex:i+1];
            
            if ([[[NSString alloc]initWithCharacters:&temp0 length:1]isEqualToString:@"["]) {
                for (int j = 0; j<str.length; j++) {
                    unichar tem = [str characterAtIndex:j];
                    
                    if ([[[NSString alloc]initWithCharacters:&tem length:1]isEqualToString:@"]"]) {
                        NSLog(@"true = %@",[str substringWithRange:NSMakeRange(startRange, j+1-startRange)]);
                        [dataArr addObject:[[str substringWithRange:NSMakeRange(startRange, j+1-startRange)] stringByReplacingOccurrencesOfString:@"," withString:@""]];
                        
                        str = [str substringFromIndex:j+1];
                        goto again;
                        
                    }
                    
                }
            }else{
                unichar temp2 =  [str characterAtIndex:i-1];
                BOOL isnumber ;
                NSString *temp=[[NSString alloc]initWithCharacters:&temp2 length:1];
                if (temp.length == 0){
                    isnumber = NO;
                }else{
                    NSString *regex =@"^[0-9]+([.]{0,1}[0-9]+){0,1}$";
                    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
                    isnumber =  [pred evaluateWithObject:temp];
                }
                if (isnumber){
                    NSLog(@"no[]= %@", [str substringWithRange:NSMakeRange(startRange2, i+1-startRange2)]);
                    [dataArr addObject:[[str substringWithRange:NSMakeRange(startRange2, i+1-startRange2)] stringByReplacingOccurrencesOfString:@"," withString:@""]];
                    str = [str substringFromIndex:i+1];
                    goto again;
                    
                }
            }
        }
    }
}
    NSLog(@"dataArr = %@",dataArr);
    return dataArr;
}

+(NSString *)dateStr:(NSString *)dateStr Formmater:(NSString *)formmater{
    NSDateFormatter *formarter = [[NSDateFormatter alloc]init];
    [formarter setDateFormat:@"MMM d, yyyy h:mm:ss aa"];
    [formarter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *nowST = [formarter dateFromString:dateStr];
    NSString * changeST =  [nowST stringWithFormat:@"MM月dd日"];
    return changeST;
}

+(CAGradientLayer *)ColorTranslationWithBegin:(UIColor *)beginColor End:(UIColor *)endColor frame:(CGRect)frame StartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)beginColor.CGColor,  (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0.0, @0.5, @1.0];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = frame;
    return gradientLayer;
    
}

+(NSInteger)CompareBegin:(NSString *)begin end:(NSString *)end{
    NSInteger num = 100;
    NSDate *bTM;
    NSDate *eTM;
    if (begin.length==10&&end.length==10) {
        bTM =  [NSDate date:[begin substringWithRange:NSMakeRange(0, 10)] WithFormat:@"yyyy-MM-dd"];
        eTM =  [NSDate date:[end substringWithRange:NSMakeRange(0, 10)] WithFormat:@"yyyy-MM-dd"];
    }else{
        bTM =  [NSDate date:[begin substringWithRange:NSMakeRange(0, 13)] WithFormat:@"yyyy-MM-dd HH"];
        eTM =  [NSDate date:[end substringWithRange:NSMakeRange(0, 13)] WithFormat:@"yyyy-MM-dd HH"];
    }
    
    NSComparisonResult result = [bTM compare:eTM];
    if (result==NSOrderedSame)
    {
        num = 0;
    }else if (result==NSOrderedAscending)
    {
        num = 1;
        
    }else if (result==NSOrderedDescending)
    {
        num = 2;
        
    }
    NSLog(@"num:%ld",num);
    return num;
}


@end
