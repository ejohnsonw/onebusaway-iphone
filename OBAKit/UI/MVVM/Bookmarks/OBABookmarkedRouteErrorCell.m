//
//  OBABookmarkedRouteErrorCell.m
//  OBAKit
//
//  Created by Aaron Brethorst on 2/3/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

#import <OBAKit/OBABookmarkedRouteErrorCell.h>
#import <OBAKit/OBATableRow.h>
#import <OBAKit/OBABookmarkedRouteRow.h>
#import <OBAKit/OBAMacros.h>

@interface OBABookmarkedRouteErrorCell ()
@property(nonatomic,copy,readonly) OBABookmarkedRouteRow *tableDataRow;
@end

@implementation OBABookmarkedRouteErrorCell
@synthesize tableRow = _tableRow;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        // abxoxo todo
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];

    // todo
}

- (void)setTableRow:(OBATableRow *)tableRow {
    OBAGuardClass(tableRow, OBABookmarkedRouteRow) else {
        return;
    }
    _tableRow = [tableRow copy];

    // abxoxo todo
}

- (OBABookmarkedRouteRow*)tableDataRow {
    return (OBABookmarkedRouteRow*)self.tableRow;
}

@end
