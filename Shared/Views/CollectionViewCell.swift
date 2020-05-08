//
//  CollectionViewCell.swift
//  E-clothes
//
//  Created by Владислав on 08.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    //MARK: - ViewControllerLifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.layer.cornerRadius = 5
    }

    //MARK: - Functions
    func configureCell(category: Category){
        categoryLabel.text = category.name
        
        if let url = URL(string: category.pictureURL){
            categoryImage.kf.indicatorType = .activity
            categoryImage.kf.setImage(with: url)
        }
    }
}
