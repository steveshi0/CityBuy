//
//  ContentView.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            PostView()
                .tabItem {
                    Label("Post", systemImage: "paperplane")
                }
            MessageView()
                .tabItem {
                    Label("Inbox", systemImage: "text.bubble")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
