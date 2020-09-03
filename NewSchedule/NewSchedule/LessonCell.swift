//
//  LessonCell.swift
//  NewSchedule
//
//  Created by Тимофей Лукашевич on 8/16/20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit

class LessonCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var pairName: UILabel!
    @IBOutlet weak var teacher: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var classRoom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = true


//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
//        layer.shadowRadius = 10
//        layer.shadowOpacity = 0.3
//        layer.masksToBounds = false
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(for_pair pair: CurriculumPare, at_day_by_index dayIndex: Int) {
        let timeShedule = ["с 8:30 до 10:00",
                           "с 10:10 до 11:40",
                           "с 12:10 до 13:40",
                           "с 14:00 до 15:30",
                           "с 15:40 до 17:10",
                           "с 17:20 до 18:50",
                           "с 19:00 до 20:30",
                           "error"] // 7
        let sundayTimeShedule = ["с 8:30 до 10:00",
                                 "с 10:10 до 11:40",
                                 "с 11:50 до 13:20",
                                 "с 13:40 до 15:10",
                                 "с 15:20 до 16:50",
                                 "с 17:00 до 18:30",
                                 "с 18:40 до 20:10",
                                 "error"] // 7
        number.text = pair?.numberPare
        pairName.text = pair?.pairName
        teacher.text = pair?.teacher
        classRoom.text = pair?.room
        var pairNumber = Int(pair?.numberPare ?? "8") ?? 8
        pairNumber -= 1 // pair index or error index
        if dayIndex != 5 {
            time.text = timeShedule[pairNumber]
        } else {
            time.text = sundayTimeShedule[pairNumber]
        }
    }
    
}
