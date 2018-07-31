#import "CCWallCustomizer2Classes.h"
#import <sys/stat.h>
#import <dlfcn.h>

#define customImgPath @"/var/mobile/Documents/ccwall.png"
#define cImgPath @"/var/mobile/CCWallCustomizer2/ccwall.png"
#define plist @"/var/mobile/Library/Preferences/com.ikilledappl3.ccwallcustomizer2.plist"

static BOOL kEnabled;

#define isiPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

UIImageView *ccImageView;

//CCWallCustomizer 2 is a tweak for iOS 11+ that customizes the background of the control center.
//Created by iKilledAppl3 :P


%hook SBFluidSwitcherViewController
 -(void)viewDidLoad {
        if (kEnabled && isiPad) {
                %orig;
            ccImageView =  [[UIImageView alloc] init];
		ccImageView.frame = self.view.frame;
		ccImageView.bounds = self.view.bounds;

		ccImageView.image = [UIImage imageWithContentsOfFile:cImgPath];
		if ([[NSFileManager defaultManager] fileExistsAtPath:customImgPath]) {
		system("mv /var/mobile/Documents/ccwall.png /var/mobile/CCWallCustomizer2/");
	}
 //fit to the view
		ccImageView.contentMode = UIViewContentModeScaleAspectFill;
 //make the image clips to bounds
//imgView.clipsToBounds = YES;
 //fix landscape bug 
		ccImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;


		ccImageView.alpha = 1.0;
		[ccImageView.layer setOpaque:NO];
//add the image view as a sub view of the background view 
		[self.view addSubview:ccImageView];
		[self.view sendSubviewToBack:ccImageView];

		[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationDuration:0.8];
				[ccImageView setAlpha:1];
				[UIView commitAnimations];

		
		

}
       else {
       %orig;
    }
}

 -(void)willMoveToParentViewController:(id)arg1 {
        if (kEnabled && isiPad) {
                %orig;
            	[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationDuration:0.8];
				[ccImageView setAlpha:0];
				[UIView commitAnimations];
}
       else {
       %orig;
    }
}
%end


%hook CCUIModularControlCenterOverlayViewController 
	
-(void)viewDidLoad {
	if (kEnabled) {
		%orig;
		MTMaterialView* backgroundView = [self valueForKey:@"_backgroundView"];
		[backgroundView removeFromSuperview];
       
       //Thanks to @laughingquoll probably not needed for my tweak but I added anyhow 
       self.overlayBackgroundView.tag = 453112;
		self.overlayBackgroundView.hidden = YES;

		ccImageView =  [[UIImageView alloc] init];
		ccImageView.frame = self.view.frame;
		ccImageView.bounds = self.view.bounds;

		ccImageView.image = [UIImage imageWithContentsOfFile:cImgPath];
		if ([[NSFileManager defaultManager] fileExistsAtPath:customImgPath]) {
		system("mv /var/mobile/Documents/ccwall.png /var/mobile/CCWallCustomizer2/");
	}

 //fit to the view
		ccImageView.contentMode = UIViewContentModeScaleAspectFill;
 //make the image clips to bounds
//imgView.clipsToBounds = YES;
 //fix landscape bug 
		ccImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;


		ccImageView.alpha = 1.0;
		[ccImageView.layer setOpaque:NO];
//add the image view as a sub view of the background view 
		[self.view addSubview:ccImageView];
		[self.view sendSubviewToBack:ccImageView];

		
		
	}
	
	
	else {
		%orig;
	}
}

-(void)presentAnimated:(BOOL)arg1 withCompletionHandler:(/*^block*/id)arg2 {
				if (kEnabled) {
                          	%orig;
				[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationDuration:0.8];
				[ccImageView setAlpha:1];
				[UIView commitAnimations];
			}
			
			  else {
				%orig;
			}
}
		

-(void)dismissAnimated:(BOOL)arg1 withCompletionHandler:(/*^block*/id)arg2 {
	if (kEnabled) {
                 	%orig;
				[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationDuration:0.8];
				[ccImageView setAlpha:0];
				[UIView commitAnimations];
			}
			
			else {
				%orig;
			}
}
%end


      //Thanks to @laughingquoll probably not needed for my tweak but I added anyhow 
%hook MTMaterialView 
-(void)setWeighting:(CGFloat)arg1 {
	if (kEnabled && self.tag == 453112) {
		%orig;
		ccImageView.alpha = arg1;
	}
	
	else {
		%orig;
	}
}
%end

HBPreferences *myPrefs;
	//Prefs new 


%ctor {
	
	  myPrefs = [[HBPreferences alloc] initWithIdentifier:@"com.ikilledappl3.ccwallcustomizer2"];

	  [myPrefs registerBool:&kEnabled default:NO forKey:@"kEnabled"];
	
}

