//
//  MultiDirectionOrganizedScroll.h
//  NewSchedule
//
//  Created by IvanLyuhtikov on 13.08.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MultiDirectionOrganizedScroll : UIScrollView

@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithCountOfPages:(NSInteger)count andFrame:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
