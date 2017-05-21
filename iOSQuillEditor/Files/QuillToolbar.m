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
    
    self.backgroundColor = [UIColor blueColor];
    
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
    toolbarButtonFrame.origin.x = toolbarButtonFrame.origin.y = 0;
    toolbarButtonFrame.size.width /= toolbarItems.count;
    
    
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
    NSLog(@"I am clicked");
    if(_editorViewController){
        if(button.textAlignment){
            [self.editorViewController setTextAlignment:button.format];
        }else if(button.textFormatting){
            [self.editorViewController setTextFormat:button.format andApply:YES];
        }else if(button.lineAlignment){
            [self.editorViewController setLineAlignment:button.format];
        }else if(button.lineFormatting){
            [self.editorViewController setLineFormat:button.format];
        }
    }
}

-(void)onSelectedTextinRange:(NSRange)range havingAttributes:(NSArray *)attributes{
}

@end
