//
//  PostNavView.swift
//  CityBuy
//
//  Created by Steve Shi on 7/15/22.
//

import SwiftUI

struct PostNavView: View {
    @ObservedObject var postVM: PostViewModel
    @Binding var showError: Bool
    @Binding var showSucce: Bool
    @Binding var exitPost: Bool
    
    func sellClick() {
        postVM.postItem { res in
            if res {
                print("Posted Item")
                showSucce = true
            } else {
                print("!Posted Item")
                showError = true
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                VStack {
                    ZStack {
                        HStack(spacing: 50) {
                            Text("x")
                                .font(.largeTitle)
                                .foregroundColor(Color("Text"))
                                .onTapGesture {
                                    exitPost = true
                                }
                            Text("Start Post")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("Text"))
                            Text("Post")
                                .font(.largeTitle)
                                .foregroundColor(Color("Text"))
                        }
                    }.padding(.horizontal)
                }
                .padding(EdgeInsets(top: 5, leading: 1, bottom: 5, trailing: 1))
            }
        }
    }
}
