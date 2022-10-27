///
/// Created by Zheng Kanyan on 2022/10/25.
/// 
///

import Foundation

public class GoTimer {
    private let timeProvider: Timer.Type
    private let timeUpdated: () -> Void
    private var timer: Timer?
    
    public init(timeProvider: Timer.Type = Timer.self, timeUpdated: @escaping () -> Void) {
        self.timeProvider = timeProvider
        self.timeUpdated = timeUpdated
    }
    
    public func fire() {
        if let timer = timer {
            timer.fire()
        } else {
            timer = timeProvider.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.timeUpdated()
            }
        }
    }
    
    public func invalidate() {
        timer?.invalidate()
    }
}
