//
//  ViewController.swift
//  Foodie
//
//  Created by Sachin Raut on 31/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit

class MapLocationViewController: UIViewController
{
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedCity: String?
    
    let manager = LocationDataManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        manager.fetch()
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }

}

extension MapLocationViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return manager.numberOfItems()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mapLocationCell", for: indexPath)
        
        set(selected: cell, at: indexPath)
        
        cell.textLabel?.text = manager.locationItem(at: indexPath)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            cell.accessoryType = .checkmark
            
            location = manager.locationItem(at: indexPath)
        }
        
        tableView.reloadData()
        
    }
    
    
    func set(selected cell: UITableViewCell, at indexPath: IndexPath)
    {
        cell.accessoryType = .none
        
        if location != ""
        {
            let data = manager.findLocation(by: location)
            
            if data.isFound
            {
                if indexPath.row == data.position
                {
                    cell.accessoryType = .checkmark
                }
                else
                {
                    cell.accessoryType = .none
                }
            }
            else
            {
                cell.accessoryType = .none
            }
        }
    }
    
    
}
