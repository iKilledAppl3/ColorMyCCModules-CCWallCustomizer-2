#import "DarkMessagesTheme.h"
#import "../CCWallCustomizer2Classes.h"
#import <version.h>
#define ccImagePath @"/Library/Application Support/ColorMyCCModules/ColorMyCCModules2.PNG"
static NSString *imgPath = @"/var/mobile/Documents/";

#define ccWallImgPath @"/Library/PreferenceBundles/ColorMyCCModules.bundle/CCWallCustomizer2.png"

#define IOS10_VERSION (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_10_0 && kCFCoreFoundationVersionNumber <= kCFCoreFoundationVersionNumber_iOS_10_3)

UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];

@implementation ccwallcustomizer2ListController

- (id)init {
	if (self = [super init]) {
		//Thanks @sticktron
		[DarkMessagesTheme themeStuffInClasses:@[self.class]];
		
	}
	return self;
}


+ (NSString *)hb_specifierPlist {
	return @"ccwallcustomizer2";
	
}


+ (UIColor *)hb_tintColor {
	return [UIColor colorWithRed:255.0/255.0 green:127.0/255.0 blue:80.0/255.0 alpha:1.0];
}

-(void)loadView {
    [super loadView]; 

      UIImage *imageForText = [UIImage imageWithContentsOfFile:ccWallImgPath];
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:imageForText];

	if (IOS10_VERSION) {
	
		UIAlertController *alertController =  [UIAlertController
		 alertControllerWithTitle:@"Unsupported iOS Version"
			 message:@"This version of CCWallCustomizer is only Supported on iOS 11!"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction
			actionWithTitle:@"OK"
                                      style:UIAlertActionStyleDefault
			handler:nil];
										  
	[alertController addAction:okAction];
	 [self presentViewController:alertController animated:YES completion:nil];
	  PSSpecifier *specifier = [self specifierForID:@"kEnabled"];
			[specifier setProperty:@NO forKey:@"enabled"];
			[specifier setProperty:@NO forKey:@"default"];
	
}

self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];

	
}


-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
}

-(void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.11 green:0.11 blue:0.114 alpha:1.0];
    self.navigationController.navigationController.navigationBar.tintColor = nil;
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewWillDisappear:animated];
}



- (void)shareTapped {
    NSString *text = [NSString stringWithFormat:@"I customized my Control Center background using #CCWallCustomizer 2 by @iKilledAppl3! Download #ColorMyCCModules in Cydia to use this tweak!"];

  UIImage *image = [UIImage imageWithContentsOfFile:ccImagePath];
    NSArray * itemsToShare = @[text, image];
   
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

	system ("killall -9 backboardd");	
}

-(void)imgFileSysCheck {
        
	UIAlertController *imgAlert = [UIAlertController
		alertControllerWithTitle:@"CCWallCustomizer 2"
			message:@"No Image Found! Please Set an image for the Control Center!"
		         preferredStyle:UIAlertControllerStyleAlert];
	
	   
	UIAlertAction* ok = [UIAlertAction
		actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
		        handler:^(UIAlertAction * action)
                                 {
                                    	
	   UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                          imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                          imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                          imagePicker.delegate = self;
                                          imagePicker.allowsEditing = NO;
                                          [self presentViewController:imagePicker animated:YES completion:nil];
                                     
										  }];
        
        
	[imgAlert addAction:ok];
	[self presentViewController:imgAlert animated:YES completion:nil];
}

-(void)doesImageExist {
	
	UIAlertController *imgAlert = [UIAlertController
		alertControllerWithTitle:@"CCWallCustomizer 2"
			message:@"No Image Found! Please Set an image for the Control Center!"
		         preferredStyle:UIAlertControllerStyleAlert];
	
	   
	UIAlertAction* ok = [UIAlertAction
		actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
		      handler:^(UIAlertAction * action)
                                 {
                                    	
	   UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                          imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                          imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                          imagePicker.delegate = self;
                                          imagePicker.allowsEditing = NO;
                                          [self presentViewController:imagePicker animated:YES completion:nil];
                                     
									 }];
        
        
	[imgAlert addAction:ok];
	[self presentViewController:imgAlert animated:YES completion:nil];


}

-(void)imagePicked {
    UIAlertController *view =  [UIAlertController
                                    alertControllerWithTitle:@"Image Options"
                                    message:@"Choose what you want below"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* crop = [UIAlertAction
                                      actionWithTitle:@"Crop"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action)
                                      {
                                          NSString *pathForImage = [imgPath stringByAppendingPathComponent:@"ccwall.png"];

			 if (![[NSFileManager defaultManager] fileExistsAtPath:pathForImage]) {
				 
				 
				 [self performSelector:@selector(imgFileSysCheck) withObject:nil];
				 
				 }	 else  {
					
										  
                                          UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                          imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                          imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                          imagePicker.delegate = self;
                                          imagePicker.allowsEditing = YES;
                                          [self presentViewController:imagePicker animated:YES completion:nil];
				}						  
                                          
                                      }];
        
        UIAlertAction* noCrop = [UIAlertAction
                                            actionWithTitle:@"No Crop"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action)
                                            {
                                                
			NSString *pathForImage = [imgPath stringByAppendingPathComponent:@"ccwall.png"];

			 if (![[NSFileManager defaultManager] fileExistsAtPath:pathForImage]) {
				 
				 [self performSelector:@selector(doesImageExist) withObject:nil];
				 
				 }	
				
				
				 else  {
					
					 

                                                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                                imagePicker.delegate = self;
                                                imagePicker.allowsEditing = NO;
                                                [self presentViewController:imagePicker animated:YES completion:nil];
				}
                                            }];
  
        
        
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleCancel
                                 handler:^(UIAlertAction * action)
                                 {
                                     [view dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        
        [view addAction:crop];
        [view addAction:noCrop];
        [view addAction:cancel];
        [self presentViewController:view animated:YES completion:nil];
        
       


        
    }
	
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirDoc = [paths objectAtIndex:0];
    NSString *path = [dirDoc stringByAppendingPathComponent:@"ccwall.png"];
     NSData *dataToWrite = UIImagePNGRepresentation(picture);
     [dataToWrite writeToFile:path atomically:YES];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
		
		UIAlertController *pathErrorAlert = [UIAlertController
		alertControllerWithTitle:@"CCWallCustomizer 2"
			message:@"Error while saving the image to the filesystem! Try Again!"
		         preferredStyle:UIAlertControllerStyleAlert];
	
	   
	UIAlertAction* ok = [UIAlertAction
		actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
		        handler:nil];
        
        
	[pathErrorAlert addAction:ok];
	[self presentViewController:pathErrorAlert animated:YES completion:nil];
		
		//Force the file to write to the path we specified even if it throws an error!
		//Using this method
		[[NSFileManager defaultManager] createFileAtPath:dirDoc contents:nil attributes:nil];
		
		
     [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    else if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		UIAlertController *successAlert = [UIAlertController
		alertControllerWithTitle:@"CCWallCustomizer 2"
			message:@"Success the image has been saved! Your Device Will Respring!"
		         preferredStyle:UIAlertControllerStyleAlert];
	
	   
	UIAlertAction* ok = [UIAlertAction
		actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
			 handler:nil];
        
        
             [successAlert addAction:ok];
	[imagePicker release];
   [self dismissViewControllerAnimated:YES completion:nil];
   [self presentViewController:successAlert animated:YES completion:nil];
   [self performSelector:@selector(respring) withObject:nil afterDelay:2.0];
        

    }
    
    else if (picture == nil) {
		
		UIAlertController *error = [UIAlertController
			alertControllerWithTitle:@"Error!"
				message:@"There was an error while retrieving the image!"
		         preferredStyle:UIAlertControllerStyleAlert];
	
	   
	UIAlertAction* ok = [UIAlertAction
		actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
		        handler:nil];
        
        
	[error addAction:ok];
	[self presentViewController:error animated:YES completion:nil];
      
    }
	
	
    
	
	else {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [imagePicker release];
		
    
}


}


-(void)removeCCImage {
    
    NSString *photoPath = [imgPath stringByAppendingPathComponent:@"ccwall.png"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:photoPath]) {
		
		UIAlertController *alert = [UIAlertController
			alertControllerWithTitle:@"CCWallCustomizer 2"
				message:@"The image has been removed from the file system."
		         preferredStyle:UIAlertControllerStyleAlert];
	
	   
	UIAlertAction* ok = [UIAlertAction
		actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
		        handler:nil];
        
        
	[alert addAction:ok];
	[self presentViewController:alert animated:YES completion:nil];
	
        	   	  NSFileManager *fileManager = [[NSFileManager alloc] init];
		  [fileManager removeItemAtPath:photoPath error:nil];

		  
    }
    
    else if
        (![[NSFileManager defaultManager] fileExistsAtPath:photoPath]) {
			UIAlertController *alert = [UIAlertController
			alertControllerWithTitle:@"CCWallCustomizer 2"
				message:@"Error! Can't remove the file or it doesn't exist!"
		         preferredStyle:UIAlertControllerStyleAlert];
	
	   
	UIAlertAction* ok = [UIAlertAction
		actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
		        handler:nil];
        
        
	[alert addAction:ok];
	[self presentViewController:alert animated:YES completion:nil];
        }
            else {
               NSString *photoPath = [imgPath stringByAppendingPathComponent:@"ccwall.png"];
             	  NSFileManager *fileManager = [[NSFileManager alloc] init];
	  [fileManager removeItemAtPath:photoPath error:nil];	  

            }
    
}

@end
// vim:ft=objc
