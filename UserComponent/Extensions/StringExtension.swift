//
//  StringExtension.swift
//  UserComponent
//
//  Created by MohamedNouri on 06/09/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import Foundation
 

extension StringProtocol {
  var firstUppercased: String {
    return prefix(1).uppercased() + dropFirst()
  }

  var displayNicely: String {
    return firstUppercased.replacingOccurrences(of: "_", with: " ")
  }
}
