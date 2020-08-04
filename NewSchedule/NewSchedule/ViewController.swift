//
//  ViewController.swift
//  NewSchedule
//
//  Created by IvanLyuhtikov on 2/23/20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var goButton: UIButton!
    
    
    var current: CurriculumWeek = []
    
    var fullCurriculum: CurriculumBothWeeks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.layer.cornerRadius = 20
        goButton.alpha = 0.5
        
        let queue = DispatchQueue(label: "vanjo_gueue")
        queue.async {
            RequestKBP.getData(stringURL: "https://kbp.by/rasp/timetable/view_beta_kbp/?cat=group&id=31") { (data) in
                self.fullCurriculum = data
                
                self.current = self.fullCurriculum?.currentWeek ?? CurriculumWeek()
                self.current = removeEmptyPares(arr: self.current)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
    }
}
