//
//  ContentView.swift
//  CoffeeHot
//
//  Created by Alexander Smith on 4/18/20.
//  Copyright © 2020 Alexander Smith. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  // object binding - pub/sub
  @ObservedObject var orderListVM: OrderListViewModel
  // add order sheet
  @State private var isPresented: Bool = false
  
  init() {
    self.orderListVM = OrderListViewModel()
  }
  
  private func delete(at offsets: IndexSet) {
    offsets.forEach { index in
      let orderVM = self.orderListVM.orders[index]
      self.orderListVM.deleteOrder(orderVM)
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(self.orderListVM.orders, id: \.name) { order in
          HStack {
            Text(order.name)
              .font(.largeTitle)
              .padding([.leading], 10)
          }
        }
        .onDelete(perform: delete)
      }
      .navigationBarTitle("Orders")
      .navigationBarItems(trailing: Button("Add Order") {
        self.isPresented = true
      })
      .sheet(isPresented: $isPresented, onDismiss: {
        self.orderListVM.fetchAllOrders()
      }, content: {
        AddOrderView()
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
