//
//  SquareView.swift
//  zad_5_1
//
//  Created by Rafał Kuźmiczuk on 24/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct SquareView: View {
    var color: Color
    var number: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.black)
                .font(.system(size: 50, weight: .bold))
        }
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(color: .blue, number: 2)
    }
}
