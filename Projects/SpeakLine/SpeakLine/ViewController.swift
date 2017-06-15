//
//  ViewController.swift
//  SpeakLine
//
//  Created by Shilpa Bhat on 12/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSWindowDelegate
{

    let preferenceManager = PreferenceManager()

    let speechSynthesizer = NSSpeechSynthesizer()

    let voices = NSSpeechSynthesizer.availableVoices()
    
    var isStarted = false {
        didSet {
            updateButton()
        }
    }
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var stopSpeakingButton: NSButton!
    @IBOutlet weak var startSpeakingButton: NSButton!
    @IBOutlet weak var tableView: NSTableView!
    
    
    @IBAction func resetPreferences(_ sender: NSButton) {
        preferenceManager.activeVoice = NSSpeechSynthesizer.defaultVoice()
        preferenceManager.activeText = "I am the best!!!"
        
        updateView()
    }
    
    @IBAction func stopSpeaking(_ sender: NSButton) {
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking()
        }
    }

    @IBAction func startSpeaking(_ sender: NSButton) {
        if let contents = textView.string {
            speechSynthesizer.startSpeaking(contents)
            isStarted = true
        }
    }
    
    func updateButton() {
        self.startSpeakingButton.isEnabled = !isStarted
        self.stopSpeakingButton.isEnabled = isStarted
    }
    
    func updateView() {
        let defaultVoice = preferenceManager.activeVoice!
        if let defaultRow = voices.index(of: defaultVoice) {
            let indices = NSIndexSet(index: defaultRow)
            tableView.selectRowIndexes(indices as IndexSet, byExtendingSelection: false)
            tableView.scrollRowToVisible(defaultRow)
        }
        let defaultText = preferenceManager.activeText!
        textView.string = defaultText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.window?.delegate = self
        speechSynthesizer.delegate = self
        
        isStarted = false
        
        updateView()
    }

    func windowShouldClose(_ sender: Any) -> Bool {
        return !isStarted
    }

    func voiceNameForIdentifier(identifier:String) -> String? {
        let attributes = NSSpeechSynthesizer.attributes(forVoice: identifier)
        if attributes != nil  {
            return attributes[NSVoiceName] as? String
        }
        return nil
    }
}

extension ViewController: NSSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isStarted = false
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return voices.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let voice = voices[row]
        let voiceName = self.voiceNameForIdentifier(identifier: voice)
        return voiceName
    }
}

extension ViewController: NSTableViewDelegate {
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let tableView = notification.object as! NSTableView
        let selectedRow = tableView.selectedRow
        preferenceManager.activeVoice = voices[selectedRow]
        speechSynthesizer.setVoice(voices[selectedRow])
    }
}


extension ViewController: NSTextDelegate {

    func textDidEndEditing(_ notification: Notification) {
        preferenceManager.activeText = textView.string
    }
}
