//
//  ContentView.swift
//  Dependency Injections Exmp
//
//  Created by Sinuar on 11/03/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: EXAMPLES OF DEPENDENCY INJECTION
    // Example 1:

    class Stereo {
       func volume() {
         print("Adjusting volume...")
       }
    }

    class Car {
      var stereo: Stereo

      init(stereo: Stereo) {
        self.stereo = stereo
      }

      func adjustVolume() {
        stereo.volume()
      }
    }

    let car = Car(stereo: Stereo())
    
    car.adjustVolume()

    /*
    // Example 2:

    class Stereo{
       func volume(){
         print("Adjusting volume...")
       }
    }

    class Car{
      var stereo: Stereo?

      func adjustVolume(){
        stereo?.volume()
      }
      // this method can be called without injecting Stereo
      func someOtherFunction(){
        print("Calling some other function...")
      }
    }

    let car = Car()
    car.stereo = Stereo()
    car.adjustVolume()

    */
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
