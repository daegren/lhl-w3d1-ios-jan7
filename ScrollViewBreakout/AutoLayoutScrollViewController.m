//
//  AutoLayoutScrollViewController.m
//  ScrollViewBreakout
//
//  Created by David Mills on 2019-01-21.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "AutoLayoutScrollViewController.h"

@interface AutoLayoutScrollViewController ()

@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation AutoLayoutScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


  UIView *red = [[UIView alloc] initWithFrame:CGRectZero];
  red.translatesAutoresizingMaskIntoConstraints = NO;
  red.backgroundColor = [UIColor redColor];

  [self.scrollView addSubview:red];

  UIView *blue = [[UIView alloc] initWithFrame:CGRectZero];
  blue.translatesAutoresizingMaskIntoConstraints = NO;
  blue.backgroundColor = [UIColor blueColor];

  [self.scrollView addSubview:blue];

  UIView *green = [[UIView alloc] initWithFrame:CGRectZero];
  green.translatesAutoresizingMaskIntoConstraints = NO;
  green.backgroundColor = [UIColor greenColor];

  [self.scrollView addSubview:green];

  UIView *yellow = [[UIView alloc] initWithFrame:CGRectZero];
  yellow.translatesAutoresizingMaskIntoConstraints = NO;
  yellow.backgroundColor = [UIColor yellowColor];

  [self.scrollView addSubview:yellow];

  // Constraints

  [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[red][blue(==red)][green(==red)][yellow(==red)]|" options:(NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom) metrics:nil views:NSDictionaryOfVariableBindings(red, blue, green, yellow)]
   ];

  [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[red]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(red)]];

  [NSLayoutConstraint constraintWithItem:red attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0].active = YES;

  [NSLayoutConstraint constraintWithItem:red attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0].active = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
