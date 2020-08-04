//
//  Constants.swift
//  NewSchedule
//
//  Created by IvanLyuhtikov on 3.08.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit

struct SizeEntity {
    static let cell: CGFloat = 0.2
    static let inset: CGFloat = 25
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    
    static let room: CGFloat = 38
    static let subject: CGFloat = 22
    static let teacher: CGFloat = 22
    static let numOfPare: CGFloat = 38
    static let time: CGFloat = 18
    
    static let sizeForCell: CGFloat = 140
    
    static let coefFont: CGFloat = SizeEntity.screenHeight/812    //812 is a screen iPhone 11 Pro, because design have created with his resolution, therefore - 1x
}
