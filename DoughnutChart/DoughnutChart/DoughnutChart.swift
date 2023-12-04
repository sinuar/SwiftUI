//
//  ContentView.swift
//  DoughnutChart
//
//  Created by Sinuhé Ruedas on 16/10/23.
//

import SwiftUI

struct DoughnutSliceView: View {
    var doughnutSliceData: DoughnutSliceData
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                    let center = CGPoint(x: width * 0.5, y: height * 0.5)
                    
                    path.move(to: center)
                    path.addArc(center: center,
                                radius: width * 0.5,
                                startAngle: Angle(degrees: -90.0) + doughnutSliceData.startAngle,
                                endAngle: Angle(degrees: -90.0) + doughnutSliceData.endAngle,
                                clockwise: false)
                }
                .fill(doughnutSliceData.color)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct DoughnutSliceData: View {
    var startAngle: Angle
    var endAngle: Angle
    var text: String
    var color: Color
    
}


struct DoughnutSliceView_Previews: PreviewProvider {
    static var previews: some View {
        DoughnutSliceView(doughnutSliceData: DoughnutSliceData(
            startAngle: Angle(degrees: 0.0),
            endAngle: Angle(degrees: 220.0),
            text: "65%",
            color: Color.gray))
    }
}
