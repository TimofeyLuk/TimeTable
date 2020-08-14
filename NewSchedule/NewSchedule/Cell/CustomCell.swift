//
//  CustomCell.swift
//  NewSchedule
//
//  Created by IvanLyuhtikov on 2/23/20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        cell.numberOfPare.text = ""
        cell.subject.text = current[indexPath.section][indexPath.row]?.0
        cell.teacher.text = current[indexPath.section][indexPath.row]?.1
        cell.numberOfRoom.text = current[indexPath.section][indexPath.row]?.2
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowRadius = 12
        cell.layer.shadowOpacity = 0.3
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = false
    }
    
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
        }
    }
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var numberOfPare: UILabel!
    @IBOutlet weak var numberOfRoom: UILabel!
    @IBOutlet weak var teacher: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.numberOfRoom.font = self.numberOfRoom.font.withSize(SizeEntity.room * SizeEntity.coefFont)
//        self.numberOfPare.font = self.numberOfPare.font.withSize(SizeEntity.numOfPare * SizeEntity.coefFont)
//        self.teacher.font = self.teacher.font.withSize(SizeEntity.teacher * SizeEntity.coefFont)
//
//    
//
//
//
//        self.time.font = self.time.font.withSize(SizeEntity.time * SizeEntity.coefFont)
//        self.subject.font = self.subject.font.withSize(SizeEntity.subject * SizeEntity.coefFont)
        
        print(UIScreen.main.bounds.height)
    }
    
    
}
