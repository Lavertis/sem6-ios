
//
//  TriangleView.swift
//  zad_5_1
//
//  Created by Rafał Kuźmiczuk on 24/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI


struct TriangleView: View {
    var color: Color
    var number: Int
    
    var body: some View {
        ZStack {
            Triangle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.black)
                .font(.system(size: 50, weight: .bold))
        }
    }
}

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView(color: .green, number: 3)
    }
}
