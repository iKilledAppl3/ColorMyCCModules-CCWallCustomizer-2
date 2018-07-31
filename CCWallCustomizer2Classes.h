//
//  CCWallCustomizer2Classes
//  
//
//  Created by iKilledAppl3 on 3/4/18.
//
//

#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>
#import <UIKit/UIKit.h>
#import <rocketbootstrap/rocketbootstrap.h>
#import <Cephei/HBPreferences.h>

@interface ccwallcustomizer2ListController : HBListController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@end

@interface MTMaterialView : UIView {
    
}
@end

@interface SBFluidSwitcherViewController : UIViewController {

}
@end

@interface _MTBackdropView : UIView {
	
}
@property (assign,nonatomic) double blurRadius; 
@end


@interface SBControlCenterController : NSObject {

}
+ (id)sharedInstance;
- (void)dismissAnimated:(BOOL)arg1;
@end

@interface CCUIModularControlCenterOverlayViewController : UIViewController {
    MTMaterialView* _backgroundView;
}
@property (nonatomic,retain) MTMaterialView * overlayBackgroundView; 
@end
