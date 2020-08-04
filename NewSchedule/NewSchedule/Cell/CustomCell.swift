//
//  CustomCell.swift
//  NewSchedule
//
//  Created by IvanLyuhtikov on 2/23/20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var numberOfPare: UILabel!
    @IBOutlet weak var numberOfRoom: UILabel!
    @IBOutlet weak var teacher: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.numberOfRoom.font = self.numberOfRoom.font.withSize(SizeEntity.room * SizeEntity.coefFont)
        self.numberOfPare.font = self.numberOfPare.font.withSize(SizeEntity.numOfPare * SizeEntity.coefFont)
        self.teacher.font = self.teacher.font.withSize(SizeEntity.teacher * SizeEntity.coefFont)
        self.time.font = self.time.font.withSize(SizeEntity.time * SizeEntity.coefFont)
        self.subject.font = self.subject.font.withSize(SizeEntity.subject * SizeEntity.coefFont)
        
        print(UIScreen.main.bounds.height)
    }
    
    
}
