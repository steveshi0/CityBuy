//
//  RecoveryView.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import SwiftUI

struct RecoveryView: View {
    @State private var email = ""
    @State private var showError = false
    @State private var loadingMsg = false
    @ObservedObject var loginVM = LoginViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("Reset Password")
                    .foregroundColor(Color("Text"))
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email", text: $email)
                    .foregroundColor(Color("Text"))
                    .padding(10)
                    .frame(width: 375, height: 50)
                    .autocapitalization(.none)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .strokeBorder(Color("Text"), style: StrokeStyle(lineWidth: 0.5)))
                
                if loadingMsg {
                    ProgressView()
                        .frame(width: 300, height: 50)
                        .padding()
                } else {
                    Button("Reset Password") {
                        loadingMsg = true
                        loginVM.resetPassword(email: email) { res in
                            if res {
                                dismiss()
                            } else {
                                showError = true
                            }
                            DispatchQueue.main.async {
                                loadingMsg = false
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .padding()
                }
                
                Spacer()
            }
            .alert(isPresented: $showError) {
                Alert(title: Text("Password reset error"),
                      message: Text("Please double your email or try again later"),
                      dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
}
