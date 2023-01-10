//
//  DrinkDetailViewController.swift
//  ProjectMeals&DrinksAppVer1.2
//
//  Created by Marko Zivanovic on 8.1.23..
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class DrinkDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkCategory: UILabel!
    @IBOutlet weak var drinkInstructions: UILabel!
    @IBOutlet weak var drinkGlass: UILabel!
    @IBOutlet weak var drinkIngredient1: UILabel!
    @IBOutlet weak var drinkIngredient2: UILabel!
    @IBOutlet weak var drinkIngredient3: UILabel!
    @IBOutlet weak var drinkIngredient4: UILabel!
    @IBOutlet weak var drinkIngredient5: UILabel!
    @IBOutlet weak var drinkMeasure1: UILabel!
    @IBOutlet weak var drinkMeasure2: UILabel!
    @IBOutlet weak var drinkMeasure3: UILabel!
    @IBOutlet weak var drinkMeasure4: UILabel!
    @IBOutlet weak var drinkMeasure5: UILabel!
    
    var selectedDrink: Drinks?
    var randomDrink: Drinks?
    var isRandom: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setUp()
    }
   //MARK: Presenting Data in DrinkDetailVC
    private func setUpData() {
        title = selectedDrink?.strDrink
        drinkCategory.text = selectedDrink?.strCategory
        drinkInstructions.text = selectedDrink?.strInstructions
        drinkGlass.text = selectedDrink?.strGlass
        drinkIngredient1.text = selectedDrink?.strIngredient1
        drinkIngredient2.text = selectedDrink?.strIngredient2
        drinkIngredient3.text = selectedDrink?.strIngredient3
        drinkIngredient4.text = selectedDrink?.strIngredient4
        drinkIngredient5.text = selectedDrink?.strIngredient5
        drinkMeasure1.text = selectedDrink?.strMeasure1
        drinkMeasure2.text = selectedDrink?.strMeasure2
        drinkMeasure3.text = selectedDrink?.strMeasure3
        drinkMeasure4.text = selectedDrink?.strMeasure4
        drinkMeasure5.text = selectedDrink?.strMeasure5
        if let url = URL(string: selectedDrink?.strDrinkThumb ?? "") {
            drinkImage.kf.setImage(with: url)
        }
    }
    
    private func setUp() {
        scrollView.isScrollEnabled = true
    }
    private func multipleLineInstructions() {
        drinkInstructions.numberOfLines = 0
    }

}
