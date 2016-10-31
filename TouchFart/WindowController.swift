//
//  WindowController.swift
//  TouchSound
//
//  Originally by Hung Truong on 10/27/16.
//  Forked by Takumi Okazaki on 10/30/16
//  Copyright © 2016 Takumi Okazaki. All rights reserved.
//

import Cocoa


fileprivate extension NSTouchBarCustomizationIdentifier {
    
    static let touchBar = NSTouchBarCustomizationIdentifier("com.okazaki.touchsound")
}

fileprivate extension NSTouchBarItemIdentifier {
   
    static let wam = NSTouchBarItemIdentifier("wam")
    static let AIRHORN = NSTouchBarItemIdentifier("AIRHORN")
    static let camera = NSTouchBarItemIdentifier("camera")
    static let wow = NSTouchBarItemIdentifier("wow")
    static let triple = NSTouchBarItemIdentifier("triple")
    static let shots = NSTouchBarItemIdentifier("shots")
    static let wombo = NSTouchBarItemIdentifier("wombo")
    static let sadHORN = NSTouchBarItemIdentifier("sadHORN")
}



class WindowController: NSWindowController, NSTouchBarDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    
    func handleSound(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: title) else {
            return
        }
        sound.play()
        
    }
    
   // You have to add the identifiers to the list below for them to show up.
    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .touchBar
        touchBar.defaultItemIdentifiers = [.wam, .AIRHORN, .camera, .wow, .triple, .shots, .wombo, .sadHORN]
        
        return touchBar
        
    }
   // Import the audio files with XCode before adding a new one.
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        switch identifier {
            
       // The '(title: "XXXXX"' is what the audio file must be named and also what is displayed on the TB.
            
        case NSTouchBarItemIdentifier.AIRHORN:
            let button = NSButton(title: "📣", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.wam:
            let button = NSButton(title: "🖥 Wam", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.camera:
            let button = NSButton(title: "📷", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.wow:
            let button = NSButton(title: "😉Wow", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.triple:
            let button = NSButton(title: "Triple❗️", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.shots:
            let button = NSButton(title: "Shots🔫", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.wombo:
            let button = NSButton(title: "🔊🎮Wombo", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.sadHORN:
            let button = NSButton(title: "📣😢", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem

       
        default:
            let button = NSButton(title: "🖥 Wam", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
            
        }
    }


}
