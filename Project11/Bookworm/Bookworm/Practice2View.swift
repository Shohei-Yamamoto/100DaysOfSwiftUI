//
//  Practice2View.swift
//  Bookworm
//
//  Created by Shohei Yamamoto on 2021/04/08.
//

import SwiftUI

struct Practice2View: View {

    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    }
}

struct Practice2View_Previews: PreviewProvider {
    static var previews: some View {
        Practice2View()
    }
}
