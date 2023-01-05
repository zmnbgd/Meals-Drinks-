//
//  DrinksViewController.swift
//  ProjectMeals&DrinksApp
//
//  Created by Marko Zivanovic on 31.12.22..
//

import UIKit
import Alamofire
import SwiftyJSON

class DrinksViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var drinksCollectionView: UICollectionView!
    
    var data: [DrinksModel] = []
    var drinks: [Drinks] = [] {
        didSet {
            self.drinksCollectionView.reloadData()
        }
    }
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

//MARK: Private Methods
extension DrinksViewController {
    
    private func setUp() {
        setUpDeletage()
    }
    
    private func setUpDeletage() {
        drinksCollectionView.delegate = self
        drinksCollectionView.dataSource = self
    }
    
    private func setUpCollection() {
        let nib = UINib(nibName: DrinkCollectioViewCell.identifier, bundle: nil)
        drinksCollectionView.register(nib, forCellWithReuseIdentifier: DrinkCollectioViewCell.identifier)
        drinksCollectionView.collectionViewLayout = GridLayout()
    }
}

//MARK: UICollectio View Data Source
extension DrinksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinkCollectioViewCell.identifier, for: indexPath) as? DrinkCollectioViewCell else {
            return UICollectionViewCell()
        }
        let item = drinks[indexPath.row]
        cell.setUpCell(data: item)
        return cell
    }
}
//MARK: Interaction With Cell
extension DrinksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}

//MARK: Get API Call With Alamofire
extension DrinksViewController {
    func drinkFetch() {
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=A"
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                print(response.result)
                self.drinks.removeAll()
                do {
                    let myResult = try? JSON(data: response.data!)
                    for item in myResult!["drinks"].arrayValue {
                        let name = item["strDrink"].stringValue
                        let category = item["strCategory"].stringValue
                        let instruction = item["strInstructions"].stringValue
                        let glass = item["strGlass"].stringValue
                        let drinkThumb = item["strDrinkThumb"].stringValue
                        let ingredient1 = item["strIngredient1"].stringValue
                        let ingredient2 = item["strIngredient2"].stringValue
                        let ingredient3 = item["strIngredient3"].stringValue
                        let ingredient4 = item["strIngredient4"].stringValue
                        let ingredient5 = item["strIngredient5"].stringValue
                        let ingredient6 = item["strIngredient6"].stringValue
                        let measure1 = item["strMeasure1"].stringValue
                        let measure2 = item["strMeasure2"].stringValue
                        let measure3 = item["strMeasure3"].stringValue
                        let measure4 = item["strMeasure4"].stringValue
                        let measure5 = item["strMeasure5"].stringValue
                        let measure6 = item["strMeasure6"].stringValue
                        self.drinks.append(Drinks.init(strDrink: name, strCategory: category, strInstructions: instruction, strGlass: glass, strDrinkThumb: drinkThumb, strIngredient1: ingredient1, strIngredient2: ingredient2, strIngredient3: ingredient3, strIngredient4: ingredient4, strIngredient5: ingredient5, strIngredient6: ingredient6, strMeasure1: measure1, strMeasure2: measure2, strMeasure3: measure3, strMeasure4: measure4, strMeasure5: measure5, strMeasure6: measure6))
                    }
                }
            case .failure:
                let alert = UIAlertView()
                alert.title = "no internet connection!"
                alert.show()
            }
        }
    }
}
