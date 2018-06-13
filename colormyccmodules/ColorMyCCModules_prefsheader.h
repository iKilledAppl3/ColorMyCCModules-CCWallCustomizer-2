//libcephei prefs headers we need 
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>
//regular ones we need 
#import <UIKit/UIKit.h>
#import "../ColorMyCCModules_header.h"
#import "../CCWallCustomizer2Classes.h"
#import <version.h>
#import "DarkMessagesTheme.h"
//#import <Preferences/PSSwitchTableCell.h>

//define stuff here :P
#define CMCCImagePath @"/Library/Application Support/ColorMyCCModules/ColorMyCCModules.png"

static NSString *colorMyCCImagePath  = @"/Library/PreferenceBundles/ColorMyCCModules.bundle/ColorMyCCModules.png";

//preferences interface 

@interface ColorMyCCModulesListController: HBListController {
}
@end

@interface PSControlTableCell : PSTableCell 
@end

@interface PSSwitchTableCell : PSControlTableCell 
@end

@interface CMCCCell : PSSwitchTableCell
@end