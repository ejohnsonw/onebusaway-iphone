/**
 * Copyright (C) 2009 bdferris <bdferris@onebusaway.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <OBAKit/OBAPlacemark.h>
#import <OBAKit/NSCoder+OBAAdditions.h>

@implementation OBAPlacemark

- (instancetype)initWithAddress:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];

    if (self) {
        _address = address;
        _coordinate = coordinate;
    }
    return self;
}

#pragma mark NSCoder Methods

- (id)initWithCoder:(NSCoder*)coder {
    self = [super init];
    if (self) {
        _name = [coder oba_decodeObject:@selector(name)];
        _address = [coder oba_decodeObject:@selector(address)];
        _icon = [coder oba_decodeObject:@selector(icon)];

        NSData * data = [coder oba_decodeObject:@selector(coordinate)];
        [data getBytes:&_coordinate length:sizeof(CLLocationCoordinate2D)];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder {
    [coder oba_encodeObject:_name forSelector:@selector(name)];
    [coder oba_encodeObject:_address forSelector:@selector(address)];
    [coder oba_encodeObject:_icon forSelector:@selector(icon)];

    NSData * data = [NSData dataWithBytes:&_coordinate length:sizeof(CLLocationCoordinate2D)];
    [coder oba_encodeObject:data forSelector:@selector(coordinate)];
}

- (CLLocation*) location {
    return [[CLLocation alloc] initWithLatitude:_coordinate.latitude longitude:_coordinate.longitude];
}

#pragma mark MKAnnotation

- (NSString*)title {
    return self.name ?: self.address;
}

@end
