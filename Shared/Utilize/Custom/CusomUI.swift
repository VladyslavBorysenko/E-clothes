//
//  CusomUI.swift
//  E-clothes
//
//  Created by Владислав on 22.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class RoundedButton: UIButton{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedShadow: UIView{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = #colorLiteral(red: 0.1573145986, green: 0.1498467028, blue: 0.2276461124, alpha: 1)
        layer.shadowOffset = CGSize(width: 10, height: 10)
    }
}

class RoundedImageView: UIImageView{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}
class RoundedView: UIView{
        override func awakeFromNib(){
            layer.cornerRadius = 5
        }
    }
