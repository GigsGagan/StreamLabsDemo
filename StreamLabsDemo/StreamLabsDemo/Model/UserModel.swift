//
//  UserModel.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var notification: Int
    var type: Int
}

struct UserComments {
    var name: String
    var comment: String
    var score: String
}

class Profile {

    func getCarouselData() -> [User] {
        let userData1 = User(name: "Feed", notification: 0, type: 2)
        let userData2 = User(name: "$1k Contest", notification: 0, type: 1)
        let userData3 = User(name: "Ninja", notification: 3, type: 0)
        let userData4 = User(name: "pokimane", notification: 7, type: 0)
        let userData5 = User(name: "DrLupo", notification: 0, type: 0)
        let userData6 = User(name: "KingRidge", notification: 0, type: 0)
        let userData = [userData1,userData2,userData3,userData4,userData5,userData6]
        
        return userData
    }
    
    func getComments() -> [UserComments] {
        let userData1 = UserComments(name: "drg5", comment: "  just liked this 100 times!", score: "100")
        let userData2 = UserComments(name: "ninja",comment: "😈 😈 😈 😈 ", score: "")
        let userData3 = UserComments(name: "yuierrooo", comment: "how do you even do that  ☠️ ☠️ ☠️", score: "")
        let userData4 = UserComments(name: "picachU", comment: "im gon try that!!  😸 😸 😸", score: "")
        let userData5 = UserComments(name: "DrLupo", comment: "I love it", score: "")
        let userData6 = UserComments(name: "KingRidge", comment: "Kepp growing", score: "")
        let userData7 = UserComments(name: "Gagan", comment: "App Looks cool!!!!", score: "")

        let userData = [userData1,userData2,userData3,userData4,userData5,userData6, userData7]
        
        return userData
    }
}
