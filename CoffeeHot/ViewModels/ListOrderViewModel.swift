//
//  ListOrderViewModel.swift
//  CoffeeHot
//
//  Created by Alexander Smith on 4/18/20.
//  Copyright © 2020 Alexander Smith. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListViewModel: ObservableObject {
  
  @Published
  var orders = [OrderViewModel]()
  
  init() {
    fetchAllOrders()
  }
  
  // fetch all orders
  func fetchAllOrders() {
    self.orders = CoreDataManager.shared.getAllOrders().map(OrderViewModel.init)
    print(self.orders)
  }
  
  // delete selected order
  func deleteOrder(_ orderVM: OrderViewModel) {
    CoreDataManager.shared.deleteOrder(name: orderVM.name)
    fetchAllOrders()
  }
  
}

class OrderViewModel {
  
  var name = ""
  var type = ""
  
  init(order: Order) {
    self.name = order.name!
    self.type = order.type!
  }
  
}
