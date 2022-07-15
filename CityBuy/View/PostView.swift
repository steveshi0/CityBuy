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
    @State private var showError = false
    @State private var showSucce = false
    
    @State private var gestOffset = CGSize.zero
    @State private var pictureInd = 0
    
    
    // Width and Height for the picture placeholder
    var picWidth: CGFloat {
        UIScreen.main.bounds.width - 40
    }
    
    struct imgPlaceholderView: View {
        var body: some View {
            Text("Hello")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                PostNavView(postVM: postVM, showError: $showError, showSucce: $showSucce)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ZStack {
                            if postVM.images.count == 0 {
                                Rectangle()
                                    .foregroundColor(Color.gray)
                                    .frame(width: picWidth, height: picWidth)
                                    .cornerRadius(7.5)
                                    .onTapGesture {
                                        print("Clicked item picture")
                                    }
                            } else {
                                Image(uiImage: postVM.images[pictureInd])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: picWidth, height: picWidth)
                                    .cornerRadius(7.5)
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gest in
                                                gestOffset = gest.translation
                                            }
                                            .onEnded { _ in
                                                if gestOffset.width < -100 {
                                                    if pictureInd + 1 < postVM.images.count {
                                                        pictureInd += 1
                                                    }
                                                    gestOffset = .zero
                                                } else if gestOffset.width > -100 {
                                                    if pictureInd - 1 >= 0 {
                                                        pictureInd -= 1
                                                    }
                                                    gestOffset = .zero
                                                }
                                            }
                                    )
                            }
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
                                            CameraPickerView(isPresented: $cameraOn) { res in
                                                DispatchQueue.main.async {
                                                    postVM.images.append(res)
                                                }
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
                                            PhotosPickerView(isPresented: $albumOn) { results in
                                                for res in results {
                                                    res.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { (object, error) in
                                                        if let image = object as? UIImage {
                                                            DispatchQueue.main.async {
                                                                // Use UIImage
                                                                postVM.images.append(image)
                                                                print("Selected image: \(image)")
                                                            }
                                                        }
                                                    })
                                                }
                                            }
                                        }
                                    
                                }.padding()
                            }
                        }.frame(height: picWidth)
                    }
                    .padding()
                    .navigationBarHidden(true)
                }
            }
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
