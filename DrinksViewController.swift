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
                    
                }
            case .failure:
                let alert = UIAlertView()
                alert.title = "no internet connection!"
                alert.show()
            }
            
        }
    }
}
