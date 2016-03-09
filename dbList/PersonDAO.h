//
//  PersonDAO.h
//  dbList
//
//  Created by etudiant on 09/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonDAO : NSObject
//-(void)insert:(Person *)person;
-(NSManagedObject*)insert:(Person *)person withCity:(City *)city;
-(NSArray*)getAll;
-(NSManagedObject*)getById:(NSManagedObject *) city;
-(void)update:(NSManagedObject *) managedObject withCity:(City *) city;
-(void)remove:(NSManagedObject *) city;
@end
