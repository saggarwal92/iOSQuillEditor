//
//  QuillToolbar.h
//  iOSQuillEditor
//
//  Created by shubham on 21/05/17.
//  Copyright © 2017 Sort. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuillToolbarButton.h"

@class QuillNoteEditorViewController;

@interface QuillToolbar : UIView
@property (nonatomic,readonly) NSArray<QuillToolbarButton *> *toolbarButtons;
@property (nonatomic, weak) QuillNoteEditorViewController *editorViewController;

-(void)onSelectedTextInRange:(NSRange)range havingAttributes:(NSArray *)attributes;

@end
