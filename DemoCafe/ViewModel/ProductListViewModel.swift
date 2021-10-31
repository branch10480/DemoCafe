//
//  ProductListViewModel.swift
//  DemoCafe
//
//  Created by branch10480 on 2021/10/31.
//

import SwiftUI

class ProductListViewModel: ObservableObject {
  @Published var productList = [
    Product(name: "Espresso", image: Image("espresso"),
            description: "Espresso is a full-flavored, concentrated form of coffee that is served in “shots.” It is made by forcing pressurized hot water through very finely ground coffee beans using an espresso machine."),
    Product(name: "Latte", image: Image("latte"),
            description: "A latte or caffè latte is a milk coffee that boasts a silky layer of foam as a real highlight to the drink. A true latte will be made up of one or two shots of espresso, lots of steamed milk and a final, thin layer of frothed milk on top."),
    
    Product(name: "Frappuccino", image: Image("frappuccino"),
            description: "Frappuccino is a trademarked brand of the Starbucks Corporation for a line of highly-sweetened iced, blended coffee drinks. It consists of coffee or crème base, blended with ice and other various ingredients like flavored syrups, usually topped with whipped cream and or spices."),
    
    Product(name: "Watermelon Splash", image: Image("watermelon"),
            description: "Indulge in the refreshing flavors of watermelon and lemon with this delicious cocktail. The perfect drink to cool you down on a hot summer’s night.")
  ]
}
