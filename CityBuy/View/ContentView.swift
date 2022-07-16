//
//  ContentView.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 2
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(0)
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }.tag(1)
            PostView()
                .tabItem {
                    Label("Post", systemImage: "paperplane")
                }.tag(2)
            MessageView()
                .tabItem {
                    Label("Inbox", systemImage: "text.bubble")
                }.tag(3)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
