//
//  GridLayout.swift
//  ProjectMeals&DrinksAppVer1.2
//
//  Created by Marko Zivanovic on 6.1.23..
//

import UIKit
import Foundation

class GridLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        self.itemSize = CGSize(width: 100, height: 100)
        self.minimumInteritemSpacing = 5
        self.minimumLineSpacing = 5
        self.sectionInset = .zero
        self.scrollDirection = .vertical
    }
}
