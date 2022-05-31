//
//  DreamSignView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 25/05/22.
//

import SwiftUI

struct DreamSignView : View {
    @State var isDIEmpty = false
    @GestureState var scale: CGFloat = 1.0
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DreamElement.text, ascending: true)],
        animation: .default)
    private var dreams: FetchedResults<DreamElement>
    
    @State private var showModal = false
    @State private var showInfo = false
    @State private var showDreamInspiration = false
    
    @State private var showNoFilter = true
    @State private var showFilter = false
    
    @State private var filteredCategory: Category = person
    
    @State private var showButtons = false
    
    let darkBlue = Color(red: 0.11, green: 0.11, blue: 0.39)
    let bubbleColor = Color (red: 0.65, green: 1.05, blue: 2.25)
    
    var body: some View {
        
        ZStack {
            if showFilter == false && showNoFilter == true{
                ForEach (dreams) { bubble in
                    
                    SingleBubbleView(bubble: bubble)
                    
                        .blendMode(.colorDodge) // The bottom circle is lightened by an amount determined by the top layer
                        .animation (Animation.spring (dampingFraction: 0.5)
                            .repeatForever()
                            .speed (1)
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
                VStack{
                    HStack {
                        Button {
                            if showButtons == false{
                                showButtons = true
                            } else {
                                showButtons = false
                                showNoFilter = true
                                showFilter = false
                            }
                        } label: {
                            Image("filterIcon")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                        .padding(.top, 45)
                        .padding(.leading, 30)
                        
                        Spacer()
                        Group {
                            Button(action: {
                                self.showInfo.toggle()
                            }, label: {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                            })
                            .sheet(isPresented: $showInfo) {
                                ZStack {
                                    ModalViewInfo(showInfo: $showInfo)
                                    VStack {
                                        Capsule()
                                            .fill(Color.white)
                                            .frame(width: 134, height: 3)
                                            .padding(10)
                                        Spacer()
                                    }
                                }
                            }
                            
                            Button(action: {
                                self.showModal.toggle()
                            }, label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                            })
                            .sheet(isPresented: $showModal){
                                ZStack {
                                    ModalAddDream(showModal: $showModal)
                                    VStack {
                                        Capsule()
                                            .fill(Color.white)
                                            .frame(width: 134, height: 3)
                                            .padding(10)
                                        Spacer()
                                    }
                                }
                            }
                            .padding(.leading, 10)
                            .padding(.trailing, 30)
                        }
                        .padding(.top, 45)
                    }
                    if showButtons == true{
                        
                        ForEach(categories, id:\.self){ category in
                            HStack {
                                
                                //                                    Rectangle()
                                //                                        .frame(width: 3, height: 40)
                                //                                        .foregroundColor(Color.filterLine)
                                //                                        .padding(.leading, 30)
                                
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
                                    Image(category.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .foregroundColor(.white)
                                        .padding(.leading, 33)
                                }
                                Spacer()
                            }
                        }
                        .drawingGroup(opaque: false, colorMode: .linear)
                    }
                }
                Spacer()
            }
            VStack {
                Spacer()
                
                Button {
                    isDIEmpty.toggle()
                    showDreamInspiration.toggle()
                } label : {
                    if isDIEmpty == false {
                    Image("DSCreationBoxEmpty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 76, height: 91.56, alignment: .center)
                        .padding(.bottom, 100)
                    } else {
                        Image("DSCreationBoxFull")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76, height: 91.56, alignment: .center)
                            .padding(.bottom, 100)
                    }
                }.sheet(isPresented: $showDreamInspiration){
                    ZStack {
                        BackgroundView()
                        ModalDreamInspiration(showDreamInspiration: $showDreamInspiration)
                        VStack {
                            Capsule()
                                .fill(Color.white)
                                .frame(width: 134, height: 3)
                                .padding(10)
                            Spacer()
                        }
                    }
                }
            }
            
        }
        .background(BackgroundView())
        .ignoresSafeArea()
    }
}

