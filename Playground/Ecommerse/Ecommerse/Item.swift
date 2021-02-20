//
//  Item.swift
//  Ecommerse
//
//  Created by Shohei Yamamoto on 2021/02/20.
//

import Foundation

struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var price: String
    var rating: String
    var image: String
}

var items = [
    Item(title: "Shohei Model", subTitle: "man", price: "$36", rating: "3.8", image: "p1"),
    Item(title: "Shohei Model premium", subTitle: "both", price: "$96", rating: "4.8", image: "p2")
]
