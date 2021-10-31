//
//  ContentView.swift
//  DemoCafe
//
//  Created by branch10480 on 2021/10/31.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ProductListViewModel()
  @Namespace private var animation
  
  @State var showDetailView = false
  @State var currentProduct = Product(name: "", image: Image(""), description: "")
  
  var body: some View {
    ZStack {
      if showDetailView {
        DetailView(showDetailView: $showDetailView, animation: animation, product: currentProduct)
      }
      
      // Actual menus
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(viewModel.productList, id: \.id) { product in
            ZStack {
              Circle()
                .stroke(.gray, lineWidth: 1.5)
                .frame(width: 150, height: 150)
                .padding(5)
              
              VStack {
                product.image
                  .resizable()
                  .matchedGeometryEffect(id: product.id, in: animation, anchor: .center)
                  .scaledToFit()
                  .frame(width: 75, height: 75, alignment: .center)
                Text(product.name)
                  .font(.system(size: product.name.count > 12 ? 12 : 15))
              }
              .onTapGesture {
                withAnimation(.easeInOut) {
                  showDetailView = true
                  currentProduct = product
                }
              }
              
            }
          }
        }
        .contentShape(Rectangle())
      }
      .opacity(showDetailView ? 0 : 1)
    }
  }
  
  /// DetailView
  struct DetailView: View {
    @Binding var showDetailView: Bool
    
    @State var isMagnified: Bool = false
    
    var animation: Namespace.ID
    let product: Product
    
    var body: some View {
      VStack {
        // Full screen
        if isMagnified {
          Magnify(product.image)
            .padding()
            .matchedGeometryEffect(id: product.id, in: animation)
            .onTapGesture {
              withAnimation(.spring()) {
                isMagnified = false
              }
            }
        } else {
          // Previous button
          HStack {
            Button(action: { withAnimation(.spring()) {
              showDetailView = false
            }}) {
              Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .font(.system(size: 20))
                .padding()
            }
            Spacer()
          }
          
          // Image contents
          ZStack {
            product.image
              .resizable()
              .matchedGeometryEffect(id: product.id, in: animation, anchor: .center)
              .scaledToFit()
              .frame(width: 250, height: 250)
              .zIndex(1)
              .contentShape(Rectangle())
              .onTapGesture {
                withAnimation(.spring()) {
                  isMagnified = true
                }
              }
          }
          .frame(height: 250)
          
          // Description: Name
          VStack {
            Text(product.name)
              .font(.title)
              .bold()
              .transition(.move(edge: .bottom))
            
            Text(product.description)
              .font(.subheadline)
              .transition(.move(edge: .bottom))
              .padding(25)
          }
          Spacer()
        }
      }
    }
    
    @ViewBuilder
    func Magnify(_ image: Image) -> some View {
      ZStack {
        image
          .resizable()
          .scaledToFit()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
