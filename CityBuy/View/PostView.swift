//
//  PostView.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//
/**
 Typical app tabView that allows the user to post their products they want to sell
 Placeholder to hold the items that they are going to sell, roughly 4 pictures for the client
 Information such as name, price, condtion, categories
 post button down in the upper right toolBar
 */

import SwiftUI

struct PostView: View {
    @StateObject var postVM = PostViewModel()
    
    @State private var cameraOn = false
    @State private var albumOn = false
    
    
    // Width and Height for the picture placeholder
    var picWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    var picHeight: CGFloat {
        UIScreen.main.bounds.height / 3
    }
    var topHeight: CGFloat {
        UIScreen.main.bounds.height / 3
    }
    
    struct firstImageView: View {
        @State var imageHolder: [UIImage]
        var picWidth: CGFloat {
            UIScreen.main.bounds.width - 20
        }
        var picHeight: CGFloat {
            UIScreen.main.bounds.height / 3
        }
        
        var body: some View {
            if imageHolder.count == 0 {
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: picWidth - 10, height: picHeight, alignment: .center)
                    .cornerRadius(7.5)
                    .onTapGesture {
                        print("Clicked item picture")
                    }
            } else {
                Image(uiImage: imageHolder[0])
                    .frame(width: picWidth - 10, height: picHeight, alignment: .center)
                    .cornerRadius(7.5)
                    .onTapGesture {
                        print("Clicked item picture")
                    }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    firstImageView(imageHolder: postVM.images)
                    VStack {
                        Spacer()
                        HStack(spacing: 25) {
                            Spacer()
                            Image(systemName: "camera")
                                .font(.largeTitle)
                                .foregroundColor(Color("Text"))
                                .onTapGesture {
                                    print("Make camara on")
                                    cameraOn = true
                                }
                                .sheet(isPresented: $cameraOn) {
                                    CameraPickerView(isPresented: $cameraOn) { img in
                                        print("Camera")
                                    }
                                }
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundColor(Color("Text"))
                                .onTapGesture {
                                    print("Make album on")
                                    albumOn = true
                                }
                                .sheet(isPresented: $albumOn) {
                                    PhotosPickerView(isPresented: $albumOn) { res in
                                        print("Album")
                                    }
                                }
                                       
                        }.padding()
                    }
                }.frame(height: picHeight)
                Form {
                    Section {
                        Text("Hello")
                    } header: {
                        Text("Item name")
                    }
                }
                .cornerRadius(10)
            }
            .padding()
            .navigationBarHidden(true)
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
