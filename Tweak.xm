//Created by iKilledAppl3
//Colorize your Control Center modules with ease!
//Created on Thursday, March 28, 2018

#import "ColorMyCCModules_header.h"


//iOS 10

%hook NCMaterialView
-(void)_configureWhiteOverlayViewIfNecessary {
	if (kIsEnabled && [self.class isKindOfClass:[%c(CCUIControlCenterPagePlatterView) class]]) {
		UIView *_whiteOverlayView = [self valueForKey:@"_whiteOverlayView"];
		_whiteOverlayView.hidden = YES;
		_whiteOverlayView.backgroundColor = nil;
		[_whiteOverlayView removeFromSuperview];
	}
         else {
       %orig;
}

}
%end

%hook CCUIControlCenterPagePlatterView
-(void)layoutSubviews {
     if (kIsEnabled) {
  %orig;
UIImageView *imgView = [self valueForKey:@"_whiteLayerView"];
imgView.alpha = 0.5;
imgView.backgroundColor = LCPParseColorString(kChosenColor, @"000000");

}

     else {

      %orig;
 }
}
%end

//Haystack 
%hook HSKCardBackdropView
-(void)setBackdropView:(id)arg1 {
	if (kIsEnabled) {
		%orig(arg1);
		
		self.backgroundColor = LCPParseColorString(kChosenColor, @"000000");
	}
	
	else {
		 %orig;
	}
}

%end

%hook MTSystemModuleMaterialSettings
-(UIColor *)baseOverlayColor {
	if (kIsEnabled ) {
		return LCPParseColorString(kChosenColor, @"000000");
	}
	
	else {
		return %orig;
	}
}
%end
	
extern NSString *const HBPreferencesDidChangeNotification;
	//Prefs new 


%ctor {

dlopen ("/usr/lib/TweakInject/Haystack.dylib", RTLD_NOW);

             preferences = [[HBPreferences alloc] initWithIdentifier:@"com.ikilledappl3.colormyccmodules"];

			 [preferences registerBool:&kIsEnabled default:NO forKey:@"kIsEnabled"];
			 [preferences registerObject:&kChosenColor default:nil forKey:@"kChosenColor"];
			
	
	
}


