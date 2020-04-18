//
//  NSManagedObjectContentExtensions.swift
//  CoffeeHot
//
//  Created by Alexander Smith on 4/18/20.
//  Copyright © 2020 Alexander Smith. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
  // access `NSManagedObjectContext`
  static var current: NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
  }
}
