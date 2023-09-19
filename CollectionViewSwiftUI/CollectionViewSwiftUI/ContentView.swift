//
//  ContentView.swift
//  CollectionViewSwiftUI
//
//  Created by Sinuhé Ruedas on 31/08/23.
//

import SwiftUI

struct DataModel: Identifiable {
    let id: String
    let name: String
    let imageName: String
}

struct ContentView: View {
    
    let data: [DataModel] = [
        .init(id: "0", name: "Leon Felipe", imageName: ""),
        .init(id: "1", name: "Maria Lince", imageName: ""),
        .init(id: "2", name: "Juan Rosas", imageName: ""),
        .init(id: "3", name: "Cees Hamelink", imageName: "Cees Hamelink")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data) { items in
                    ForEach(0..<1) { item in
                        CollectionView(data: items)
                        Text("Aquí")
                    }
                }
            }.navigationBarTitle("Collection View")
        }
    }
}

struct CollectionView: View {
    let data: DataModel
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<1) { items in
                    Spacer()
                    Image(self.data.imageName)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.green)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    Spacer()
                    Text(self.data.name)
                }.padding(.bottom, 16)
            }.background(Color.blue)
            
            HStack {
                Spacer()
                Text(self.data.name)
                Spacer()
                Text(self.data.name)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
