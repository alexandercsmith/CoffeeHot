//
//  AddOrderView.swift
//  CoffeeHot
//
//  Created by Alexander Smith on 4/18/20.
//  Copyright © 2020 Alexander Smith. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
  
  @State var addOrderVM = AddOrderViewModel()
  
  var body: some View {
    NavigationView {
      Group {
        VStack {
          TextField("Enter name", text: self.$addOrderVM.name)
          
          Picker(selection: self.$addOrderVM.type, label: Text("")) {
            Text("Cappuccino").tag("cap")
            Text("Expresso").tag("exp")
            Text("Regular").tag("reg")
          }
          .pickerStyle(SegmentedPickerStyle())
          
          Button("Place Order") {
            self.addOrderVM.saveOrder()
          }
          .padding(8)
          .foregroundColor(Color.white)
          .background(Color.green)
          .cornerRadius(10)
        }
      }
      .padding(8)
      .navigationBarTitle(Text("Add Order"))
    }
  }
}

struct AddOrderView_Previews: PreviewProvider {
  static var previews: some View {
    AddOrderView()
  }
}
