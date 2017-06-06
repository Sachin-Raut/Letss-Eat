//
//  RestaurantListViewController.swift
//  Foodie
//
//  Created by Sachin Raut on 21/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDataSource
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var selectedRestaurant: RestaurantItem?
    var selectedCity: String?
    var selectedType: String?
    
    let manager = RestaurantDataManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        
        guard let location = selectedCity, let type = selectedType
        else
        {
            return
        }
        
        manager.fetch(by: location, withFilter: type, completionHandler: { collectionView.reloadData() })
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return manager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantListCell", for: indexPath) as! RestaurantCell
        
        let item = manager.restaurantItem(at: indexPath)
        
        if let name = item.name
        {
            cell.lblTitle.text = name
        }
        
        if let city = item.city
        {
            cell.lblCity.text = city
        }
        
        if let cuisine = item.cuisine
        {
            cell.lblCuisine.text = cuisine
        }
        
        return cell
    }
    
    
    func showRestaurantDetail(segue: UIStoryboardSegue)
    {
        if let viewController = segue.destination as? RestaurantDetailTableViewController, let index = collectionView.indexPathsForSelectedItems?.first
        {
            selectedRestaurant = manager.restaurantItem(at: index)
            viewController.selectedRestaurant = selectedRestaurant
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let identifier = segue.identifier
        {
            switch identifier
            {
            case Segue.showDetail.rawValue:
                showRestaurantDetail(segue: segue)
            default:
                print("Segue not added")
            }
        }
    }
    
    
}
