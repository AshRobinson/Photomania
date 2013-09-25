//
//  PhotosByPhotographerMapViewController.m
//  Photomania
//
//  Created by Ashley Robinson on 22/09/2013.
//  Copyright (c) 2013 Ashley Robinson. All rights reserved.
//

#import "PhotosByPhotographerMapViewController.h"
#import "Photo+MKAnnotation.h"
#import "PhotoViewController.h"

@implementation PhotosByPhotographerMapViewController

- (void)setPhotographer:(Photographer *)photographer
{
    _photographer = photographer;
    self.title = photographer.name;
    if (self.view.window) [self reload];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reload];
}

- (void)reload
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"whoTook = %@", self.photographer];
    NSArray *photos = [self.photographer.managedObjectContext executeFetchRequest:request error:NULL];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:photos];
    Photo *photo = [photos lastObject];
    if (photos) self.mapView.centerCoordinate = photo.coordinate;
}


- (void)mapView:(MKMapView *)mapView
 annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"setPhoto:" sender:view];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if([segue.identifier isEqualToString:@"setPhoto:"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]){
            MKAnnotationView *view = (MKAnnotationView *)sender;
            if ([view.annotation isKindOfClass:[Photo class]]) {
                Photo *photo = (Photo *)view.annotation;
                if ([segue.destinationViewController respondsToSelector:@selector(setPhoto:)]){
                    [segue.destinationViewController performSelector:@selector(setPhoto:) withObject:photo];
                }
            }
        }
    }
}



@end
