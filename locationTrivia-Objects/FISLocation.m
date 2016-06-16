//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Bettina on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)init{

    self = [self initWithName:@""
                     latitude:0
                    longitude:0 ];
    return self;
}



-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    self = [super init];
    
    if(self){
        _name = name;
        _latitude = latitude;
        _longitude =longitude;
        _trivia =[[NSMutableArray alloc]init];
    }
    return self;
}



-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    
    if (self.name.length > length){
        _name = [self.name substringToIndex:length]; //substringToIndex: returns a new string containing the characters of the receiver up to, but not including, the one at anIndex. If anIndex is equal to the length of the string, returns a copy of the receiver. An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.

    }
    
    return _name;
}



-(BOOL)hasValidData {
    
    if( [_name isEqualToString:@""] || _name == nil){
        return NO;
        
    }else if(_latitude < -90.0 ||  _latitude > 90.0){
        return NO;
        
    }else if(self.longitude > 180.0 || self.longitude <= -180.0){
        return NO;
    
    }else {
        //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n name is %@, latitude is %f, and longitude is %f", _name, _latitude, self.longitude);
        return YES;
    }
}



-(FISTrivium *)triviumWithMostLikes {
    if(_trivia.count == 0){
        return nil;
    }
    
    NSSortDescriptor *mostLikesSorter =[NSSortDescriptor  sortDescriptorWithKey:@"likes" ascending:NO];//descending order so mostLikes will be first in array, at index 0 and easiest to locate since count of array is unknown. COuld also have used a for-in loop and if statement instead of sortDescriptor.
    NSArray *sortedTrivia = [_trivia sortedArrayUsingDescriptors:@[mostLikesSorter]];
    
    //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n this is the trivia array sorted: %@ and most likes is %@!",sortedTrivia, sortedTrivia[0]);
    return sortedTrivia[0];
    
}


@end
