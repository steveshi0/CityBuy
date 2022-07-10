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
    @ObservedObject var loginVM = LoginViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                
                Button("Reset Password") {
                    loginVM.resetPassword(email: email) { res in
                        if res {
                            dismiss()
                        } else {
                            showError = true
                        }
                    }
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.red)
                .cornerRadius(10)
                .padding()
                
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
