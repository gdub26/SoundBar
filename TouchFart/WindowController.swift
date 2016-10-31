//
//  WindowController.swift
//  TouchSound
//
//  Originally by Hung Truong on 10/27/16.
//  Forked by Takumi Okazaki on 10/30/16
//  Copyright © 2016 Takumi Okazaki. All rights reserved.
//
//  SoundBar's "Master" branch is modular. This means that you can easily make your own soundboard for the Touch Bar, using my app as a mold. 
//  In essence, all you need to do is add new NSTouchBarItemIdentifiers and then add the buttons. From there simply make .mp3 files named the same as the titles of the buttons, and it should all work. If you can't get it to work how you want. Just open an issue on my GitHub page and I'll help you if I can.

import Cocoa


fileprivate extension NSTouchBarCustomizationIdentifier {
    
    static let touchBar = NSTouchBarCustomizationIdentifier("com.okazaki.touchsound")
}

fileprivate extension NSTouchBarItemIdentifier {
   
    static let sax = NSTouchBarItemIdentifier("sax")
    static let free = NSTouchBarItemIdentifier("realestate")
    static let im = NSTouchBarItemIdentifier("gay")
    static let whyyou = NSTouchBarItemIdentifier("hefftobemad")
    static let wilhelm = NSTouchBarItemIdentifier("scream")
    static let darkness = NSTouchBarItemIdentifier("oldfriend")
    static let vitas = NSTouchBarItemIdentifier("vitas")

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
        touchBar.defaultItemIdentifiers = [.sax, .free, .im, .whyyou, .wilhelm, .darkness, .vitas]
        
        return touchBar
        
    }
   // Import the audio files with XCode before adding a new one.
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        switch identifier {
            
       // The '(title: "XXXXX"' is what the audio file must be named and also what is displayed on the TouchBar.
            
        case NSTouchBarItemIdentifier.sax:
            let button = NSButton(title: "🎷", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.wilhelm:
            let button = NSButton(title: "😱", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.whyyou:
            let button = NSButton(title: "😡", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.im:
            let button = NSButton(title: "🏳️‍🌈", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.free:
            let button = NSButton(title: "🏡", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.darkness:
            let button = NSButton(title: "⬛️", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.vitas:
            let button = NSButton(title: "🎤", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem

       
        default:
            let button = NSButton(title: "sax", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
            
        }
    }


}
