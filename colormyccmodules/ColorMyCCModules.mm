#import "ColorMyCCModules_prefsheader.h"
 UIActivityViewController *activityViewController;
@implementation ColorMyCCModulesListController


- (id)init {
	if (self = [super init]) {
		//Thanks @sticktron
		[DarkMessagesTheme themeStuffInClasses:@[self.class]];
		
	}
	return self;
}


+ (NSString *)hb_specifierPlist {
    return @"ColorMyCCModules";
    
}

//share button
-(void)loadView {
    [super loadView];
    UIImage *imageForTitle = [UIImage imageWithContentsOfFile:colorMyCCImagePath];
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:imageForTitle];
	
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
}

//tint color to use for toggles and buttons 
+ (UIColor *)hb_tintColor {
    return [UIColor colorWithRed:255.0/255.0 green:20.0/255.0 blue:147.0/255.0 alpha:1.0];
		
}

-(void)viewWillAppear:(BOOL)animated {
	[self reload];
	[super viewWillAppear:animated];
      self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.11 green:0.11 blue:0.114 alpha:1.0];

	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	
}

-(void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationController.navigationBar.barTintColor = nil;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillDisappear:animated];
}

//share button action 
- (void)shareTapped {
   
    NSString *shareText = @"Colorize you Control Center modules with #ColorMyCCModules by @iKilledAppl3! Download from BigBoss repo in Cydia for free!";
	
    UIImage *image = [UIImage imageWithContentsOfFile:CMCCImagePath];
    NSArray * itemsToShare = @[shareText, image];
    
	
	UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:itemsToShare applicationActivities:nil];
    
    // and present it
    [self presentActivityController:controller];
}

- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.rightBarButtonItem;
 
}


-(void)respring {
    system ("killall SpringBoard");
}

@end



//Thanks @sticktron
@implementation CMCCCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
	if (self) {
		[self.textLabel setTextColor:[DarkMessagesTheme cellTextColor]];
		self.separatorInset = UIEdgeInsetsZero;
	}
	return self;
}
@end

// vim:ft=objc
