//
//  HomeTableViewCell.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        commentsLabel.text = nil
    }
    
    func setup(_ value : UserComments?) {
        if let userDetails = value {
            
            let myString = userDetails.name + "  " + userDetails.comment
            var myMutableString = NSMutableAttributedString()
            
            // Attributes
            myMutableString = NSMutableAttributedString(
                string: myString,
                attributes: [NSAttributedString.Key.font:
                    UIFont(name:"HelveticaNeue", size: 13.0)!])
            myMutableString.addAttribute(NSAttributedString.Key.font,
                                         value: UIFont(name:"HelveticaNeue-Bold", size: 15.0)!,
                                         range: NSRange(
                                            location: 0,
                                            length: userDetails.name.count))

            if userDetails.score.count > 0 {
                let range = (myString as NSString).range(of: userDetails.score)
                myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.9215686275, green: 0.6823529412, blue: 0.3568627451, alpha: 1) , range: range)
            }
       
            commentsLabel.attributedText = myMutableString
            
        }
    } //end
}
