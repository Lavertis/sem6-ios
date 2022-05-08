//
//  ContentView.swift
//  zad_11_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Cars.brand, ascending: true)], animation: .default)
    private var cars: FetchedResults<Cars>
    
    @State private var brand: String = ""
    @State private var model: String = ""
    @State private var productionYear: String = ""
    @State private var mileage: String = ""
    @State private var price: String = ""
    
    var body: some View {
        VStack {
            Text("Cars")
            Form {
                HStack {
                    Text("Brand")
                    TextField("brand", text: $brand)
                }
                HStack {
                    Text("Model")
                    TextField("model", text: $model)
                }
                HStack {
                    Text("Production year")
                    TextField("production year", text: $productionYear)
                }
                HStack {
                    Text("Mileage")
                    TextField("mileage", text: $mileage)
                }
                HStack {
                    Text("Price")
                    TextField("price", text: $price)
                }
                
                Button(action: addCar) {
                    Text("Add new car")
                }.frame(maxWidth: .infinity, alignment: .center)
            }
            
            List {
                ForEach(cars, id: \.brand) { car in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Brand: \(car.brand!)")
                            Text("Model: \(car.model!)")
                            Text("Production year: \(String(car.productionYear))")
                            Text("Mileage: \(car.mileage)")
                            Text("Price: $\(String(format: "%.2lf", car.price))")
                        }
                    }
                }
                .onDelete(perform: deleteCar)
            }
        }
    }
    
    private func addCar() {
        let car = Cars(context: viewContext)
        car.brand = brand
        car.model = model
        car.productionYear = Int16(productionYear)!
        car.mileage = Int32(mileage)!
        car.price = Double(price)!
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteCar(offsets: IndexSet) {
        withAnimation {
            offsets.map{ cars[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
