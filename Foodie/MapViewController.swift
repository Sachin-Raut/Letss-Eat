//
//  MapViewController.swift
//  Foodie
//
//  Created by Sachin Raut on 22/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
 
    var selectedRestaurant: RestaurantItem?
    
    let manager = MapDataManager()
    
    @IBOutlet weak var lblLocation: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initialize()
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        if location == ""
        {
            lblLocation.text = "Chicago"
        }
        else
        {
            lblLocation.text = location
        }
        initialize()
    }
    
    
    func addMap(_ annotations:[RestaurantAnnotation])
    {
        mapView.setRegion(manager.currentRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        
        mapView.addAnnotations(manager.annotations)
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        
        guard let annotation = mapView.selectedAnnotations.first
        else
        {
            return
        }
        
        let data = annotation as! RestaurantAnnotation
        
        selectedRestaurant = data.restaurantItem
        
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        switch segue.identifier!
        {
        case Segue.showDetail.rawValue:
            showRestaurantDetail(segue: segue)
        default:
            print("Segue not added")
        }
    }
    
    
    func showRestaurantDetail(segue: UIStoryboardSegue)
    {
        if let vc = segue.destination as? RestaurantDetailTableViewController, let restaurant = selectedRestaurant
        {
            vc.selectedRestaurant = restaurant
        }
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView?
    {
        let identifier = "custonpin"
        
        guard !annotation.isKind(of: MKUserLocation.self)
            
        else
        {
            return nil
        }
        
        var annotationView: MKAnnotationView?
        
        if let customAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        {
            annotationView = customAnnotationView
            
            annotationView?.annotation = annotation
        }
        else
        {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            annotationView = av
        }
        
        if let annotationView = annotationView
        {
            annotationView.canShowCallout = true
            
            annotationView.image = UIImage(named: "custom-annotation")
        }
        
        return annotationView
        
    }
    
    func initialize()
    {
        mapView.delegate = self
        
        manager.fetch { (annotations) in
            addMap(annotations)
        }
    }
}
