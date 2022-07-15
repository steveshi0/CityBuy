//
//  ContentView.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//

import SwiftUI
import Inject

struct ContentView: View {
    @ObserveInjection var inject // INJECT
    
    @State private var tabSelection = 1
    
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
                    Label("Profile", systemImage: "person.crop.circle")
                }.tag(4)
        }
        
        .enableInjection() // INJECT
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
