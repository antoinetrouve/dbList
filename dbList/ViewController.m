//
//  ViewController.m
//  dbList
//
//  Created by etudiant on 25/01/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "AppDelegate.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Associer le fichier localizable string avec la variable associée (ici add)
    //[self.BTadd setTitle:NSLocalizedString(@"add", nil) forState:UIControlStateNormal];
    
    UIView* view = self.view;
    AVPlayerViewController* playerController = [AVPlayerViewController new];
    
    //Get URL
    NSURL* url = [NSURL URLWithString:@"https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"];
    AVPlayer* player= [AVPlayer playerWithURL:url];
    
    playerController.player = player;
    
    [self addChildViewController:playerController];
    [view addSubview:playerController.view];
    
    playerController.view.frame = view.frame;
    
    [player play];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BTOnClick:(id)sender {
    //creation d'une ville
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // recuperation du nom du segue
    if ([[segue identifier] isEqualToString:@"CitySegue"]) {
        // if OK
        
        //create city
        City *newcity = [City new];
        newcity.name = self.TFname.text;
        newcity.postalCode = self.TFpostalcode.text;
        newcity.nbHab = [self.TFnbhab.text intValue];
        
        //recuperation du context créé dans l'appDelegate
        AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = appdelegate.managedObjectContext;
        
        //Appel de la table
        NSManagedObject *city = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:context];
        
        //Insertion des champs
        [city setValue:newcity.name forKey:@"name"];
        [city setValue:newcity.postalCode forKey:@"postalCode"];
        [city setValue:[NSNumber numberWithInt:newcity.nbHab] forKey:@"nbHab"];
        
        [appdelegate saveContext];
    }
}

@end
