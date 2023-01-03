//
//  DrinkCollectioViewCell.swift
//  ProjectMeals&DrinksApp
//
//  Created by Marko Zivanovic on 1.1.23..
//

import UIKit
import Kingfisher

class DrinkCollectioViewCell: UICollectionViewCell {
    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var lineVIew: UIView!
    
    static let identifier = "DrinkCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//MARK: SetUp Cell Image And Label 
    func setUpCell(data: Drinks) {
        drinkName.text = data.strCategory
        let imageUrl = URL(string: data.strDrinkThumb ?? "")
        drinkImage.kf.setImage(with: imageUrl)
    }
}
