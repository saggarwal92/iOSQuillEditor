//
//  QuillToolbarButton.m
//  iOSQuillEditor
//
//  Created by Shubham Aggarwal on 21/05/17.
//  Copyright © 2015 Sort. All rights reserved.
//

#import "QuillToolbarButton.h"
#import "NSString+FontAwesome.h"
#import "UIFont+FontAwesome.h"


@implementation QuillToolbarButton

-(id)initWithFrame:(CGRect)frame andFormat:(NSString *)format{
    self = [super initWithFrame:frame];
    if(self){
        _format = format;
        _lineAlignment = NO;
        _textAlignment = NO;
        _textFormatting = NO;
        _lineFormatting = NO;
    }
    return self;
}

-(void)setMobileIcon:(NSString *)icon{
    //Set FontAwesome Icon
    [self setTitle:[NSString fontAwesomeIconStringForIconIdentifier:icon] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    self.titleLabel.font = [UIFont fontAwesomeFontOfSize:18];
}

@end


