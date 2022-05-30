//
//  DreamSignView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 25/05/22.
//

import SwiftUI

struct DreamSignView : View {
    @GestureState var scale: CGFloat = 1.0
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DreamElement.text, ascending: true)],
        animation: .default)
    private var dreams: FetchedResults<DreamElement>
    
    
    @State private var showModal = false
    
    @State private var showNoFilter = true
    @State private var showFilter = false
    
    @State private var filteredCategory: Category = person
    
    @State private var showButtons = false
    
    
    
    let darkBlue = Color(red: 0.11, green: 0.11, blue: 0.39)
    let bubbleColor = Color (red: 0.65, green: 1.05, blue: 2.25)
    var body: some View {
        
//        VStack {
            ZStack {
                if showFilter == false && showNoFilter == true{
                    ForEach (dreams) { bubble in
                        
                        SingleBubbleView(bubble: bubble)
                        
                            .blendMode(.colorDodge) // The bottom circle is lightened by an amount determined by the top layer
                            .animation (Animation.spring (dampingFraction: 0.5)
                                .repeatForever()
                                .speed (.random(in: 0.05...0.4))
                                .delay(.random (in: 0...1)), value: scale)
                            .onShake {
                                
                                print("Device shaken")
                            }
                    }
                    
                }
                if showFilter == true && showNoFilter == false {
                    FilteredView(filter: filteredCategory)
                }
                VStack {
                    HStack {
                        VStack{
                            Button {
                                if showButtons == false{
                                    showButtons = true
                                } else {
                                    showButtons = false
                                    showNoFilter = true
                                    showFilter = false
                                }
                                
                            } label: {
                                Image(systemName: "flag.fill")
                                    .foregroundColor(.white)
                            }
                            if showButtons == true{
                                ForEach(categories, id:\.self){ category in
                                    Button {
                                        if showNoFilter == true{
                                            showFilter = true
                                            showNoFilter = false
                                            filteredCategory = category
                                        } else if showNoFilter == false{
                                            showFilter = false
                                            showFilter = true
                                            filteredCategory = category
                                        }
                                    } label: {
                                        Image(systemName: "\(category.icon)")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 30)
                        .padding(.top, 45)
                        Spacer()
                        Button(action: {
                            self.showModal.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        })
                        .sheet(isPresented: $showModal){
                            ModalAddDream(showModal: $showModal)
                        }
                        .padding(.trailing, 30)
                        .padding(.top, 45)
                    }
                    Spacer()
                }
                .scaleEffect(scale)
                        .gesture(MagnificationGesture()
                            .updating($scale, body: { (value, scale, trans) in
                                scale = value.magnitude
                            })
                    )
            }
            
            .drawingGroup(opaque: false, colorMode: .linear)
        
            .background(
                Rectangle()
                    .foregroundColor(darkBlue))
            
            .ignoresSafeArea()
            
//        }
      
    }
    
    
}

//struct DreamSignView_Previews: PreviewProvider {
//    static var previews: some View {
//        DreamSignView()
//    }
//}
