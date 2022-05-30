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
    
    @State var is_Sound : Bool = false
    @State var is_Vibrate : Bool = false
    
    @State var values_slider: Double = 0.0
    @State var frequency_slider: Double = 0.0
    
    @State var ButtonDisabled: Bool = false
    
    let timer1 = ["8:00", "10:00"]
    let timer2 = ["20:00", "22:00"]
    
    @State var selectedTime1 = "8:00"
    @State var selectedTime2 = "20:00"


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
                Color.black
                //                .clipShape(LiquidSwipe(offset: offset))
                    .ignoresSafeArea()
                    .overlay(
                        ZStack{
                            
                                                Rectangle()
                           
                                .frame(width: 100, height: 50)
                                .foregroundColor(.red)
                                .cornerRadius(20)
                            Image(systemName: "sun.max")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.trailing, 30)
                                .frame(width: 50, height: 50)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        let screen = UIScreen.main.bounds
                                        offset.width = -screen.height
                                        if -offset.width > screen.width / 2 {
                                            offset.width = -screen.height - 300
                                        }
                                        showHome.toggle()
                                    }
                                    is_Moon = true
                                    is_Sun = true
                                }
                                .disabled(ButtonDisabled)
                        }
                            .offset(x: 20, y: 80)
                            .opacity(offset == .zero ? 1 : 0), alignment: .topTrailing
                        
                    )
                
                VStack(spacing: 60.0){
                    Text("Morning Reality Check")
                        .foregroundColor(.white)
                    Spacer()

                        Circle()
                        .stroke(.white)
                        .overlay(
                            VStack(spacing: 5.0){
                                Button {
                                    
                                } label: {
                                    ZStack{
                                        Circle()
                                            .foregroundColor(.blue)
                                            .frame(width: 75, height: 75)
                                        Text("Hello")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.bottom, 50)
           
                                }
                                Spacer()
                                
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 150, height: 150)
                                    .padding(.bottom, 30)
                                    
                                
                                Spacer()
                                HStack(spacing: 150.0){
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        ZStack{
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 75, height: 75)
                                            Text("Hello")
                                                .foregroundColor(.white)
                                        }
                                    }
                                    
                                                                        
                                    Button {
                                        
                                    } label: {
                                        ZStack{
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 75, height: 75)
                                            Text("Hello")
                                                .foregroundColor(.white)
                                        }
                                    }
                                    Spacer()
                                    
                                }

                            }
                        )
                    
                            //insert card per bolla
//                            TechniqueView(isPresentedFullScreenCover: $isPresentedFullScreenCover)
//                                .fullScreenCover(isPresented: $isPresentedFullScreenCover) {
//                                    FullScreenModalView()
//                                }
                            
//                        }.padding(.vertical, 40)
                        
                    
                    Spacer()
                }.padding(.horizontal, 20)
                .toolbar {
                    ToolbarItem {
                        Button {
                            self.showModal_settings.toggle()
                        } label: {
                            Label("Add Item", systemImage: "gear")
                                .foregroundColor(.white)
                        }.sheet(isPresented: $showModal_settings){
                            if is_Moon {
                                ModalViewNight(is_Sound: $is_Sound, is_Vibrate: $is_Vibrate, values_slider: $values_slider)
                            }
                            else if is_Sun {
                                HalfSheet{
                                    ZStack{
                                        Color.black
                                            .ignoresSafeArea()
                                        VStack {
                                            Capsule()
                                                .fill(Color.white)
                                                .frame(width: 50, height: 3)
                                                .padding(10)

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
                if showHome {
                    RealityView2(is_Moon: $is_Moon, is_Sun: $is_Sun)
                }
            }
            
            
            //                Color.black
            //                    .clipShape(LiquidSwipe(offset: offset))
            //                    .ignoresSafeArea()
            //                    .overlay(
            //                        Image(systemName: "moon")
            //                            .font(.largeTitle)
            //                            .foregroundColor(.black)
            //                            .frame(width: 50, height: 50)
            //                            .contentShape(Rectangle())
            //                            .onTapGesture {
            //                                withAnimation(.spring()) {
            //                                    let screen = UIScreen.main.bounds
            //                                    offset.width = -screen.height
            //                                    if -offset.width > screen.width / 2 {
            //                                        offset.width = -screen.height - 300
            //                                    }
            //                                    showHome.toggle()
            //                                }
            //                            }
            //                       .offset(x: 10, y: 80)
            //                            .opacity(offset == .zero ? 1 : 0), alignment: .topLeading
            //
            //                    )
            
            
            //                Text("ciaoooo")
            //                    .foregroundColor(.red)
            //                    .onTapGesture {
            //                        withAnimation(.spring()) {
            //                            offset = .zero
            //                            showHome.toggle()
            //                        }
            //                    }
            
        }.navigationBarHidden(true)
        
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


struct RealityView_Previews: PreviewProvider {
    static var previews: some View {
        RealityView()
    }
}






















//import SwiftUI
//
//struct RealityView: View {
//
//    @State var currentTab = "☀️"
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
//            Text("☀️")
//                .fontWeight(.bold)
//                .padding(.vertical, 12)
//                .padding(.horizontal, 25)
//                .background(
//                    ZStack{
//                        if currentTab == "☀️" {
//                            Color.blue.opacity(0.7)
//                                .cornerRadius(10)
//                                .matchedGeometryEffect(id: "TAB", in: animation)
//                        }
//                    }
//                )
//                .foregroundColor(currentTab == "☀️" ? .blue : .white)
//                .onTapGesture {
//                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
//                        currentTab = "☀️"
//                    }
//                }
//
//            Text("🌙")
//                .fontWeight(.bold)
//                .padding(.vertical, 12)
//                .padding(.horizontal, 25)
//                .background(
//                    ZStack{
//                        if currentTab == "🌙" {
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
//                .foregroundColor(currentTab == "🌙" ? .black : .white)
//                .onTapGesture {
//                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
//                        currentTab = "🌙"
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
