//
//  Person.h
//  dbList
//
//  Created by etudiant on 09/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@interface Person : NSObject
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* lastname;
@property(nonatomic, strong) City* city;

@end
