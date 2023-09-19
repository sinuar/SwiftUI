//
//  ContentView.swift
//  CustomAlignmentTime
//
//  Created by Sinuhé Ruedas on 30/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = Date()
    
    var body: some View {
        VStack(alignment: .customCenter) {
            Text("Etiqueta de Timer")
                .font(.title)
            Text("Otra cosa aquí")
                .font(.title3)
            Text("Tiempo")
                .font(.body)
            
            HStack(spacing: 16) {
                Text(counter.formatted(.iso8601
                    .time(includingFractionalSeconds: true)))
                .font(Font.system(.body, design: .monospaced))
                //              .alignmentGuide(.customCenter) { context in
                //                  context.width / 4
                //              }
                Button(role: .destructive) {
                    counter = Date()
                } label: {
                    Image(systemName: "gobackward")
                        .imageScale(.large)
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct CustomCenter: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context[HorizontalAlignment.center]
    }
}

extension HorizontalAlignment {
    static let customCenter: HorizontalAlignment = .init(CustomCenter.self)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
