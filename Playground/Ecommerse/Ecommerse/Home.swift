//
//  Home.swift
//  Ecommerse
//
//  Created by Shohei Yamamoto on 2021/02/20.
//  ref: https://kavsoft.dev/SwiftUI_2.0/ECommerce/
//  ref: [matchedGeometryEffect と @Namespaceを使ったアニメーション - Qiita](https://qiita.com/hoshi005/items/83cafdc3270bd0e248c0) hero animation
// ref: [[Swift] SwiftUIの LazyVGrid / LazyHGrid について考察してみる - Qiita](https://qiita.com/hcrane/items/2e8e883685b976ec8555)

import SwiftUI
let tabs = ["Glasses", "Watched", "Shoes", "Perfume"]

struct Home: View {
    @State private var selected = tabs[0]
    @Namespace var animation
    
    @State var show = false
    @State var selectedItem: Item = items[0]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                    })
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    Button(action: {}, label: {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .cornerRadius(15)
                    })
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 5, content: {
                                Text("Let's")
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                Text("Get Started")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                            })
                            .padding(.horizontal)
                            
                            Spacer(minLength: 0)
                        }
                        
                        HStack(spacing: 0){
                            ForEach(tabs,id: \.self) { tab in
                                TabButton(title: tab, selected: $selected, animation: animation)
                                if tabs.last != tab {
                                    Spacer(minLength: 0)
                                }
                                
                            }
                        }
                        .padding()
                        .padding(.top, 5)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25, content: {
                            ForEach(items) {item in
                                CardView(item: item, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                            
                        })
                        .padding()
                    }
                }
                
                Spacer(minLength: 0)
                
            }
            .opacity(show ? 0 : 1)
            
            if show {
                Detail(selectedItem: $selectedItem, show: $show, animation: animation)
            }
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
