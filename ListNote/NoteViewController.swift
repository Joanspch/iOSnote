//
//  NoteViewController.swift
//  ListNote
//
//  Created by Joan Paredes on 11/9/20.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel?.becomeFirstResponder()
        titleLabel.text = noteTitle
        noteLabel.text = note
       
    }
    
    
    
}
