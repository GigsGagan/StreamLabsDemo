//
//  UserCollectionCell.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

enum UserType : Int {
    case Feed = 2, Contest = 1, Streamers = 0
}

class UserCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var notificationNoLabel: UILabel!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var userBorderImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    struct Constants {
        static let CellReuseID = "kUserID"
        static let NibName     = "UserCollectionCell"
    }
    
    class var nibName : String {  return Constants.NibName }
    class var cellReuseID : String {  return Constants.CellReuseID }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userLabel.text = nil
        notificationNoLabel.text = nil
        userImageView.image = nil
        notificationImageView.image = nil
        userBorderImageView.image = nil
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        notificationImageView.layer.cornerRadius = notificationImageView.frame.height / 2.0
        notificationImageView.layer.masksToBounds = true
        
        userImageView.layer.cornerRadius = userImageView.frame.height / 2.0
        userImageView.layer.masksToBounds = true
        userImageView.layer.borderWidth = 3
        userImageView.layer.borderColor = UIColor.black.cgColor
        
        userBorderImageView.layer.cornerRadius =  userBorderImageView.frame.height / 2.0
        userBorderImageView.layer.masksToBounds = true
    }
    
    func setupCell(_ value : User?)  {
        
        if let userDetails = value {
            userLabel.text = userDetails.name
            userImageView.image = UIImage(named: userDetails.name)
            
            if userDetails.type == UserType.Contest.rawValue {
                notificationImageView.image = UIImage(named: "star2")
                notificationNoLabel.isHidden = true
                userLabel.textColor = UIColor.white
                userLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 13.0)

            } else if userDetails.type == UserType.Feed.rawValue {
                notificationImageView.isHidden = true
                notificationNoLabel.isHidden = true
                userLabel.textColor = UIColor.white
            } else {
                if userDetails.notification > 1 {
                    notificationNoLabel.isHidden = false
                    notificationImageView.isHidden = false
                    notificationNoLabel.text = String(userDetails.notification)
                    notificationImageView.image = UIImage(named: "")
                    userLabel.textColor = UIColor.white
                } else {
                    notificationNoLabel.isHidden = true
                    notificationImageView.isHidden = true
                    userLabel.textColor = UIColor.darkGray
                }
            }
        }
    } //end
    
    
}
