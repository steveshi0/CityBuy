//
//  Extensions.swift
//  CityBuy
//
//  Created by Steve Shi on 7/14/22.
//

import Foundation
import SwiftUI


// View extension for the filters within Home navigation area
struct navFilter: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(7.5)
            .frame(width: 100)
            .foregroundColor(Color("Text"))
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .strokeBorder(Color("HomeviewFilterBack"), style: StrokeStyle(lineWidth: 0.5)))
    }
}
extension View {
    func navFilterStyle() -> some View {
        modifier(navFilter())
    }
}
