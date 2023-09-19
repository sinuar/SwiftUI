//
//  ContentView.swift
//  Custom Alignment
//
//  Created by Sinuhé Ruedas on 30/08/23.
//

import SwiftUI

struct AlignmentContentView: View {
    @State private var techStack = ["Uno", "Cuatro", "Quince", "Veintitantos"]
    
    var body: some View {
        GeometryReader { geo in
            self.generateContent(in: geo)
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.techStack, id: \.self) { item in
                self.item(for: item)
                    .padding(.all, 6)
                    .alignmentGuide(.customCenter) { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == self.techStack.last! {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { d in
                        let result = height
                        if item == self.techStack.last! {
                            height = 0
                        }
                        return result
                    }
            }
        }
    }
    
    func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 8)
            .font(.body)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(5)
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
