//
//  ViewController.swift
//  NewSchedule
//
//  Created by IvanLyuhtikov on 2/23/20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var thisWeekButton: UIButton!
    @IBOutlet weak var nextWeekButton: UIButton!
    @IBOutlet weak var switchView: UIView!

    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    var fullCurriculum: CurriculumBothWeeks? {
        didSet {
            DispatchQueue.main.sync {
                if self.fullCurriculum != nil {
                    spiner.stopAnimating()
                    timeTabel.isHidden = false
                } else {
                    spiner.startAnimating()
                    timeTabel.isHidden = true
                }
                timeTabel.reloadData()
            }
        }
    }
    var activeWeek: CurriculumWeek?
    var oldActiveDay: Int?
    var activeDayIndex: Int? {
        didSet {
            for dayButton in dayPikcers {
                dayButton.setTitleColor(#colorLiteral(red: 0.5610417724, green: 0.5604769588, blue: 0.5822256804, alpha: 1), for: .normal)
            }
            dayPikcers[activeDayIndex!].setTitleColor( #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1), for: .normal)
            setActiveDayCurriculum(for_day_at_index: activeDayIndex ?? 0)
        }
    }
    
    

    override func viewDidLoad() {
        spiner.hidesWhenStopped = true
        spiner.startAnimating()
        getFullCurriculum()
        activeDayIndex = getCurrentDayIndex()
        oldActiveDay = activeDayIndex
        switchView.layer.cornerRadius = 4.0
        thisWeekButton.layer.cornerRadius = 4.0
        nextWeekButton.layer.cornerRadius = 4.0
    }
    
    private func getCurrentDayIndex() -> Int {
        let dayIndex = Calendar.current.component(.weekday, from: Date())
        return dayIndex == 1 ? 0 : dayIndex - 2
    }
    
    
    // MARK: UI functions
    @IBOutlet private var dayPikcers: [UIButton]!
    
    @IBAction private func setActiveDay(_ sender: UIButton) {
        oldActiveDay = activeDayIndex
        activeDayIndex = dayPikcers.firstIndex(of: sender)
    }
    
    
    @IBAction func switchWeek(_ sender: UIButton) {
        if sender == thisWeekButton {
            thisWeekButton.backgroundColor = UIColor(named: "activeColor")
            nextWeekButton.backgroundColor = UIColor(named: "inactiveColor")
            activeWeek = fullCurriculum?.currentWeek
            oldActiveDay = activeDayIndex
            activeDayIndex = getCurrentDayIndex()
        }
        else {
            nextWeekButton.backgroundColor = UIColor(named: "activeColor")
            thisWeekButton.backgroundColor = UIColor(named: "inactiveColor")
            activeWeek = fullCurriculum?.nextWeek
            oldActiveDay = activeDayIndex
            activeDayIndex = 0
        }
    }
    
    
    private func setActiveDayCurriculum(for_day_at_index index: Int) {
        if activeWeek != nil, oldActiveDay != nil, activeDayIndex != nil {
            if oldActiveDay! > activeDayIndex! {
                UIView.transition (
                    with: timeTabel,
                    duration: 0.6,
                    options: .transitionFlipFromLeft,
                    animations: { self.timeTabel.reloadData() }
                )
            } else {
                UIView.transition (
                    with: timeTabel,
                    duration: 0.6,
                    options: .transitionFlipFromRight,
                    animations: { self.timeTabel.reloadData() }
                )
            }
        } else {
            // error massege or using lokal data
        }
    }
    
    
    // MARK: Data functions
    private func getFullCurriculum() {
        // Request and its error
        let queue = DispatchQueue(label: "request")
                queue.async {
                    RequestKBP.getData(stringURL: "https://kbp.by/rasp/timetable/view_beta_kbp/?cat=group&id=42") { (data) in
                        self.fullCurriculum = data
                        self.fullCurriculum?.currentWeek = removeEmptyPares(arr: self.fullCurriculum?.currentWeek)
                        self.fullCurriculum?.nextWeek = removeEmptyPares(arr: self.fullCurriculum?.nextWeek)
                        self.activeWeek = self.fullCurriculum?.currentWeek
                        //self.activeWeek = removeEmptyPares(arr: self.current)
                        DispatchQueue.main.sync {
                            self.timeTabel.reloadData()
                        }
                    }
                }
    }
    
    // Tabel work
    @IBOutlet weak var timeTabel: UITableView! {
        didSet {
            timeTabel.delegate = self
            timeTabel.dataSource = self
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let activeDay = activeWeek?[activeDayIndex ?? 0]
        return activeDay?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath)
        if let lessonCell = cell as? LessonCell {
            let pair = activeWeek?[activeDayIndex ?? 0][indexPath.item]
            lessonCell.setData(for_pair: pair, at_day_by_index: indexPath.item)
        }
        
        return cell
    }
    
    
    
}
