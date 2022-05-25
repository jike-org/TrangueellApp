//
//  ModalSetting1.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 10/05/22.
//

import SwiftUI

struct ModalAddDream: View {
    
    
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var showModal: Bool
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DreamElement.text, ascending: true)],
        animation: .default)
    
    private var dreams: FetchedResults<DreamElement>
        
    @State var disabled_button : Bool = true
    
    let dateFormatter = DateFormatter()
    
    @State var showView1 = false
    @State var showView2 = false
    @State var showView3 = false
    @State var showView4 = false
    @State var showView5 = false
    
    @State var selectedCategory: Category = person

    var body: some View {
        VStack {
            Text("Add your Dream Element")
                .padding()
            HStack{
                Spacer()
                ForEach(categories, id: \.self) { category in
                    Button {
                        selectedCategory = category
                        if showView5 == false && showView4 == true{
                            showView5 = true
                        }
                        if showView4 == false && showView3 == true{
                            showView4 = true
                        }
                        if showView3 == false && showView2 == true{
                            showView3 = true
                        }
                        if showView2 == false && showView1 == true{
                            showView2 = true
                        }
                        if showView1 == false{
                            showView1 = true
                        }

                    } label: {
                        Image(systemName: category.icon)
                            .foregroundColor(.black)
                            .padding(1)
                    }
                }
                Spacer()
            }
            if showView1 {
                DreamCard(category: selectedCategory)
                    .padding()
            }
            if showView2 {
                DreamCard(category: selectedCategory)
                    .padding()
            }
            if showView3 {
                DreamCard(category: selectedCategory)
                    .padding()
            }
            if showView4 {
                DreamCard(category: selectedCategory)
                    .padding()
            }
            if showView5 {
                DreamCard(category: selectedCategory)
                    .padding()
            }
            Spacer()
        }
    }
}


