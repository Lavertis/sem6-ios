//
//  ContentView.swift
//  zad_11_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var dbContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Car.brand, ascending: true)], animation: .default)
    private var cars: FetchedResults<Car>
    
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
        let car = Car(context: dbContext)
        car.brand = brand
        car.model = model
        car.productionYear = Int16(productionYear) ?? 0
        car.mileage = Int32(mileage) ?? 0
        car.price = Double(price) ?? 0
        
        do {
            try dbContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteCar(offsets: IndexSet) {
        withAnimation {
            offsets.map{ cars[$0] }.forEach(dbContext.delete)
            do {
                try dbContext.save()
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
