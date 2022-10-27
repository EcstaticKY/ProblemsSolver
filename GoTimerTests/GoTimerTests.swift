///
/// Created by Zheng Kanyan on 2022/10/24.
///
///

import XCTest
import GoTimer

final class GoTimerTests: XCTestCase {
    
    override func setUp() {
        MockTimer.currentTimers = [MockTimer]()
    }

    func test_fire_shouldCallTimeUpdatedBlockWhenTimerTicking() {
        let exp = expectation(description: "Wait for time updated")
        exp.expectedFulfillmentCount = 2
        let sut = GoTimer(timeProvider: MockTimer.self) {
            exp.fulfill()
        }

        sut.fire()
        MockTimer.tick()
        MockTimer.tick()

        wait(for: [exp], timeout: 1.0)
    }
    
    func test_fireAndInvalidate_callsRealTimerCorrectMethods() {
        
        let sut = GoTimer(timeProvider: MockTimer.self) { }
        
        sut.fire()
        XCTAssertEqual(MockTimer.currentTimers[0].messages, [.fire])
        
        sut.invalidate()
        XCTAssertEqual(MockTimer.currentTimers[0].messages, [.fire, .invalidate])
    }
    
    func test_twoTimers_wouldNotInterfereEachOther() {
        let sut0 = GoTimer(timeProvider: MockTimer.self) { }
        sut0.fire()
        let sut1 = GoTimer(timeProvider: MockTimer.self) { }
        sut1.fire()
        
        XCTAssertEqual(MockTimer.currentTimers[0].messages, [.fire])
        XCTAssertEqual(MockTimer.currentTimers[1].messages, [.fire])
        
        sut1.invalidate()
        XCTAssertEqual(MockTimer.currentTimers[1].messages, [.fire, .invalidate])
        XCTAssertEqual(MockTimer.currentTimers[0].messages, [.fire])
        
        sut0.invalidate()
        XCTAssertEqual(MockTimer.currentTimers[0].messages, [.fire, .invalidate])
        XCTAssertEqual(MockTimer.currentTimers[1].messages, [.fire, .invalidate])
    }
    
    func test_twoTimers_shouldCallCorrectTimeUpdatedBlockWhenTimerTicking() {
        let exp = expectation(description: "Wait for time updated")
        exp.expectedFulfillmentCount = 2
        let sut1 = GoTimer(timeProvider: MockTimer.self) {
            exp.fulfill()
        }
        
        let sut0 = GoTimer(timeProvider: MockTimer.self) {
            XCTFail("Should not tick on this timer")
        }

        sut0.fire()
        sut1.fire()
        MockTimer.tick(at: 1)
        MockTimer.tick(at: 1)

        wait(for: [exp], timeout: 1.0)
    }
    
    // MARK: -- Helpers
    
    private class MockTimer: Timer {
        
        enum Message {
            case fire
            case invalidate
        }
        
        var block: ((Timer) -> Void)!
        var messages: [Message]!
        
        static var currentTimers = [MockTimer]()
        
        override class func scheduledTimer(withTimeInterval interval: TimeInterval,
                                           repeats: Bool,
                                           block: @escaping (Timer) -> Void) -> Timer {
            let mockTimer = MockTimer()
            mockTimer.block = block
            
            /** Timer is bridged objective-c NSObject kind class, so it's initialization have to follow objective-c rules, and in that world only primitive type properties got default values, array is not primitive for objective-c, so skipped, thus corresponding property was uninitialised - accessing not initialised property in run-time result in crash.
             from: https://stackoverflow.com/questions/41755791/how-can-i-unit-test-swift-timer-controller
             */
            mockTimer.messages = [.fire]
            MockTimer.currentTimers.append(mockTimer)
            
            return mockTimer
        }
        
        static func tick(at index: Int = 0) {
            currentTimers[index].block(currentTimers[index])
        }
        
        override func fire() {
            messages.append(.fire)
        }
        
        override func invalidate() {
            messages.append(.invalidate)
        }
    }
}
