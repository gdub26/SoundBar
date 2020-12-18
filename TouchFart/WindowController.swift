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
   
    static let Leedle = NSTouchBarItemIdentifier("Leedlelee")
    static let Finland = NSTouchBarItemIdentifier("Finland")
    static let Enigma = NSTouchBarItemIdentifier("I'm Ready")

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
        touchBar.defaultItemIdentifiers = [.Leedle, .Finland, .Ready]
        
        return touchBar
        
    }
   // Import the audio files with XCode before adding a new one.
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        switch identifier {
            
       // The '(title: "XXXXX"' is what the audio file must be named and also what is displayed on the TouchBar.
            
        case NSTouchBarItemIdentifier.Leedle:
            let button = NSButton(title: "Leedlelee", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.Finland:
            let button = NSButton(title: "Finland", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.Enigma:
            let button = NSButton(title: "Enigma", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
        

       
        default:
            let button = NSButton(title: "SOUND1", target: self, action: #selector(handleSound))
            touchBarItem.view = button
            return touchBarItem
            
        }
    }


}
