//
//  HomeView.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//
/**
 Default Page where the user will land when the app is opened and is logged in
 ToolBar: "Home" on the left, Space in Middle, (FavoriteItem + Message) btn on the right. Similiar to that of Instagram
 FilterAreaHStack: filter mechanism for the user to sort by various critierias such as categories(electronic, clothing), men/women, timePosted
 LazyVGridArea: Bunch of pictures with two pictures each row for each products + their price on the bottom middle. Smilar to that of FaceBook MarketPlace
 */

import SwiftUI

struct HomeView: View {
    @StateObject var HomeVM = HomeViewModel()
    @State private var search = ""
    @State private var popup = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                HomeNavView()
                GeometryReader { geo in
                    VStack(alignment: .center, spacing: 0) {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: Array.init(repeating: GridItem(.adaptive(minimum: geo.size.width / 2)), count: 2), spacing: 5) {
                                ForEach (0..<11, id: \.self) { _ in
                                    NavigationLink(destination: HomeItemView()) {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: geo.size.width / 2.05, height: geo.size.width / 2.05)
                                                .background(Color.cyan)
                                                .cornerRadius(5)
                                            
                                            VStack(alignment: .trailing) {
                                                Spacer()
                                                Text("$99")
                                                    .font(.headline)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                            }
                                            .frame(width: geo.size.width / 2.35, height: geo.size.width / 2.35)
                                        }
                                    }
                                }
                            }.padding(7.5)
                        }
                    }.background(Color("Background"))
                }
            }.navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
