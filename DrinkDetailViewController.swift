//
//  DrinkDetailViewController.swift
//  ProjectMeals&DrinksApp
//
//  Created by Marko Zivanovic on 3.1.23..
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
    @IBOutlet weak var drinkIngredient6: UILabel!
    @IBOutlet weak var drinkMeasure1: UILabel!
    @IBOutlet weak var drinkMeasure2: UILabel!
    @IBOutlet weak var drinkMeasure3: UILabel!
    @IBOutlet weak var drinkMeasure4: UILabel!
    @IBOutlet weak var drinkMeasure5: UILabel!
    @IBOutlet weak var drinkMeasure6: UILabel!
    
    var selectedDrink: String?
    var randomDrink: String?
    var isRandom: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
