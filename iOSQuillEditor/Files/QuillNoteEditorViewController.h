//
//  QuillNoteEditorViewController.h
//  iOSQuillEditor
//
//  Created by Shubham Aggarwal on 21/05/17.
//  Copyright © 2015 Sort. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol QuillNoteEditorDelegate <NSObject>
-(void)onSelectedTextInRange:(NSRange)range havingAttributes:(NSArray *)attributes;
-(void)onWebViewLoaded;
@end



@interface QuillNoteEditorViewController : UIViewController

@property (nonatomic,weak) id<QuillNoteEditorDelegate> delegate;

//Variable to check whether the content is loaded or not
@property (nonatomic,readonly) BOOL isContentLoaded;

//Focuses the editor opening keyboard when it is loaded completed
@property (nonatomic,assign) BOOL focusEditorWhenLoaded;

-(void)setLineAlignment:(NSString *)alignment;
-(void)setTextAlignment:(NSString *)alignment;
-(void)setTextFormat:(NSString *)format andApply:(BOOL)apply;
-(void)setLineFormat:(NSString *)format;

-(void)focusEditor;

-(void)setHTML:(NSString *)html;
-(NSString *)getHTML;

@end
