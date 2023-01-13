//
//  MealTableViewCell.swift
//  MealsAndDrinksApp
//
//  Created by Marko Zivanovic on 28.12.22..
//

import UIKit
import Kingfisher

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealAreaLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    
    //MARK: Meal Cell Identifier
    static let mealCellIdentifier = "MealTableVIewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    //MARK: SetUp Cell Image And Labels
    func setUpMealCell(data: Meals) {
        mealNameLabel.text = data.strMeal
        mealAreaLabel.text = data.strArea
        
        let mealImageUrl = URL(string: data.strMealThumb ?? "")
        mealImage.kf.setImage(with: mealImageUrl)
    }
}
