//: [Previous](@previous)

//: For this page, make sure your build target is set to ParseSwift and targeting
//: `My Mac` or whatever the name of your mac is. Also be sure your `Playground Settings`
//: in the `File Inspector` is `Platform = macOS`. This is because
//: Keychain in iOS Playgrounds behaves differently. Every page in Playgrounds should
//: be set to build for `macOS` unless specified.

import PlaygroundSupport
import Foundation
import ParseSwift

PlaygroundPage.current.needsIndefiniteExecution = true

Task {
    do {
        try await initializeParse()
    } catch {
        assertionFailure("Error initializing Parse-Swift: \(error)")
    }
}

//: To track when the app has been opened, do the following.
ParseAnalytics.trackAppOpened { result in
    switch result {
    case .success:
        print("Saved analytics for app opened.")
    case .failure(let error):
        print(error)
    }
}

//: To track any event, do the following.
var friendEvent = ParseAnalytics(name: "openedFriendList")
friendEvent.track { result in
    switch result {
    case .success:
        print("Saved analytics for custom event.")
    case .failure(let error):
        print(error)
    }
}

//: You can also add dimensions to your analytics.
friendEvent.track(dimensions: ["more": "info"]) { result in
    switch result {
    case .success:
        print("Saved analytics for custom event with dimensions.")
    case .failure(let error):
        print(error)
    }
}

PlaygroundPage.current.finishExecution()
//: [Next](@next)
