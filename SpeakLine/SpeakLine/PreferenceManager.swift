//
//  PreferenceManager.swift
//  SpeakLine
//
//  Created by Shilpa Bhat on 13/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

private let activeVoiceKey = "activeVoice"
private let activeTextKey  = "activeText"

class PreferenceManager {
    
    private let userDefaults = UserDefaults.standard
    
    var activeVoice: String? {
        set {
            userDefaults.set(newValue, forKey: activeVoiceKey)
        }
        get {
            return userDefaults.object(forKey: activeVoiceKey) as? String
        }
    }

    var activeText: String? {
        set {
            userDefaults.set(newValue, forKey: activeVoiceKey)
        }
        get {
            return userDefaults.object(forKey: activeTextKey) as? String
        }
    }

    init() {
        
        registerDefaultPreferences()
    }
    
    func registerDefaultPreferences() {
        let defaults = [ activeVoiceKey: NSSpeechSynthesizer.defaultVoice(),
                         activeTextKey: "I am the best!!!"]
        
        userDefaults.register(defaults: defaults)
    }
    
    
    
}
