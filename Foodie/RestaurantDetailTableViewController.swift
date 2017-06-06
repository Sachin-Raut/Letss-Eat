//
//  RestaurantDetailTableViewController.swift
//  Foodie
//
//  Created by Sachin Raut on 23/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailTableViewController: UITableViewController

{
    
    var selectedRestaurant: RestaurantItem?
    
    let manager = ReviewDataManager()
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblCuisine: UILabel!
    
    @IBOutlet weak var lblHeaderAddress: UILabel!
    
    @IBOutlet weak var lblTableDetails: UILabel!
    
    @IBOutlet weak var imgRating: UIImageView!
    
    @IBOutlet weak var txtReview: UITextView!
    
    @IBOutlet weak var lblUser: UILabel!
    
    @IBOutlet weak var reviewsContainer: UIView!
    
    @IBOutlet weak var noReviewsContainer: UIView!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var btnHeart: UIBarButtonItem!
    
    
    func setupLabels()
    {
        guard let restaurant = selectedRestaurant
        else
        {
            return
        }
        
        if let name = restaurant.name
        {
            lblName.text = name
        }
        
        if let cuisine = restaurant.cuisine
        {
            lblCuisine.text = cuisine
        }
        
        if let address = restaurant.address
        {
            lblAddress.text = address
            lblHeaderAddress.text = address
        }
        
        lblTableDetails.text = "Table for 7, tonight at 10 PM"
        
    }
    
    
    
    func setupMap()
    {
        guard let annotation = selectedRestaurant?.annotation, let long = annotation.longitude, let lat = annotation.latitude
        else
        {
            return
        }
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        let span = MKCoordinateSpanMake(0.5, 0.5)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        mapView.addAnnotations([annotation])
        
    }
    
    
    func checkReviews()
    {
        if let id = selectedRestaurant?.restaurantID
        {
            manager.fetchReview(by: id)
        }
        
        let count = manager.numberOfItems()
        
        if count > 0
        {
            noReviewsContainer.isHidden = true
        }

        let item = manager.getLatestReview()
        
        lblUser.text = item.name
        
        txtReview.text = item.customerReview
        
        if let rating = item.rating
        {
            imgRating.image = UIImage(named: Rating.image(rating: rating))
        }
    }
    
    
    func initialize()
    {
        setupLabels()
        setupMap()
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        initialize()
        //print(selectedRestaurant as Any)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        checkReviews()
    }
    
    
    func showReview(segue: UIStoryboardSegue)
    {
        if let viewController = segue.destination as? CreateReviewViewController
        {
            viewController.selectedRestaurantID = selectedRestaurant?.restaurantID
        }
    }
    
    func showAllReviews(segue: UIStoryboardSegue)
    {
        if let viewController = segue.destination as? ReviewListViewController
        {
            viewController.selectedRestaurantID = selectedRestaurant?.restaurantID
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let identifier = segue.identifier
        {
            switch identifier
            {
            case Segue.showReview.rawValue:
                showReview(segue: segue)
            case Segue.showAllReviews.rawValue:
                showAllReviews(segue: segue)
            default:
                print("Segue not added")
            }
        }
    }    

}
