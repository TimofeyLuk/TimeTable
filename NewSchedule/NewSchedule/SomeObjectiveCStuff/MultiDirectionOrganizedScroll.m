//
//  MultiDirectionOrganizedScroll.m
//  NewSchedule
//
//  Created by IvanLyuhtikov on 13.08.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

#import "MultiDirectionOrganizedScroll.h"
#import "NewSchedule-Swift.h"


@interface MultiDirectionOrganizedScroll ()

@property (nonatomic) NSInteger countOfPages;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray<UIScrollView *> *arrOfChildrenScrollViews;

@end


@implementation MultiDirectionOrganizedScroll


- (instancetype)initWithCountOfPages:(NSInteger)count andFrame:(CGRect)rect {
    self = [super initWithFrame:rect];
    
    if (self) {
//        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.countOfPages = count;
    }
    return self;
}


#pragma mark - Setters and Getters


- (void)setCountOfPages:(NSInteger)countOfPages {
    if (!_countOfPages) {
        
        self.contentSize = CGSizeMake(([SizeEntityObjC screenWidth] * countOfPages), [SizeEntityObjC screenHeight]/1.3);
        
        
        for (long i = 0; i < countOfPages; i++) {
            UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(SizeEntityObjC.screenWidth * i,
                                                                                  0,
                                                                                  SizeEntityObjC.screenWidth,
                                                                                  [SizeEntityObjC screenHeight]/1.3)];
            

            
            scroll.backgroundColor = [UIColor colorWithDisplayP3Red:0.3 green:0.1 * i blue:0.9 alpha:1];
            scroll.contentSize = CGSizeMake([SizeEntityObjC screenWidth], [SizeEntityObjC screenHeight]);
            
            [self addSubview:scroll];
            
            
//            [scroll.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
            
            [self.arrOfChildrenScrollViews addObject:scroll];
        }
        
    }
}

- (void)setColor:(UIColor *)color {
    if (_color != color) {
        _color = color;
        [self setNeedsDisplay];
    }
}



@end
