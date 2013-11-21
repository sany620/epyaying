//
//  MapViewController.h
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-18.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "CalloutMapAnnotation.h"
#import "BasicMapAnnotation.h"

@protocol MapViewControllerDidSelectDelegate;
@interface MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    MKMapView *_mapView;
    
    
    id<MapViewControllerDidSelectDelegate> delegate;
}
@property(nonatomic,retain)IBOutlet MKMapView *mapView;

@property(nonatomic,assign)id<MapViewControllerDidSelectDelegate> delegate;

- (void)resetAnnitations:(NSArray *)data;
@end

@protocol MapViewControllerDidSelectDelegate <NSObject>

@optional
- (void)customMKMapViewDidSelectedWithInfo:(id)info;

@end
