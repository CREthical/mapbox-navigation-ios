import Foundation
import MapboxDirections
import MapboxCoreNavigation
import TestHelper
@testable import MapboxNavigation

class TestableDayStyle: DayStyle {
    required init() {
        super.init()
        mapStyleURL = Fixture.blankStyle
    }
}

class SpeechSynthesizerStub: SpeechSynthesizing {
    weak var delegate: SpeechSynthesizingDelegate?
    var muted: Bool = false
    var volume: Float = 1.0
    var isSpeaking: Bool = false
    var locale: Locale = Locale.autoupdatingCurrent
    
    func changedIncomingSpokenInstructions(_ instructions: [SpokenInstruction]) {
        // do nothing
    }
    
    func speak(_ instruction: SpokenInstruction, during legProgress: RouteLegProgress) {
        // do nothing
    }
    
    func stopSpeaking() {
        // do nothing
    }
    
    func interruptSpeaking() {
        // do nothing
    }
}

class RouteVoiceControllerStub: RouteVoiceController {
    override init(navigationService: NavigationService, speechSynthesizer: SpeechSynthesizing? = nil) {
        super.init(navigationService: navigationService,
                   speechSynthesizer: speechSynthesizer ?? SpeechSynthesizerStub())
    }
}

class NavigationLocationManagerStub: NavigationLocationManager {
    override func startUpdatingLocation() {
        return
    }

    override func startUpdatingHeading() {
        return
    }
}
