//
//  ViewController.m
//  UPCardsCarouselDemo
//
//  Created by Paul Ulric on 11/12/2014.
//  Copyright (c) 2014 Paul Ulric. All rights reserved.
//

#import "ViewController.h"


const static int kCardsCount = 20;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UPCardsCarousel *carousel = [[UPCardsCarousel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [carousel setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [carousel.labelView setBackgroundColor:[UIColor colorWithRed:112./255. green:47./255. blue:168./255. alpha:1.]];
    [carousel setLabelFont:[UIFont boldSystemFontOfSize:17.0f]];
    [carousel setLabelTextColor:[UIColor whiteColor]];
    [carousel setDelegate:self];
    [carousel setDataSource:self];
    [self.view addSubview:carousel];
    
    CGRect frame = carousel.labelView.frame;
    frame.size.height += 40;
    frame.origin.y -= 40;
    [carousel.labelView setFrame:frame];
}



#pragma mark - CardsCarouselDataSource Methods
- (NSUInteger)numberOfCardsInCarousel:(UPCardsCarousel *)carousel
{
    return kCardsCount;
}

- (UIView*)carousel:(UPCardsCarousel *)carousel viewForCardAtIndex:(NSUInteger)index
{
    NSString *label = [NSString stringWithFormat:@"%i", (int)index];
    return [self createCardViewWithLabel:label];
}

- (NSString*)carousel:(UPCardsCarousel *)carousel titleForCardAtIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"Card %i", (int)index];
}


#pragma mark - CardsCarouselDelegate Methods

- (void)carousel:(UPCardsCarousel *)carousel didTouchCardAtIndex:(NSUInteger)index
{
    NSString *message = [NSString stringWithFormat:@"Card %i touched", (int)index];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}


#pragma mark - Helpers

- (UIView*)createCardViewWithLabel:(NSString*)label
{
    UIView *cardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 240)];
    [cardView setBackgroundColor:[UIColor colorWithRed:180./255. green:180./255. blue:180./255. alpha:1.]];
    [cardView.layer setShadowColor:[UIColor blackColor].CGColor];
    [cardView.layer setShadowOpacity:.5];
    [cardView.layer setShadowOffset:CGSizeMake(0, 0)];
    [cardView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cardView.layer setBorderWidth:10.];
    [cardView.layer setCornerRadius:4.];
    
    UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectInset(cardView.frame, 20, 20)];
    [labelView setCenter:CGPointMake(cardView.frame.size.width/2, cardView.frame.size.height/2)];
    [labelView setFont:[UIFont boldSystemFontOfSize:100]];
    [labelView setTextAlignment:NSTextAlignmentCenter];
    [labelView setTextColor:[UIColor grayColor]];
    [labelView setText:label];
    [cardView addSubview:labelView];
    
    return cardView;
}



@end