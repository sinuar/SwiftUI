//

import SwiftUI

struct ScrollViewGeometryReader: View {
    // 1
    @Binding var pullToRefresh: PullToRefresh

    // 2
    let update: () async -> Void

    // 3
    @State private var startOffset: CGFloat = 0

    
    var body: some View {
        GeometryReader<Color> { proxy in // 1
            Task { calculateOffset(from: proxy) }
          return Color.clear // 2
        }
        .task { // 3
          await update()
        }

    }
    private func calculateOffset(from proxy: GeometryProxy) {
      let currentOffset = proxy.frame(in: .global).minY
        switch pullToRefresh.state {
        case .idle:
          startOffset = currentOffset // 1
          pullToRefresh.state = .pulling // 2

        case .pulling where pullToRefresh.progress < 1: // 3
          pullToRefresh.progress = min(1, (currentOffset - startOffset) / Constants.maxOffset)

        case .pulling: // 4
          pullToRefresh.state = .ongoing
          pullToRefresh.progress = 0
          Task {
            await update() // 5
            pullToRefresh.state = .idle
          }

        default: return
        }
    }
}

