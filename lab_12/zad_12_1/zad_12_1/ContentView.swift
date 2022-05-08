//
//  ContentView.swift
//  zad_12_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Dog.name, ascending: true)], animation: .default)
    private var dogs: FetchedResults<Dog>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Breed.name, ascending: true)], animation: .default)
    private var breeds: FetchedResults<Breed>
    
    @State private var name: String = ""
    @State private var birthYear: String = ""
    @State private var selectedBreed: Breed?
    
    var body: some View {
        VStack {
            Text("Dogs")
            Group {
                HStack {
                    Text("Dog name")
                    TextField("name", text: $name)
                }.padding(.top)
                HStack {
                    Text("Dog birth year")
                    TextField("year", text: $birthYear)
                }
                Picker(selection: $selectedBreed, label: Text("Choose breed")) {
                    ForEach(breeds, id: \.self) { (breed: Breed) in
                        Text(breed.name!).tag(breed as Breed?)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Button(action: addDog) {
                    Text("Add new dog")
                }
                
                if (breeds.count == 0) {
                    Button(action: addBreeds) {
                        Text("Add breeds")
                    }
                }
            }.padding(.horizontal).padding(.bottom)
            
            List {
                ForEach(breeds, id: \.self) { breed in
                    Section(header: Text(breed.name!)) {
                        ForEach(breed.dogArray, id: \.self) { dog in
                            Text("\(dog.name!) - born in \(dog.birthYear)")
                        }.onDelete(perform: self.deleteDog)
                    }
                }
            }
        }
    }
    
    private func addDog() {
        let dog = Dog(context: viewContext)
        dog.name = name
        dog.birthYear = Int16(birthYear)!
        dog.breed = selectedBreed
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteDog(offsets: IndexSet) {
        withAnimation {
            offsets.map { dogs[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func addBreeds() {
        var breed = Breed(context: viewContext)
        breed.name = "German Shepherd"
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        breed = Breed(context: viewContext)
        breed.name = "Husky"
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
