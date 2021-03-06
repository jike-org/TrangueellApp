//
//  RealityView.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 23/05/22.
//


import SwiftUI
import AVFoundation
import Foundation

struct RealityView: View {
    
    @State var is_Loop : Bool = false
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    @State var totalRotation = CGSize.zero
    @State var currentRotation = CGSize.zero
    
    //liquid swipe
    @State var offset : CGSize = .zero
    @State var showHome = false
    @State var showModal_settings : Bool = false
    
    @State var isPresentedFullScreenCover : Bool = false
    
    @State var is_Sun : Bool = true
    @State var is_Moon : Bool = false
    
    @State var is_Morning : Int = 0
    
    @State var is_Sound : Bool = false
    @State var is_Vibrate : Bool = false
    
    @State var values_slider: Double = 0.0
    @State var frequency_slider: Double = 0.0
    
    @State var ButtonDisabled: Bool = false
    
    let timer1 = ["8:00", "10:00"]
    let timer2 = ["20:00", "22:00"]
    
    @State var selectedTime1 = "8:00"
    @State var selectedTime2 = "20:00"
    
    @State var selectedTechnique: Technique = mirror
    @State var technique1: Technique = finger
    @State var technique2: Technique = phrase
    @State var technique3: Technique = switchT
    @State var technique4: Technique = mirror
    
    @State var currentTab = "Day"
    
    @Namespace var animation
    
    let data = Array(1...4).map { "Item \($0)" }
    let layout = [
        GridItem(.flexible(minimum: 2)),
        GridItem(.flexible(minimum: 2))
    ]
    
    @AppStorage("FREQUENCY_VALUES") var frequencySlider: Double = Double()
    @AppStorage("FROM_VALUE") var selectedFrom: String = String()
    @AppStorage("TO_VALUE") var selectedTo: String = String()
    
    
    var body: some View {
        NavigationView{
            ZStack{
                
                Color.black.opacity(0.8)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.7), .black]), startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
                
                VStack(spacing: 60.0){
                    if is_Morning == 0 {
                        Text("Morning Reality Check")
                            .foregroundColor(.white)
                            .bold()
                    }else{
                        Text("Night Reality Check")
                            .foregroundColor(.white)
                            .bold()
                    }
                    HStack{
                        Spacer()
                        Button {
                            self.is_Morning = 0
                        } label: {
                            Group{
                                HStack{
                                    Image(systemName: "sun.max.fill")
                                        .foregroundColor(.white)
                                        .zIndex(1.0)
                                    Text("Day")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 2)
                                }
                                .background(
                                    ZStack{
                                        if currentTab == "Day"{
                                            Color.black
                                                .opacity(0.7)
                                                .cornerRadius(10)
                                                .matchedGeometryEffect(id: "TAB", in: animation)
                                                .frame(width: 160)
                                        }
                                    }
                                )
                                .onTapGesture {
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                                        currentTab = "Day"
                                        self.is_Morning = 0
                                    }
                                }
                                Spacer()
                                Spacer()
                            }
                        }
                        .disabled(ButtonDisabled)
                        
                        Button {
                            self.is_Morning = 1
                        } label: {
                            Group{
                                HStack{
                                    Image(systemName: "moon.stars")
                                        .foregroundColor(.white)
                                        .zIndex(1.0)
                                    Text("Night")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 2)
                                }
                                .background(
                                    ZStack{
                                        if currentTab == "Night"{
                                            Color.black
                                                .opacity(0.7)
                                                .cornerRadius(10)
                                                .matchedGeometryEffect(id: "TAB", in: animation)
                                                .frame(width: 190)
                                        }
                                    }
                                )
                                .onTapGesture {
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                                        currentTab = "Night"
                                        self.is_Morning = 1
                                    }
                                }
                            }
                        }
                        .disabled(ButtonDisabled)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 30)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(10)
                    
                    if is_Morning == 0 {
                        VStack(spacing: 60.0){
                            Circle()
                                .stroke(.white.opacity(0.3))
                                .overlay(
                                    VStack(spacing: 5.0){
                                        Button {
                                            selectedTechnique = technique1
                                            technique1 = technique4
                                            technique4 = selectedTechnique
                                        } label: {
                                            ZStack{
                                                Image("bubble")
                                                    .resizable()
                                                    .frame(width: 75, height: 75)
                                                Text("\(technique1.title)")
                                                    .foregroundColor(.white)
                                            }
                                            .padding(.bottom, 50)
                                        }
                                        Spacer()
                                        
                                        ZStack{
                                            Image("bubble")
                                                .resizable()
                                                .frame(width: 150, height: 150)
                                            Text("\(selectedTechnique.title)")
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                        HStack(spacing: 150.0){
                                            Spacer()
                                            Button {
                                                selectedTechnique = technique2
                                                technique2 = technique4
                                                technique4 = selectedTechnique
                                            } label: {
                                                ZStack{
                                                    Image("bubble")
                                                        .resizable()
                                                        .frame(width: 75, height: 75)
                                                    Text("\(technique2.title)")
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            Button {
                                                selectedTechnique = technique3
                                                technique3 = technique4
                                                technique4 = selectedTechnique
                                            } label: {
                                                ZStack{
                                                    Image("bubble")
                                                        .resizable()
                                                        .frame(width: 75, height: 75)
                                                    Text("\(technique3.title)")
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
                                )
                        }
                    }else{
                        TabView{
                            ForEach(data, id: \.self){ item in
                                Text("\(item)")
                                    .foregroundColor(.white)
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .never))
                        
                        Spacer()
                        NavigationLink("Start", destination: AreUDreamingView())
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .toolbar {
                    ToolbarItem{
                        Button {
                            self.showModal_settings.toggle()
                        } label: {
                            Label("AddItem", systemImage: "gear")
                                .foregroundColor(.white)
                        }
                        .sheet(isPresented: $showModal_settings) {
                            if is_Morning == 1 {
                                ModalViewNight(is_Sound: $is_Sound, is_Vibrate: $is_Vibrate, values_slider: $values_slider)
                            }else{
                                HalfSheet{
                                    ZStack{
                                        Color.black
                                            .ignoresSafeArea()
                                        VStack{
                                            Text("Reality Check Reminder")
                                                .foregroundColor(.white)
                                                .font(.title)
                                            HStack{
                                                VStack{
                                                    Text("From")
                                                        .foregroundColor(.white)
                                                    Picker("Time", selection: $selectedTime1){
                                                        ForEach(timer1, id: \.self){
                                                            Text($0)
                                                                .foregroundColor(.white)
                                                        }
                                                    }
                                                    .pickerStyle(.wheel)
                                                    .frame(width: 20, height: 20, alignment: .center)
                                                    .foregroundColor(.white)
                                                }
                                                .padding()
                                                Spacer()
                                                VStack{
                                                    Text("To")
                                                        .foregroundColor(.white)
                                                    Picker("Time", selection: $selectedTime2){
                                                        ForEach(timer2, id: \.self){
                                                            Text($0)
                                                                .foregroundColor(.white)
                                                        }
                                                    }
                                                    .pickerStyle(.wheel)
                                                    .frame(width: 20, height: 20, alignment: .center)
                                                    .foregroundColor(.white)
                                                }
                                                .padding()
                                            }
                                            Slider(value: $frequency_slider, in: 0...30)
                                            Spacer()
                                        }
                                    }
                                }
                                .background(.black)
                                .onAppear(){
                                    ButtonDisabled = true
                                    selectedTime1 = selectedFrom
                                    selectedTime2 = selectedTo
                                    frequency_slider = frequencySlider
                                }
                                .onDisappear(){
                                    ButtonDisabled = false
                                    selectedFrom = selectedTime1
                                    selectedTo = selectedTime2
                                    frequencySlider = frequency_slider
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .background(BackgroundView())
    }
}


struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
            Color.primary.edgesIgnoringSafeArea(.all)
            
            HStack{
                Spacer()
                VStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                    Spacer()
                }
            }
            
            Text("Ciao")
                .foregroundColor(.white)
            
        }
        
    }
}

struct NonModalButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIButton {
        
        // Create and Configure UIButton
        let button = UIButton(type: .custom)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 100, weight: .medium, scale: .default)
        let image = UIImage(systemName: "arrow.up.circle.fill", withConfiguration: imageConfiguration)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.label
        
        // Access the UIViewController that we have created in the Storyboard
        let storyboard = UIStoryboard(name: "Storyboard", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "vc")
        
        // Create and Add action
        let action = UIAction { _ in
            let sheet = viewController.sheetPresentationController
            sheet?.detents = [.medium(), .large()]
            sheet?.prefersGrabberVisible = true
            button.window?.rootViewController?.present(viewController, animated: true)
        }
        button.addAction(action, for: .touchUpInside)
        
        // Return Button
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        // no code needed for now
    }
    
}

struct LiquidSwipe : Shape {
    
    var offset : CGSize
    
    var animatableData: CGSize.AnimatableData{
        get{return offset.animatableData}
        set{offset.animatableData = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            
            //prima costruzione rettangolo
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0 ))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height ))
            
            let from = 80 + (offset.width)
            
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
            
            //ora costruiamo la forma la forma curva
            var to = 220 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            let mid : CGFloat = 120 + ((180 - 80) / 2)
            
            
            path.move(to: CGPoint(x: rect.width, y: from))
            
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y:  mid), control2: CGPoint(x: width - 50, y: mid))
        }
    }
}


//struct RealityView_Previews: PreviewProvider {
//    static var previews: some View {
//        RealityView()
//    }
//}






















//import SwiftUI
//
//struct RealityView: View {
//
//    @State var currentTab = "??????"
//    @Namespace var animation
//
//    @State var showModal : Bool = false
//
//    var body: some View {
//
//        NavigationView{
//        ZStack{
//            Color(.black)
//                .ignoresSafeArea()
//
//
//        HStack{
//            Text("??????")
//                .fontWeight(.bold)
//                .padding(.vertical, 12)
//                .padding(.horizontal, 25)
//                .background(
//                    ZStack{
//                        if currentTab == "??????" {
//                            Color.blue.opacity(0.7)
//                                .cornerRadius(10)
//                                .matchedGeometryEffect(id: "TAB", in: animation)
//                        }
//                    }
//                )
//                .foregroundColor(currentTab == "??????" ? .blue : .white)
//                .onTapGesture {
//                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
//                        currentTab = "??????"
//                    }
//                }
//
//            Text("????")
//                .fontWeight(.bold)
//                .padding(.vertical, 12)
//                .padding(.horizontal, 25)
//                .background(
//                    ZStack{
//                        if currentTab == "????" {
//                            ZStack{
//                                Color.blue
//                                    .opacity(0.3)
//                                    .cornerRadius(10)
//                                    .matchedGeometryEffect(id: "TAB", in: animation)
//                                Color.black
//                                    .opacity(0.7)
//                                    .cornerRadius(10)
//                                    .matchedGeometryEffect(id: "TAB", in: animation)
//                            }
//                        }
//                    }
//                )
//                .foregroundColor(currentTab == "????" ? .black : .white)
//                .onTapGesture {
//                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
//                        currentTab = "????"
//                    }
//                }
//        }
//        .padding(.vertical, 7)
//        .padding(.horizontal, 10)
//        .background(Color.white.opacity(0.3))
//        .cornerRadius(10)
//        }.toolbar {
//            ToolbarItem {
//                Button {
//                    self.showModal.toggle()
//                } label: {
//                    Label("Settings", systemImage: "gear")
//                        .foregroundColor(.white)
//                }.sheet(isPresented: $showModal){
//                    Text("ciao")
//                }
//            }
//        }
//        }
//
//        }
//
//}
