#import <libcolorpicker.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <Cephei/HBPreferences.h>

//Created by iKilledAppl3 on Thursday, March 28, 2018
//Coloroize the Control Center modules on iOS 11

//Tweak stuff
HBPreferences *preferences;
//see if tweak is enabled!
static BOOL kIsEnabled;
static NSString *kChosenColor;

@class NSString, UIColor;
@interface MTSystemModuleMaterialSettings : NSObject {
	
}
-(UIColor *)baseOverlayColor;
@end

@interface _UIBackdropView : UIView
@end

@interface _MTBackdropView : UIView {
	
}
@property (assign,nonatomic) double blurRadius; 
@end

@interface NCMaterialView : UIView
@end


@interface CCUIControlCenterPagePlatterView : UIView {
    UIImageView *_whiteLayerView;
    NCMaterialView* _baseMaterialView;
}
@end

@interface HSKCardBackdropView : _UIBackdropView {
	_UIBackdropView *_backdropView;
}
-(id)backdropView;
-(id)cutoutView;
-(void)layoutSubviews;
-(void)setupBackdropView:(id)arg1;
-(void)setupCutoutview:(id)arg1;

@end

