//
//  FISTrivium.h
//  locationTrivia-Objects
//
//  Created by Bettina on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISTrivium : NSObject

@property (strong, nonatomic) NSString *content;
@property (nonatomic) NSUInteger likes;

-(instancetype) init;

-(instancetype)initWithContent:(NSString*)content likes:(NSUInteger)likes;


@end
