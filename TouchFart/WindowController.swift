//
//  WindowController.swift
//  TouchSound
//
//  Created by Hung Truong on 10/27/16.
//  Forked by Takumi Okazaki on 10/30/16
//  Copyright © 2016 Takumi Okazaki. All rights reserved.
//

import Cocoa


fileprivate extension NSTouchBarCustomizationIdentifier {
    
    static let touchBar = NSTouchBarCustomizationIdentifier("com.okazaki.touchsound")
}

fileprivate extension NSTouchBarItemIdentifier {
    // The first 3 IDs are not used in this application, but the files and identifiers have remained for the sake of homage to the original application. You can re-add them to the touch bar.
    static let loud = NSTouchBarItemIdentifier("loudfart")
    static let short = NSTouchBarItemIdentifier("shortfart")
    static let fart = NSTouchBarItemIdentifier("fart")
    static let wam = NSTouchBarItemIdentifier("wam")
    static let AIRHORN = NSTouchBarItemIdentifier("AIRHORN")
    static let camera = NSTouchBarItemIdentifier("camera")
    static let wow = NSTouchBarItemIdentifier("wow")
}



class WindowController: NSWindowController, NSTouchBarDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    
    func handleFart(sender: NSButton) {
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
        touchBar.defaultItemIdentifiers = [.wam, .AIRHORN, .camera, .wow]
        
        return touchBar
        
    }
   // Import the audio files with XCode before adding a new one.
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        switch identifier {
        case NSTouchBarItemIdentifier.loud:
            let button = NSButton(title: "💩", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.short:
            let button = NSButton(title: "💨", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.fart:
            let button = NSButton(title: "fart", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
            
       // The '(title: "XXXXX"' is what the audio file must be named and also what is displayed on the TB.
        case NSTouchBarItemIdentifier.AIRHORN:
            let button = NSButton(title: "📣", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.wam:
            let button = NSButton(title: "🖥 Wam", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.camera:
            let button = NSButton(title: "📷", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.wow:
            let button = NSButton(title: "😉 Wow", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem

       
        default:
            let button = NSButton(title: "🖥 Wam", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
            
        }
    }


}
