//
//  ViewController.m
//  ScrollViewBreakout
//
//  Created by David Mills on 2019-01-21.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "ProgramaticScrollingViewController.h"

@interface ProgramaticScrollingViewController () <UIScrollViewDelegate>

@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ProgramaticScrollingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  CGRect scrollViewFrame = self.scrollView.bounds;

  UIView *red = [[UIView alloc] initWithFrame:scrollViewFrame];
  red.backgroundColor = [UIColor redColor];

  [self.scrollView addSubview:red];

  UIView *blue = [[UIView alloc] initWithFrame:CGRectOffset(scrollViewFrame, scrollViewFrame.size.width * 1, 0)];
  blue.backgroundColor = [UIColor blueColor];

  [self.scrollView addSubview:blue];

  UIView *green = [[UIView alloc] initWithFrame:CGRectOffset(scrollViewFrame, scrollViewFrame.size.width * 2, 0)];
  green.backgroundColor = [UIColor greenColor];

  [self.scrollView addSubview:green];

  UIView *yellow = [[UIView alloc] initWithFrame:CGRectOffset(scrollViewFrame, scrollViewFrame.size.width * 3, 0)];
  yellow.backgroundColor = [UIColor yellowColor];

  [self.scrollView addSubview:yellow];

  self.scrollView.contentSize = CGSizeMake(scrollViewFrame.size.width * 4, scrollViewFrame.size.height);
}

- (IBAction)pageChanged:(id)sender {
  NSUInteger currentPage = self.pageControl.currentPage;
  CGFloat x = currentPage * 320;

  [self.scrollView scrollRectToVisible:CGRectMake(x, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height) animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
  int currentPage = scrollView.contentOffset.x / 320;

  self.pageControl.currentPage = currentPage;
}

@end
