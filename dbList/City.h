//
//  City.h
//  dbList
//
//  Created by etudiant on 25/01/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface City : NSObject
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* postalCode;
@property (nonatomic) int nbHab;
@property (strong, nonatomic) NSArray* persons;
@end
