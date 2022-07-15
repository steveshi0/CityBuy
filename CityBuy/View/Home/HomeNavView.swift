//
//  HomeNavView.swift
//  CityBuy
//
//  Created by Steve Shi on 7/14/22.
//

import SwiftUI

struct HomeNavView: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                VStack {
                    ZStack {
                        HStack(spacing: 15) {
                            Text("Home")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("Text"))
                            Spacer()
                            HStack(spacing: 20) {
                                Image(systemName: "cart")
                                    .font(.title)
                                    .onTapGesture {
                                        print("Cart clicked")
                                    }
                                Image(systemName: "message")
                                    .font(.title)
                                    .onTapGesture {
                                        print("Message clicked")
                                    }
                            }
                        }
                    }.padding(.horizontal)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 7.5) {
                        Button("Sort by") {
                            print("Sorted clicked")
                        }.navFilterStyle()
                        
                        Button("Category") {
                            print("Category clicked")
                        }.navFilterStyle()
                        
                        Button("Cost") {
                            print("Cost clicked")
                        }.navFilterStyle()
                        
                        Button("Condition") {
                            print("Condtion clicked")
                        }.navFilterStyle()
                        
                        Button("Sold") {
                            print("Sold clicked")
                        }.navFilterStyle()
                        
                    }
                }.padding(EdgeInsets(top: 5, leading: 1, bottom: 5, trailing: 1))
            }
        }
    }
}
