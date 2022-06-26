//
//  HomeView.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//
/**
 Default Page where the user will land when the app is opened and is logged in
 ToolBar: Title(CityPay) on the left, Space in Middle, (FavoriteItem + Message) btn on the right. Similiar to that of Instagram
 FilterAreaHStack: filter mechanism for the user to sort by various critierias such as categories(electronic, clothing), men/women, timePosted
 LazyVGridArea: Bunch of pictures with two pictures each row for each products + their price on the bottom middle. Smilar to that of FaceBook MarketPlace
 */

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
