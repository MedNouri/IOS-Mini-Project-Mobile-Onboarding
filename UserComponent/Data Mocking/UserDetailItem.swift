//
//  AlbumDetailItem.swift
//  UserComponent
//
//  Created by MohamedNouri on 06/09/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import Foundation


class UserDetailItem: Hashable {
    
    
    let photoURL: String
    let artistName: String
    let location: String
    let follwersNumber: String
    let followed: Bool
    let currentlyLive: Bool
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: UserDetailItem, rhs: UserDetailItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    // UUID
    private let identifier = UUID()
    
    
    
    
    // constructor
    
    init(photoURL:String,artistName:String,location: String,follwersNumber:String,followed: Bool,currentlyLive: Bool) {
        
        self.photoURL = photoURL
        self.artistName = artistName
        self.location = location
        self.follwersNumber = follwersNumber
        self.followed = followed
        self.currentlyLive = currentlyLive
        
    }
    
    
    
    
    
    
    
    //  static Data for Testing 
    
    static func GenerateMockData()->[UserDetailItem]{
        
        [ 
            .init(photoURL: "https://api.adorable.io/avatars/80/abott@adorasble.png", artistName: "Thomas Haessle ", location : "France ",follwersNumber: "340", followed: true, currentlyLive: false)
            
            ,.init(photoURL: "https://api.adorable.io/avatars/80/abott@adordable.png", artistName: "Vanille TESTARD", location : "Usa",follwersNumber: "200", followed: false, currentlyLive: true )
            ,.init(photoURL: "https://api.adorable.io/avatars/80/abott@adorssable.png", artistName: "Stan Markovic", location : "Italy ",follwersNumber: "449", followed: false, currentlyLive: false)
            ,.init(photoURL: "https://api.adorable.io/avatars/80/abott@adfffzble.png", artistName: "Adrian Sandham", location : "Netherlands",follwersNumber: "987", followed: false, currentlyLive: true)]
        
    }
    
    
}

