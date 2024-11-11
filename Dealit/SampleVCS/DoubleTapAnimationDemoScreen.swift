//
//  DoubleTapAnimationDemoScreen.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 05/11/24.
//

import SwiftUI

@available(iOS 16.0, *)
struct DoubleTapAnimationDemoScreen: View {
    var body: some View  {
        GeometryReader { inset in
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Stories").font(.largeTitle)
                        Spacer()
                        Button("Watch all") {
                            print("Watch all action")
                        }
                    }.padding([.leading,.trailing], 10)
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                    HorizontalFoodItemsView()
                }
            }
        }
        
        
    }
}


@available(iOS 16.0, *)
struct HorizontalFoodItemsView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
                VStack {
                    Image(uiImage: UIImage(resource: ImageResource(name: "pizza", bundle: .main))).resizable().frame(height: 100).frame(width: 100).clipShape(.rect(cornerRadius: 10))
                    Text("pizza")
                }
            }.padding(.horizontal,10)
            
        }.scrollContentBackground(.hidden)
    }
}
