//
//  EntryViewController.swift
//  ListNote
//
//  Created by Joan Paredes on 11/9/20.
//

import UIKit

class EntryViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField?.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self , action: #selector(didTapSave))
        noteField.text = "Write something"
        noteField.textColor = UIColor.lightGray
        noteField.font = UIFont(name: "Arial", size: 17)
        noteField.returnKeyType = .done
        noteField.delegate = self

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write something"{
            textView.text = ""
            textView.textColor = UIColor.black
            textView.font = UIFont(name: "Arial", size: 17)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            noteField.text = "Write something"
            noteField.textColor = UIColor.lightGray
            noteField.font = UIFont(name: "Arial", size: 17)
        }
    }
    
    @objc func didTapSave(){
        if let text = titleField?.text, !text.isEmpty, !noteField.text.isEmpty{
            completion?(text,noteField.text)
        }
    }

}
