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

    
    
    init(photoURL:String,artistName:String,location: String,follwersNumber:String,followed: Bool,currentlyLive: Bool) {
       
        self.photoURL = photoURL
        self.artistName = artistName
        self.location = location
        self.follwersNumber = follwersNumber
        self.followed = followed
        self.currentlyLive = currentlyLive
        
    }
 

  func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }

  static func == (lhs: UserDetailItem, rhs: UserDetailItem) -> Bool {
    return lhs.identifier == rhs.identifier
  }

  private let identifier = UUID()
}

