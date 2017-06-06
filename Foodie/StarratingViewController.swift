//
//  StarratingViewController.swift
//  Foodie
//
//  Created by Sachin Raut on 27/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit

class StarratingViewController: UIViewController
{

    @IBOutlet var pickerView: UIPickerView!
    
    var selectedRating: Rating = Rating.zero
    
    var pickerDataSource = [Rating.five,Rating.fourHalf,Rating.four,Rating.threeHalf,Rating.three, Rating.twoHalf, Rating.two, Rating.oneHalf, Rating.one, Rating.half, Rating.zero]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initialize()
    }

    func initialize()
    {
        setDefaults()
    }

    func setDefaults()
    {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        if let index = pickerDataSource.index(of: selectedRating)
        {
            pickerView.selectRow(index, inComponent: 0, animated: false)
        }
    }
}

extension StarratingViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        //print(pickerDataSource.count)
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let frame = CGRect(x: 0, y: 0, width: pickerView.rowSize(forComponent: component).width - 10, height: pickerView.rowSize(forComponent: component).height)
        
        let ratingView = RatingView(frame: frame, value: pickerDataSource[row])
        //print(ratingView)
        return ratingView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedRating = pickerDataSource[row]
    }
    
}



















