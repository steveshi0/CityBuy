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
import PhotosUI

struct PostView: View {
    @StateObject var postVM = PostViewModel()
    
    @State private var cameraOn = false
    @State private var albumOn = false
    
    @State private var showError = false
    @State private var showSucce = false
    
    @State private var gestOffset = CGSize.zero
    @State private var pictureInd = 0
    
    @State private var postingProgress = false
    
    @Binding var tabselection: Int
    
    // Width and Height for the picture placeholder
    var picWidth: CGFloat {
        UIScreen.main.bounds.width / 1.25
    }
    
    let decimalFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Group {
                Form {
                    Section {
                        VStack {
                            if postVM.images.count == 0 {
                                Image(systemName: "photo.fill.on.rectangle.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(Color.gray)
                                    .frame(width: picWidth, height: picWidth)
                                    .cornerRadius(7.5)
                            } else {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<postVM.images.count, id: \.self) { ind in
                                            Image(uiImage: postVM.images[ind])
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: picWidth, height: picWidth)
                                                .cornerRadius(7.5)
                                        }
                                    }
                                }
                            }
                            HStack(spacing: 10) {
                                Spacer()
                                Image(systemName: "camera")
                                    .font(.title)
                                    .foregroundColor(Color("Text"))
                                    .onTapGesture { cameraOn = true }
                                    .sheet(isPresented: $cameraOn) {
                                        CameraPickerView(isPresented: $cameraOn) { res in
                                            DispatchQueue.main.async {
                                                postVM.images.append(res)
                                            }
                                        }
                                    }
                                Image(systemName: "photo")
                                    .font(.title)
                                    .foregroundColor(Color("Text"))
                                    .onTapGesture { albumOn = true }
                                    .sheet(isPresented: $albumOn) {
                                        PhotosPickerView(isPresented: $albumOn) { results in
                                            postVM.uploadPhotoPicker(results)
                                        }
                                    }
                            }
                        }
                    } header: {
                        HStack {
                            Text("Add up to four photos")
                                .foregroundColor(Color("Text"))
                                .fontWeight(.bold)
                            Spacer()
                            if postVM.images.count != 0 {
                                Text("Clear gallery")
                                    .foregroundColor(Color("Text"))
                                    .padding(2.5)
                                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color("Theme"), style: StrokeStyle(lineWidth: 0.25)))
                                    .background(Color.red)
                                    .cornerRadius(10.0)
                                    .onTapGesture {
                                        postVM.images.removeAll()
                                    }
                            }
                        }
                    }
                    
                    Section {
                        TextField("What is the name?", text: $postVM.name)
                            .frame(width: UIScreen.main.bounds.width)
                        TextField("Describe the item", text: $postVM.descr)
                            .frame(width: UIScreen.main.bounds.width)
                    } header: {
                        Text("Basic")
                            .foregroundColor(Color("Text"))
                            .fontWeight(.bold)
                    }
                    
                    Section {
                        TextField("How much is it selling", value: $postVM.cost, formatter: decimalFormat)
                        Picker(selection: $postVM.category) {
                            ForEach(ItemAttributes.allCases) { attribute in
                                Text(attribute.rawValue)
                            }
                        } label: {
                            Text("Category")
                                .fontWeight(.medium)
                        }
                        Picker(selection: $postVM.condition) {
                            ForEach(ItemCondition.allCases) { condition in
                                Text(condition.rawValue)
                            }
                        } label: {
                            Text("Condition")
                                .fontWeight(.medium)
                        }
                    } header: {
                        Text("Details")
                            .foregroundColor(Color("Text"))
                            .fontWeight(.bold)
                    }
                }
                .navigationTitle("New Post")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "xmark")
                            .onTapGesture {
                                withAnimation {
                                    //                                tabselection = 1
                                }
                            }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            if postingProgress {
                                ProgressView()
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color("Theme"), style: StrokeStyle(lineWidth: 0.5)))
                            } else {
                                Image(systemName: "paperplane.fill")
                                Text("Post")
                            }
                        }
                        .padding(5)
                        .background(Color("Theme"))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color("Theme"), style: StrokeStyle(lineWidth: 0.5)))
                        .foregroundColor(postVM.canPost ? .blue : .gray)
                        .onTapGesture {
                            guard postVM.canPost else { return }
                            postingProgress = true
                            postVM.postItem { res in
                                postingProgress = false
                                print("Post result: \(res)")
                                if res {
                                    showSucce = true
                                    postVM.finishIteration()
                                } else {
                                    showError = true
                                }
                            }
                        }
                    }
                }
                .alert(isPresented: $showError) {
                    Alert(title: Text("Upload Error"), message: Text("Unexpected error when posting item, please try again later."), dismissButton: .default(Text("Ok")))
                }
            }.sheet(isPresented: $showSucce) {
                Text("Success")
                Button("Upload another item") {
                    showSucce = false
                }
                
                Button("Return Home") {
                    tabselection = 0
                    showSucce = false
                }
                
            }
        }
    }
}
