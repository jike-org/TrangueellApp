//
//  ViewHome.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 12/05/22.
//

//import SwiftUI
//import AVFoundation
//import Foundation
//
//struct ViewHome: View {
//
//    @State var is_Loop : Bool = false
//    
//    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        VStack {
//            Capsule()
//                .fill(Color.blue)
//                .overlay(
//                    Text("TAP")
//                        .font(.system(size:20, weight: .bold))
//                )
//                .font(.largeTitle)
//                .foregroundColor(Color.black)
//                .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
//                .edgesIgnoringSafeArea(.all)
//                        
//        }.onTapGesture(count: 1) {
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                AudioServicesPlaySystemSound(1026)
//                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//            }
//        }
//        
//        .contentShape(Rectangle())
//        .onAppear(){
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                AudioServicesPlaySystemSound(1026)
//                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//            }
//        }
//    }
//    
//    
//}
//    
//
//
//struct ViewHome_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewHome()
//    }
//}

