//
//  Extension.swift
//  NewSchedule
//
//  Created by IvanLyuhtikov on 2/23/20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import UIKit



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    
    
    //MARK: -CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return current[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return current.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionViewCell", for: indexPath) as! CustomCell
        
        cell.numberOfPare.text = current[indexPath.section][indexPath.row]?.4
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width-50, height: SizeEntity.sizeForCell * SizeEntity.screenHeight/800)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 25, bottom: 50, right: 25)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
    
    
    
    
}
