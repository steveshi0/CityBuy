//
//  ExploreView.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//
/**
 Search Page where the user can find out items that are not within their own city. How an product is gonna get their idk, discretionate to the seller/buyer
 SearchBar to search for products, along with recommendations
 Return bunch of products similar to the view of the HomePage
 */

import SwiftUI
import Firebase

struct ExploreView: View {
    
    var body: some View {
        Button("Add") {
            let data: [String: Any] = [
                "id": UUID().uuidString,
                "name": "Xbox controller",
                "cost": 60.99,
                "time": ServerValue.timestamp(),
                "sold": false,
                "image": "location",
                "seller": ["\(UUID())", "Steve", GeoPoint(latitude: 52.5, longitude: 58.2)],
                "attributes": "\(ItemAttributes.Arts)"
            ]
            
            let data2 = Firestore.firestore()
                .collection("location")
                .document("rockledge")
                .collection("item")
                .document("asdkj")
                .getDocument { snap, err in
                    let data = snap?.data()
                    let sellerArr: [Any] = data?["seller"] as! [Any]
                    let location: GeoPoint = sellerArr[2] as! GeoPoint
                    print(data)
                    
                    
                    print(location.latitude)
                    print(location.longitude)
                }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
