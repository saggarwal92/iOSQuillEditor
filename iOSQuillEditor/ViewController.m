//
//  ViewController.m
//  iOSQuillEditor
//
//  Created by shubham on 21/05/17.
//  Copyright © 2017 Sort. All rights reserved.
//

#import "ViewController.h"
#import "QuillNoteEditorViewController.h"
#import "QuillToolbar.h"
#import "NSString+FontAwesome.h"

@interface ViewController ()
@property (nonatomic, retain) QuillNoteEditorViewController *noteEditorController;
@property (nonatomic, retain) QuillToolbar *quillToolbar;
@property (nonatomic, retain) UIView *containerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60)];
    [self.view addSubview:self.containerView];
    
    
    /* Adding Quill Note Editor */
    _noteEditorController = [[QuillNoteEditorViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:_noteEditorController];
    [self.containerView addSubview:_noteEditorController.view];
    _noteEditorController.view.frame = self.containerView.bounds;
    [_noteEditorController didMoveToParentViewController:self];
    
    //Set Delegate To Self:
    _noteEditorController.delegate = self;
    
    /*Attaching Quill Toolbar */
    _quillToolbar = [[QuillToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    [self.view addSubview:_quillToolbar];
    //Set EditorViewController to QuillToolbar;
    _quillToolbar.editorViewController = _noteEditorController;
}

-(void)onSelectedTextInRange:(NSRange)range havingAttributes:(NSArray *)attributes{
    [_quillToolbar onSelectedTextInRange:range havingAttributes:attributes];
}

-(void)onWebViewLoaded{
    NSLog(@"onWebViewLoaded");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
