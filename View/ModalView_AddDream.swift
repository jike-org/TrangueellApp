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
//    @State var createdDream1: DreamElement = DreamElement()
//    @State var createdDream2: DreamElement = DreamElement()
//    @State var createdDream3: DreamElement = DreamElement()
//    @State var createdDream4: DreamElement = DreamElement()
//    @State var createdDream5: DreamElement = DreamElement()




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
//                            createdDream5 = addDreamElement()
                        }
                        if showView4 == false && showView3 == true{
                            showView4 = true
//                            createdDream4 = addDreamElement()
                        }
                        if showView3 == false && showView2 == true{
                            showView3 = true
//                            createdDream3 = addDreamElement()
                        }
                        if showView2 == false && showView1 == true{
                            showView2 = true
//                            createdDream2 = addDreamElement()
                        }
                        if showView1 == false{
                            showView1 = true
//                            createdDream1 = addDreamElement()
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

//                Button("Add dream") {
//                    addItem()
//                    self.showModal.toggle()
//                }.frame(width: UIScreen.main.bounds.width/2 , height: 50)
//                .background(text.isEmpty || text_desc.isEmpty ? .gray : .blue)
//                .foregroundColor(.black)
//                .cornerRadius(20)
//                .disabled(text.isEmpty || text_desc.isEmpty)
//
//            Spacer()
        }
    }
    
//    private func addDreamElement() -> DreamElement{
//        withAnimation {
//            let newDreamElement = DreamElement(context: viewContext)
//            newDreamElement.category = selectedCategory.name
//            newDreamElement.text = text_field
//            newDreamElement.date = Calendar.current.date(from: DateComponents())
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//            return newDreamElement
//        }
//    }
}


