//
//  AddOrderViewModel.swift
//  CoffeeHot
//
//  Created by Alexander Smith on 4/18/20.
//  Copyright © 2020 Alexander Smith. All rights reserved.
//

import Foundation
import SwiftUI

class AddOrderViewModel {
  
  var name: String = ""
  var type: String = ""
  
  // use `CoreData` to save order
  func saveOrder() {
    CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
  }
  
}
