//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


-(NSArray *)allLocationNames{
    NSMutableArray *allLocations =[[NSMutableArray alloc]init];
    NSLog(@"%@", self.locations);
    for(FISLocation *location in self.locations){ // how is locations array being populated with the FISLocation objects information? Is it conceivable that the locations property array of AppDelegate could be populated with any object type?
        
        [allLocations addObject:location.name];
    }
    
    return allLocations;
}


-(FISLocation *)locationNamed:(NSString *)name{
    
    for(FISLocation *location in self.locations){
        if([location.name isEqualToString:name]){ //cannot use == on strings or objects that use pointers because in then it's comparing their pointer addresses versus the actual object value. must use isEqualToString since location.name property is a string and comparing to name argument which is a string.
            return location;
        }
        // why did else{return nil;} not work? compiler can only see "one level in".
    }
        return nil;
}


-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin{

    NSMutableArray *locationsNearby =[[NSMutableArray alloc]init];
    
    for(FISLocation *location in self.locations){
        
        CGFloat marginRangeLatitude = location.latitude - latitude; //location.latitude could be less than or greater than the value of latitude argument so difference may be positive or negative. Use fabs to make this difference positive no matter what to compare to margin argument.
        
        CGFloat marginRangeLongitude = location.longitude-longitude;

        if(fabs(marginRangeLatitude) <= margin && fabs(marginRangeLongitude) <= margin){ //how do i get difference to equal positve margin value? must use fabs to get absolute value to compare the difference to margin.
            
            [locationsNearby addObject:location];
            
            NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n is this returning %@ for %f and %f",location,latitude,longitude);
        }
    }

//    

    
//    - (NSArray *)locationsNearLatitude:(CGFloat)latitude
//longitude:(CGFloat)longitude
//margin:(CGFloat)margin {
//    
//    CGFloat maxLat = latitude + margin;
//    CGFloat minLat = latitude - margin;
//    CGFloat maxLng = longitude + margin;
//    CGFloat minLng = longitude - margin;
//    
//    NSMutableArray *locationsInRange = [[NSMutableArray alloc] init];
//    for (FISLocation *location in self.locations) {
//        BOOL latInRange = location.latitude <= maxLat && location.latitude >= minLat;
//        BOOL lngInRange = location.longitude <= maxLng && location.longitude >= minLng;
//        if (latInRange && lngInRange) {
//            [locationsInRange addObject:location];
//        }
//    }
//    return locationsInRange;
    
    return locationsNearby;


}

@end
