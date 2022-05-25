//
//  ModalViewMorning.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 25/05/22.
//

import SwiftUI

struct ModalViewMorning : View {

    @Binding var is_Sound : Bool
    @Binding var is_Vibrate : Bool
    
    @Binding var values_slider: Double 

    var body: some View {
        ZStack{
            Color.brown
                .ignoresSafeArea()
            VStack{
        
            Text("Reality check settings")
                .foregroundColor(.black)
                .bold()
            
            Text("Input (better with sound on)")
                .foregroundColor(.black)
            
            Toggle("Sound", isOn: $is_Sound)
            Toggle("Vibration", isOn: $is_Vibrate)
            
            Text("Input frequency")
                .foregroundColor(.black)
            
            Slider(value: $values_slider, in: 0...30)
            Text("Every \(values_slider) seconds")
            
            Divider()
                .padding(.horizontal, 30)
            
            Text("Output (after gesture)")
                .foregroundColor(.black)

            Spacer()
            }.padding(40)
        }
    }
}
