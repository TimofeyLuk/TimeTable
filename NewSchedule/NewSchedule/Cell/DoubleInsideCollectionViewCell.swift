//
//  DoubleInsideCollectionViewCell.swift
//  NewSchedule
//
//  Created by IvanLyuhtikov on 6.08.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit

class DoubleInsideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var numberOfPare: UILabel!
    @IBOutlet weak var numberOfRoom: UILabel!
    @IBOutlet weak var teacher: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        contentView.layer.cornerRadius = 20
//        contentView.layer.borderWidth = 1.0
//        contentView.layer.borderColor = UIColor.clear.cgColor
//        contentView.layer.masksToBounds = true
//
//
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
//        layer.shadowRadius = 20
//        layer.shadowOpacity = 0.3
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
//        layer.backgroundColor = UIColor.clear.cgColor
        
    }
    
}
