//
//  NewVIEWDemo.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 24/05/22.
//

import SwiftUI
import AVFoundation
import Foundation

struct RealityView2: View {

    @State var is_Loop : Bool = false
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    @State var totalRotation = CGSize.zero
    @State var currentRotation = CGSize.zero

    //liquid swipe
    @State var offset : CGSize = .zero
    @State var showHome = false
    
    @Binding var is_Moon : Bool
    @Binding var is_Sun : Bool
    let data = Array(1...4).map { "Item \($0)" }
    let layout = [
        GridItem(.flexible(minimum: 2)),
        GridItem(.flexible(minimum: 2))
    ]
    
    
    var body: some View {
        
        ZStack{
            Color.black
//                .clipShape(LiquidSwipe2(offset: offset))
                .ignoresSafeArea()
                .overlay(
                    ZStack{
                        
                    Rectangle()
                        .frame(width: 100, height: 50)
                        .foregroundColor(.red)
                        .cornerRadius(20)
                    Image(systemName: "moon")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .padding(.leading, 30)
                        .contentShape(Circle())
                        .onTapGesture {
                            withAnimation(.spring()) {
                                let screen = UIScreen.main.bounds
                                offset.width = screen.height
                                if offset.width > screen.width / 2 {
                                    offset.width = -screen.height + 10
                                }
                                is_Sun = true
                                is_Moon = false
                                showHome.toggle()
                                
                            }
                        }
                    }
                    .offset(x: -20, y: 80)
                   .opacity(offset == .zero ? 1 : 0), alignment: .topLeading
                        
                )
            
            VStack(spacing: 0){
                Text("Night Reality Check")
                    .foregroundColor(.white)
                Spacer()
                
                ForEach(data, id: \.self) { item in
                    //insert card per bolla
                    Text("\(item)")
                        .foregroundColor(.white)
                    
                }.padding(.vertical, 40)
                
                
                    Spacer()
                }.padding(.horizontal, 20)
            
            if showHome {
                RealityView()
            }

        }
    }

}
    

struct LiquidSwipe2 : Shape {

var offset : CGSize

var animatableData: CGSize.AnimatableData{
    get{return offset.animatableData}
    set{offset.animatableData = newValue}
}
 
func path(in rect: CGRect) -> Path {
    return Path { path in
        
        let width = rect.width + (-offset.width > 0 ? offset.width : 0)
        
        //prima costruzione rettangolo
        path.move(to: CGPoint(x: 100, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0 ))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height ))

        let from = 80 + (offset.width)

        path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))

        //ora costruiamo la forma la forma curva
        var to = 220 + (offset.height) + (-offset.width)
        to = to < 180 ? 180 : to
        
        let mid : CGFloat = 120 + ((180 - 80) / 2)
        
        
        path.move(to: CGPoint(x: -rect.width, y: from))
        
        path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y:  mid), control2: CGPoint(x: width - 50, y: mid))
    }
}
}
