//
//  ContentView.swift
//  zad_1_2
//
//  Created by Rafał Kuźmiczuk on 28/02/2022.
//  Copyright © 2022 PL. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var input: String = ""
    @State var chosenDay: String = ""
    @State var showAlert = false
    let days: [String] = ["Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek", "Sobota", "Niedziela"]
    
    var body: some View {
        VStack (alignment: .center) {
            
            Text("Podaj wybrany dzień tygodnia")
                .foregroundColor(.purple)
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
            
            TextField("Wpisz dzień tygodnia", text: $input)
                .multilineTextAlignment(.center)
            
            Button(action: {
                if (self.days.contains(self.input)) {
                    self.chosenDay = self.input
                }
                else {
                    self.showAlert = true
                }
            }) {
                Text("Zatwierdź wybór")
                .background(Color.green)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Uwaga"),
                        message: Text("Wprowadzono błędną nazwę dnia")
                    )
                }
            }
            
            Text("Wybrano: \(chosenDay)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
