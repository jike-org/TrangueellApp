//
//  ModalViewMorning.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 25/05/22.
//

import SwiftUI

struct ModalViewNight : View {

    @Binding var is_Sound : Bool
    @Binding var is_Vibrate : Bool
    @Binding var values_slider: Double
    
    @AppStorage("SOUND_BOOL") var isSound : Bool = Bool()
    @AppStorage("VIBRATE_BOOL") var isVibrate : Bool = Bool()
    @AppStorage("SLIDER_VALUES") var sliderValues : Double = Double()

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
                    .onChange(of: is_Sound) { newValue in
                        isSound = is_Sound
                    }
                    .onAppear(){
                        is_Sound = isSound
                    }
            Toggle("Vibration", isOn: $is_Vibrate)
                    .onChange(of: is_Vibrate) { newValue in
                        isVibrate = is_Vibrate
                    }
                    .onAppear(){
                        is_Vibrate = isVibrate
                    }
            
            Text("Input frequency")
                .foregroundColor(.black)
            
            Slider(value: $values_slider, in: 0...30)
                    .onChange(of: values_slider) { newValue in
                        sliderValues = values_slider
                    }
                    .onAppear(){
                        values_slider = sliderValues
                    }
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
