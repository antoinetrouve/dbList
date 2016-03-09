//
//  CityDAO.m
//  dbList
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import "CityDAO.h"
#import "appDelegate.h"
#import "Person.h"

@implementation CityDAO
-(NSManagedObject*)insert:(City *)city
{
    //DB instance
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //GET TABLE
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:context];
    
    //INSERT IN TABLE
    [managedObject setValue:city.name forKey:@"name"];
    [managedObject setValue:city.postalCode forKey:@"postalCode"];
    [managedObject setValue:[NSNumber numberWithInt:city.nbHab] forKey:@"nbHab"];
    
    [appDelegate saveContext];
    
    return managedObject;
}

-(NSArray*)getAll
{
    NSArray* cities = [NSArray new];
    
    //DB instance
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //REQUEST GET DB
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    
    //GET TABLE FOR REQUEST
    fetchRequest.entity = [NSEntityDescription entityForName:@"City" inManagedObjectContext:context];
    
    //GET ALL CITY DB OBJECT
    cities = [context executeFetchRequest:fetchRequest error:nil];
    return cities;
}

-(NSManagedObject*)getById:(NSManagedObject *) city
{
    
    //DB instance
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    NSManagedObject *managedObject = [context objectWithID:city.objectID];
    
    return managedObject;
}

-(City*)getCity:(NSManagedObject *) managedObject
{
    City* city = [City new];
    
    //DB instance
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    NSManagedObject *managedObjectCity = [context objectWithID:managedObject.objectID];
    
    //TODO
    city.name = [managedObjectCity valueForKey:@"name"];
    
    NSMutableArray *persons = [NSMutableArray new];
    NSSet* managedObjectPersons = [managedObjectCity valueForKey:@"persons"];
    for (NSManagedObject* managedObjectPerson in managedObjectPersons) {
        Person* person = [Person new];
        
        //TODO
        person.name = [managedObjectPerson valueForKey:@"name"];
        
        [persons addObject:person];
    }
    
    city.persons = persons;
    
    return city;
}

-(void)update:(NSManagedObject *) managedObject withCity:(City *) city
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    //UPDATE IN TABLE
    [managedObject setValue:city.name forKey:@"name"];
    [managedObject setValue:city.postalCode forKey:@"postalCode"];
    [managedObject setValue:[NSNumber numberWithInt:city.nbHab] forKey:@"nbHab"];
    
    [appDelegate saveContext];
    
}
-(void)remove:(NSManagedObject *) managedObject
{
    //DB instance
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Lors d'un delete la sauvegarde du context se fait de manière automatique
    [context deleteObject:managedObject];
}
@end
