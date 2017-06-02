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
        _active = false;
    }
    return self;
}

-(void)setMobileIcon:(NSString *)icon{
    //Set FontAwesome Icon
    [self setTitle:[NSString fontAwesomeIconStringForIconIdentifier:icon] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithRed:0.54 green:0.55 blue:0.56 alpha:1.0] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontAwesomeFontOfSize:18];
}

-(void)setActive:(BOOL)active{
    _active = active;
    
    if(_active){
        [self setTitleColor:[UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0] forState:UIControlStateNormal];
    }else{
        [self setTitleColor:[UIColor colorWithRed:0.54 green:0.55 blue:0.56 alpha:1.0] forState:UIControlStateNormal];
    }
}

@end


