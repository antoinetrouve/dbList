//
//  CityDAO.h
//  dbList
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@interface CityDAO : NSObject

-(NSManagedObject*)insert:(City *)c;
-(NSArray*)getAll;
-(NSManagedObject*)getById:(NSManagedObject *) city;
-(City*)getCity:(NSManagedObject *) managedObject;
-(void)update:(NSManagedObject *) managedObject withCity:(City *) city;
-(void)remove:(NSManagedObject *) city;
@end


//private void updatewithCity(NSManagedObject managedObject, City city)
