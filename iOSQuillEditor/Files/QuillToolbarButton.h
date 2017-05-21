//
//  QuillToolbarButton.h
//  iOSQuillEditor
//
//  Created by Shubham Aggarwal on 21/05/17.
//  Copyright © 2015 Sort. All rights reserved.
//

#import <UIKit/UIKit.h>

/* Line Alignments */
static NSString *kQuillNoteLineAlignmentRight = @"right";
static NSString *kQuillNoteLineAlignmentLeft = @"left";
static NSString *kQuillNoteLineAlignmentCenter = @"center";

/* Text Formats */
static NSString *kQuillNoteTextFormatBold = @"bold";
static NSString *kQuillNoteTextFormatItalic = @"italic";
static NSString *kQuillNoteTextFormatUnderline = @"underline";
static NSString *kQuillNoteTextFormatStrike = @"strike";

/* Line Formats */
static NSString *kQuillNoteLineFormatNone = @"none";
static NSString *kQuillNoteLineFormatBullet = @"bullet";
static NSString *kQuillNoteLineFormatList = @"list";


@interface QuillToolbarButton : UIButton

@property (nonatomic, readonly) NSString *format;
@property (nonatomic, assign) BOOL lineAlignment;
@property (nonatomic, assign) BOOL textAlignment;
@property (nonatomic, assign) BOOL textFormatting;
@property (nonatomic, assign) BOOL lineFormatting;

-(id)initWithFrame:(CGRect)frame andFormat:(NSString *)format;

@end
