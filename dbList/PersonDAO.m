//
//  PersonDAO.m
//  dbList
//
//  Created by etudiant on 09/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import "PersonDAO.h"
#import "City.h"
#import "CityDAO.h"
#import "AppDelegate.h"

@implementation PersonDAO
-(NSManagedObject*)insert:(Person *)person withCity:(City *)city{
    //DB INSTANCE
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //INSERT CITY IN TABLE
    CityDAO* cityDao = [CityDAO new];
    NSManagedObject* managedObjectCity=[cityDao insert:city];
    
    //GET TABLE
    NSManagedObject* managedObjectPerson = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    
    //INSERT IN TABLE
    [managedObjectPerson setValue:person.name forKey:@"name"];
    [managedObjectPerson setValue:person.lastname forKey:@"lastname"];
    [managedObjectPerson setValue:managedObjectCity forKey:@"city"];
    [appDelegate saveContext];
    
    return managedObjectPerson;
}

-(NSArray*)getAll{
    return nil;
}
-(NSManagedObject*)getById:(NSManagedObject *) city{
    return nil;
}
-(void)update:(NSManagedObject *) managedObject withCity:(City *) city{
    ;
}
-(void)remove:(NSManagedObject *) city{
    ;
}
@end
