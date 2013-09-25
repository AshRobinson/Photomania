//
//  MapViewController.m
//  Photomania
//
//  Created by Ashley Robinson on 22/09/2013.
//  Copyright (c) 2013 Ashley Robinson. All rights reserved.
//

#import "MapViewController.h"
#import "Photo+MKAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *reuseId = @"MapViewController";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (!view) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                               reuseIdentifier:reuseId];
        view.canShowCallout = YES;
        if ([mapView.delegate respondsToSelector:@selector(mapView:annotationView:calloutAccessoryControlTapped:)]) {
            view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        view.leftCalloutAccessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    }
    
    if ([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)(view.leftCalloutAccessoryView);
        imageView.image = nil;
    }
    
    return view;
}



- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    SEL thumbnailMethod = sel_registerName("thumbnail");
    
    if ([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)(view.leftCalloutAccessoryView);
        if ([view.annotation respondsToSelector:thumbnailMethod])
            imageView.image = [view.annotation performSelector:@selector(thumbnail)];
    }
}

@end
