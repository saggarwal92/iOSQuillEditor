//
//  QuillToolbar.m
//  iOSQuillEditor
//
//  Created by shubham on 21/05/17.
//  Copyright © 2017 Sort. All rights reserved.
//

#import "QuillToolbar.h"
#import "QuillNoteEditorViewController.h"
#import "NSString+FontAwesome.h"

@interface QuillToolbarButton()
-(void)setMobileIcon:(NSString *)icon;
@end





@interface QuillToolbar()
@end

@implementation QuillToolbar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}


-(void)initialize{
    _toolbarButtons = [self toolbarButtonsListInFrame:self.frame];
    self.backgroundColor = [UIColor colorWithRed:0.86 green:0.87 blue:0.87 alpha:1.0];
}


-(NSArray *)toolbarButtonsListInFrame:(CGRect)frame{
    
    NSArray *toolbarItems = @[
                              /* Text Formats */
                              @{
                                  @"key":@"textFormatting",
                                  @"icon":@"fa-bold",
                                  @"format":kQuillNoteTextFormatBold,
                                },
                              @{
                                  @"key":@"textFormatting",
                                  @"icon":@"fa-italic",
                                  @"format":kQuillNoteTextFormatItalic,
                                  },
                              @{
                                  @"key":@"textFormatting",
                                  @"icon":@"fa-underline",
                                  @"format":kQuillNoteTextFormatUnderline,
                                  },
                              @{
                                  @"key":@"textFormatting",
                                  @"icon":@"fa-strikethrough",
                                  @"format":kQuillNoteTextFormatStrike,
                                  },
                             
                              /* Line Formats */
                              @{
                                  @"key":@"lineFormatting",
                                  @"icon":@"fa-list",
                                  @"format":kQuillNoteLineFormatNone,
                                  },
                              @{
                                  @"key":@"lineFormatting",
                                  @"icon":@"fa-list-ul",
                                  @"format":kQuillNoteLineFormatBullet,
                                  },
                              @{
                                  @"key":@"lineFormatting",
                                  @"icon":@"fa-list-ol",
                                  @"format":kQuillNoteLineFormatList,
                                  },
                              ];
    
    
    //Default ToolbarButtonFrame
    CGRect toolbarButtonFrame = frame;
    toolbarButtonFrame.origin.x = 0;
    toolbarButtonFrame.origin.y = 10;
    toolbarButtonFrame.size.height -= toolbarButtonFrame.origin.y;
    toolbarButtonFrame.size.width /= toolbarItems.count;
    
    
    /*Creating Toolbar Buttons*/
    NSMutableArray *toolbarButtons = [NSMutableArray array];
    for(NSDictionary *toolbarItem in toolbarItems){
        QuillToolbarButton *toolbarButton = [[QuillToolbarButton alloc] initWithFrame:toolbarButtonFrame andFormat:toolbarItem[@"format"]];
        [toolbarButton setMobileIcon:toolbarItem[@"icon"]];
        [toolbarButton setValue:@1 forKey:toolbarItem[@"key"]];
        [toolbarButton addTarget:self action:@selector(onToolbarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:toolbarButton];
        
        [toolbarButtons addObject:toolbarButton];
        toolbarButtonFrame.origin.x += toolbarButtonFrame.size.width;
    }
    
    return toolbarButtons;
}



-(void)onToolbarButtonClicked:(QuillToolbarButton *)button{
    if(_editorViewController){
        if(button.textAlignment){
            [self.editorViewController setTextAlignment:button.format];
        }else if(button.textFormatting){
            button.active = !button.active;
            [self.editorViewController setTextFormat:button.format andApply:button.active];
        }else if(button.lineAlignment){
            [self.editorViewController setLineAlignment:button.format];
        }else if(button.lineFormatting){
            [self.editorViewController setLineFormat:button.format];
        }
    }
}


-(void)onSelectedTextInRange:(NSRange)range havingAttributes:(NSArray *)attributes{
    for(QuillToolbarButton *button in self.toolbarButtons){
        if([attributes containsObject:button.format]){
            button.active = YES;
        }else{
            button.active = NO;
        }
    }
    
}



@end
