//
//  ViewController.swift
//  Underliner
//
//  Created by George Endo on 11/25/16.
//  Copyright © 2016 Peka co. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {

    @IBOutlet var TextToEdit: NSScrollView!
    @IBOutlet var TextToRemove: NSScrollView!
    @IBOutlet var FontCheck: NSButtonCell!
    @IBOutlet var WidthCheck: NSButtonCell!
    @IBOutlet var WtfCheck: NSButtonCell!
    
    public func SetText(_ Text : String){
        let tv:NSTextView = TextToEdit.documentView! as! NSTextView
        tv.textStorage?.mutableString.setString(Text)
    }
    
    public func GetString() -> String{
        let tv:NSTextView = TextToEdit.documentView! as! NSTextView
        return tv.string!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    private func ChangeTo_(_ Text : String, _ Find : String) -> String{
        if Find == ""{
            return Text
        }
        
        var _ces = ""
        
        for _ in 1...Find.characters.count{
            _ces = _ces + "_"
        }
        
        let opts:String.CompareOptions = String.CompareOptions(rawValue: UInt(FontCheck.state)*String.CompareOptions.caseInsensitive.rawValue | UInt(WidthCheck.state)*String.CompareOptions.widthInsensitive.rawValue | UInt(WtfCheck.state)*String.CompareOptions.diacriticInsensitive.rawValue)
        
        return Text.replacingOccurrences(of: Find, with: _ces, options: opts)
        
    }
    
    
    @IBAction func ChangeText(_ sender: NSButton) {
        let TextToEditDocumentView:NSTextView = TextToEdit.documentView! as! NSTextView
        let TextToRemoveDocumentView:NSTextView = TextToRemove.documentView! as! NSTextView
        
        let TextToEditMutableString = TextToEditDocumentView.textStorage?.mutableString
        
        var TextToEditStringValue = TextToEditDocumentView.string
        let TextToRemoveValue:String = TextToRemoveDocumentView.string!
        
        let WordsToRemove = TextToRemoveValue.components(separatedBy: "\n")
        
        for e in WordsToRemove{
            TextToEditStringValue = ChangeTo_(TextToEditStringValue!, e)
        }
        
        TextToEditMutableString?.setString(TextToEditStringValue!)
    }


}

