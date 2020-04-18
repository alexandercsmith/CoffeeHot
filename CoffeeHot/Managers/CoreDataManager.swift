//
//  CoreDataManager.swift
//  CoffeeHot
//
//  Created by Alexander Smith on 4/18/20.
//  Copyright © 2020 Alexander Smith. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  // create `CoreDataManager` and access NSPersistentContent in AppDelegate
  static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
  
  // access `NSPersistentStorage` container and execute actions from `AppDelegate`
  var moc: NSManagedObjectContext
  
  // initializer for `NSManagedObjectContext`
  private init(moc: NSManagedObjectContext) {
    self.moc = moc
  }
  
  // ORDERS
  
  // - Get Order
  func getOrder(name: String) -> Order? {
    var orders = [Order]()
    let request: NSFetchRequest<Order> = Order.fetchRequest()
    request.predicate = NSPredicate(format: "name == %@", name)
    do {
      orders = try self.moc.fetch(request)
    } catch let error as NSError {
      print(error)
    }
    return orders.first
  }
  
  // - Get Orders
  func getAllOrders() -> [Order] {
    var orders = [Order]()
    // return orders using `NSFetchRequest` from `CoreData`
    let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
    do {
      orders = try self.moc.fetch(orderRequest)
    } catch let error as NSError {
      print(error)
    }
    return orders
  }
  
  // - Save Order
  func saveOrder(name: String, type: String) {
    let order = Order(context: self.moc)
    order.name = name
    order.type = type
    do {
      // save order to `CoreData` - `NSManagedObjectContext`
      try self.moc.save()
    } catch let error as NSError {
      print(error)
    }
  }
  
  // - Delete Order
  func deleteOrder(name: String) {
    do {
      if let order = getOrder(name: name) {
        self.moc.delete(order)
        try self.moc.save()
      }
    } catch let error as NSError {
        print(error)
    }
  }
}
