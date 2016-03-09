//
//  DetailViewController.m
//  dbList
//
//  Created by etudiant on 25/01/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "City.h"
#import "CityDAO.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize managedobject;
- (void)viewDidLoad {
    [super viewDidLoad];
    CityDAO *adapter = [CityDAO new];
    NSManagedObject* city = [adapter getById:self.managedobject];
    
    self.Outletname.text = [city valueForKey:@"name"];
    self.Outletpostalcode.text = [city valueForKey:@"postalCode"];
    //self.Outletpostalcode.text = [city valueForKey:@"test"];
    self.Outletnbhab.text = [[city valueForKey:@"nbHab"]stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
