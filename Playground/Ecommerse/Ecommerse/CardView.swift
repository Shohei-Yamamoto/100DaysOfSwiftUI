//
//  CardView.swift
//  Ecommerse
//
//  Created by Shohei Yamamoto on 2021/02/20.
//

import SwiftUI

struct CardView: View {
    var item: Item
    var animation: Namespace.ID
    
    
    var body: some View {
        VStack {
            HStack {
                Text(item.price)
                    .fontWeight(.heavy)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
            }
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(item.id)", in: animation)
                .padding(.top, 30)
                .padding(.bottom)
                .padding(.horizontal, 10)
            
            
            Text(item.title)
                .fontWeight(.bold)
            
            Text(item.subTitle)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                })
                .matchedGeometryEffect(id: "heart\(item.id)", in: animation)

                Spacer(minLength: 0)

                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)
            }
            .padding()
        }
        .background(
            Color(item.image)
                .matchedGeometryEffect(id: "color\(item.id)", in: animation))
        .cornerRadius(15)
    }
}

struct CardView_Previews: PreviewProvider {
    @Namespace static var placeholder
    static var previews: some View {
        CardView(item: items[0], animation: placeholder)
    }
}
