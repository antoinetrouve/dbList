//
//  DetailViewController.h
//  dbList
//
//  Created by etudiant on 25/01/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "City.h"

@interface DetailViewController : ViewController
@property (weak, nonatomic) IBOutlet UILabel *Outletname;
@property (weak, nonatomic) IBOutlet UILabel *Outletpostalcode;
@property (weak, nonatomic) IBOutlet UILabel *Outletnbhab;
@property (strong, nonatomic) NSManagedObject* managedobject;


@end
