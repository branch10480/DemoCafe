//
//  Product.swift
//  DemoCafe
//
//  Created by branch10480 on 2021/10/31.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
  let name: String
  let image: Image
  let description: String
  let id = UUID()
}
