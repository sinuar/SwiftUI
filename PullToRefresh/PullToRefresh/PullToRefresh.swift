//

import Foundation

enum AnimationState: Int {
  case idle = 0,
       pulling,
       ongoing
}

struct PullToRefresh: Equatable {

  var progress: Double
  var state: AnimationState
}
