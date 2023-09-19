//
//  ContentView.swift
//  ExampleCoordinatesGR
//
//  Created by Sinuhé Ruedas on 31/08/23.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            //Text("Left")
            GeometryReader { geo in
                Text("Cejdgsdfgdsfgsdf")
                    .coordinateSpace(name: "Custom")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Global center: \(geo.frame(in: .global).minY) x \(geo.frame(in: .global).maxY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).minX) x \(geo.frame(in: .named("Custom")).maxX)")
                        print("Local center: \(geo.frame(in: .local).minX) x \(geo.frame(in: .local).maxX)")
                        print("Local center: \(geo.frame(in: .local).minY) x \(geo.frame(in: .local).maxY)")
                    }
            }
            .background(.orange)
            //Text("Rightdfdfdggfhghghgfgdgfdgf")
        }
    }
}

struct ViewSizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct ViewGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewSizeKey.self, value: geometry.size)
        }
    }
}

struct ContentView: View {
    @State var fontSize: CGFloat = 12.0
    @State var textSize: CGSize = .zero
    
    var body: some View {
      Spacer()
        Text(String(format: "%.0f", textSize.width))
        Text("widdgdhgdfht:")
                    .font(.system(size: fontSize))
                    .background(ViewGeometry())
                    .onPreferenceChange(ViewSizeKey.self) {
                        textSize.width += $0.width
                    }
        Text("Second dfgdf dfg df ")
            .background(ViewGeometry())
            .onPreferenceChange(ViewSizeKey.self) {
                textSize.width += $0.width
            }
        Color(.black)
            .frame(width: 80, height: 16)
            .background(ViewGeometry())
            .onPreferenceChange(ViewSizeKey.self) {
                textSize.width += $0.width
            }
                Spacer()
                Text("Font size:" + "\(fontSize)")
                Slider(value: $fontSize, in: 20...40, step: 1)
                    .padding()
                Spacer()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
