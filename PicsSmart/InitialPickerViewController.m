//
//  InitialPickerViewController.m
//  picsart.ai-hack
//
//  Created by Vladislav Shakhray on 02/12/2018.
//  Copyright © 2018 Vladislav Shakhray. All rights reserved.
//

#import "InitialPickerViewController.h"

//#import <CTAssetCheckmark.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "ViewController.h"
@interface InitialPickerViewController ()

@end

@implementation InitialPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isShowing = false;
    
    // Do any additional setup after loading the view.
}
- (IBAction)presentSelection:(id)sender {
//    QBImagePickerController *imagePickerController = [QBImagePickerController new];
//    imagePickerController.delegate = self;
//    imagePickerController.allowsMultipleSelection = YES;
//    imagePickerController.maximumNumberOfSelection = 6;
//    imagePickerController.showsNumberOfSelectedAssets = YES;
//    imagePickerController.numberOfColumnsInPortrait = 3;
//
//
//    [self presentViewController:imagePickerController animated:YES completion:NULL];
    
    
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // init picker
            CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
            
            // set delegate
            picker.delegate = self;
            
            // Optionally present picker as a form sheet on iPad
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                picker.modalPresentationStyle = UIModalPresentationFormSheet;
//            CTAssetCheckmark* checkmark = [CTAssetCheckmark new];
//            [picker setSelectedAssets:@[checkmark]];
            // present picker
            [self presentViewController:picker animated:YES completion:nil];
        });
    }];
    
//    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
//    elcPicker.maximumImagesCount = 4; //Set the maximum number of images to select, defaults to 4
//    elcPicker.returnsOriginalImage = NO; //Only return the fullScreenImage, not the fullResolutionImage
//    elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
//    elcPicker.onOrder = YES; //For multiple image selection, display and return selected order of images
//    elcPicker.imagePickerDelegate = self;
    
    //Present modally
//    [self presentViewController:elcPicker
//animated:YES completion:nil];
}

- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    _isShowing = true;
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"iden" sender:self];
//    [SVProgressHUD animateWithDuration:5.0 animations:nil completion:^(BOOL finished) {
//        [self performSegueWithIdentifier:@"iden" sender:self];
//    }];
//    dispatch_after(10 , <#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
    
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    _isShowing = true;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController* vc = segue.destinationViewController;
    _names = @[@"Vladislav S.", @"Yaroslav S.", @"Roman U.", @"Stas", @"Nikita", @"Artemkaa", @"Ilyuha"];
    _nicks = @[@"@shakhrayv", @"@bondspacex", @"ushakov.roma", @"super.cool", @"man.aiai", @"bondspacex", @"zueva_nadya"];
    _probabilities = @[@.999, @.997, @.772, @.733, @.709, @.552, @.520];
    _photos = @[[UIImage imageNamed:@"test_1"], [UIImage imageNamed:@"test_2"], [UIImage imageNamed:@"test_3"], [UIImage imageNamed:@"temp_4"], [UIImage imageNamed:@"temp_5"], [UIImage imageNamed:@"temp_6"], [UIImage imageNamed:@"temp_7"]];
    vc.names = _names;
    vc.nicks = _nicks;
    vc.probabilities = _probabilities;
    vc.photos = _photos;
    vc.mainImage = [UIImage imageNamed:@"temp_5"];
    vc.notchange = true;
}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated]
    ;
    _fffff.layer.cornerRadius = 14;
    
    
    //    supif (_isShowing) {
////    _names = @[@"Vladislav S.", @"Yaroslav S.", @"Roman U.", @"Stas", @"Nikita", @"Artemkaa", @"Ilyuha"];
////    _nicks = @[@"@shakhrayv", @"@yar.spirin", @"ushakov.roma", @"ddd", @"ekdmke", @"bb", @"aa"];
////    _probabilities = @[@.999, @.997, @.772, @.733, @.709, @.552, @.520];
////    _photos = @[[UIImage imageNamed:@"test_1"], [UIImage imageNamed:@"test_2"], [UIImage imageNamed:@"test_3"], [UIImage imageNamed:@"test_1"], [UIImage imageNamed:@"test_2"], [UIImage imageNamed:@"test_3"], [UIImage imageNamed:@"test_3"]];
////    _mainImage = [UIImage imageNamed:@"model"];
//
//    [[NSUserDefaults standardUserDefaults] setObject:_names forKey:@"names"];
//    [[NSUserDefaults standardUserDefaults] setObject:_nicks forKey:@"nicks"];
////    [[NSUserDefaults standardUserDefaults] setObject:_photos forKey:@"photos"];
//    [[NSUserDefaults standardUserDefaults] setObject:_probabilities forKey:@"probabilities"];
//    if (_isShowing) {
//        [SVProgressHUD animateWithDuration:3.0 animations:nil completion:^(BOOL finished) {
//            ViewController* vc = [ViewController new];
//            vc.names = [[NSUserDefaults standardUserDefaults] objectForKey:@"names"];
//            vc.nicks = [[NSUserDefaults standardUserDefaults] objectForKey:@"nicks"];
//            vc.probabilities = [[NSUserDefaults standardUserDefaults] objectForKey:@"probabilities"];
//            vc.photos = _photos;
//            vc.mainImage = [UIImage imageNamed:@"model"];
//            [self presentViewController:vc animated:YES completion:nil];
//        }];
//    }}
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
