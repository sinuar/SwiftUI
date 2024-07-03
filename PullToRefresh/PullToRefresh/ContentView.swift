//
//  ContentView.swift
//  PullToRefresh
//
//  Created by Sinuhé Ruedas on 24/07/23.
//

import SwiftUI

struct ContentView: View {

    @State var pullToRefresh = PullToRefresh(progress: 0, state: .idle)
    @State var events: [Event] = []

    var body: some View {
        ScrollView {
            ScrollViewGeometryReader(pullToRefresh: $pullToRefresh) { // 1
                await update()
                print("Updated!")
            }
            ZStack(alignment: .top) {
                if pullToRefresh.state == .ongoing { // 2
                    ProgressView()
                }
                LazyVStack { // 3
                    ForEach(events) {
                        EventView(event: $0)
                    }
                }
                .offset(y: pullToRefresh.state == .ongoing ? Constants.maxOffset : 0) // 4
            }
        }
    }

    @MainActor
    func update() async {
        events = await fetchMoreEvents(toAppend: events)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
