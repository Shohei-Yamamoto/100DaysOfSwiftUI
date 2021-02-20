//
//  Detail.swift
//  Ecommerse
//
//  Created by Shohei Yamamoto on 2021/02/20.
//

import SwiftUI

struct iconFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.black)
    }
}

extension View {
    func iconFont() -> some View {
        return self.modifier(iconFontModifier())
    }
}

struct Detail: View {
    @Binding var selectedItem: Item
    @Binding var show: Bool
    var animation: Namespace.ID
    
    @State private var selectedColor: Color = Color("p1")
    @State private var loadContent = false
    
    var body: some View {
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), content: {
            HStack(spacing: 20) {
                Button(action: {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .iconFont()
                        
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                        .iconFont()
                        
                })
                
                Button(action: {}, label: {
                    Image(systemName: "bag")
                        .iconFont()
                })
            }
            .padding()
            
            VStack(spacing: 10) {
                Image(selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                    .padding()
                
                Text(selectedItem.title)
                    .fontWeight(.heavy)
                    .iconFont()
                
                Text(selectedItem.subTitle)
                    .foregroundColor(.gray)
                    .padding(.top, 4)
                
                HStack {
                    Text(selectedItem.rating)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "suit.heart")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                    .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                }
                .padding()
            }
            .padding(.top, 35)
            .background(
                Color(selectedItem.image)
                    .clipShape(CustomShape())
                    .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
            )
            .cornerRadius(15)
            .padding()
            
            VStack {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Exclusive Offer")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text("Frame + Lens for $35")
                        .foregroundColor(.gray)
                })
                .padding()
                .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                .background(Color(selectedItem.image))
                .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Color")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 15) {
                        ForEach(1...4, id:\.self) { i in
                            ZStack {
                                Color("p\(i)")
                                    .clipShape(Circle())
                                    .frame(width: 45, height: 45)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedColor = Color("p\(i)")
                                        }
                                    }
                                
                                if selectedColor == Color("p\(i)") {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        Spacer()
                    }
                })
                .padding()
                
                Spacer(minLength: 15)
                
                Button(action: {}, label: {
                    Text("Try FRAME IN 3D")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                        )
                })
                
                Button(action: {}){
                    Text("ADD TO CART")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color.black)
                        .cornerRadius(15)
                }
                .padding(.vertical)
            }
            .padding([.horizontal, .bottom])
            .frame(height: loadContent ? nil : 0)
            .opacity(loadContent ? 1 : 0)
            
             Spacer(minLength: 0)
        
        })
        .onAppear(perform: {
            withAnimation(Animation.spring().delay(0.45)){
                loadContent.toggle()
            }
        })
        
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let pt1 = CGPoint(x: rect.width, y: 0)
            let pt2 = CGPoint(x:0, y: rect.height - 100)
            let pt3 = CGPoint(x:0, y: rect.height)
            let pt4 = CGPoint(x:rect.width, y: rect.height)
            
            path.move(to: pt4)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 20)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 20)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 20)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 20)
        }
    }
}

struct Detail_Previews: PreviewProvider {
    @Namespace static var mockId: Namespace.ID
    static var previews: some View {
        Detail(selectedItem: .constant(items[0]), show: .constant(false), animation: mockId)
    }
}
