//
//  DarkMessagesTheme.h
//  Theme controller for DarkMessages
//
//  ©2017 Sticktron
// Modified by @iKilledAppl3 
// To work with other tweaks 
//

@interface DarkMessagesTheme : NSObject

//+ (UIColor *)tintColor;
+ (UIColor *)bgColor;
+ (UIColor *)separatorColor;
+ (UIColor *)cellBgColor;
+ (UIColor *)cellTextColor;
+ (UIColor *)footerTextColor;
+ (UIColor *)chevronColor;

+ (void)themeStuffInClasses:(NSArray *)classes;
@end
