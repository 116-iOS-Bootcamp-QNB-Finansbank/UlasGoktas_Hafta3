//
//  SliderCell.swift
//  BannerSlider
//
//  Created by ulas on 15.09.2021.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var image: UIImage! {
        didSet {
            imageView.image = image
        }
    }
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
}
