//
//  ViewController.swift
//  ActionSheet
//
//  Created by MacBook Pro on 10.10.16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ui obj
    @IBOutlet weak var x_textField: UITextField!
    @IBOutlet weak var y_textField: UITextField!
    @IBOutlet weak var width_TextFIeld: UITextField!
    @IBOutlet weak var height_textField: UITextField!
    
    var objectToAdd : UIView!
    
    
    // first load func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // function that adds object to View
    func addObject() {
        
        // if some of the textField is empty, turn placeholder to red color
        if x_textField.text!.isEmpty || y_textField.text!.isEmpty || width_TextFIeld.text!.isEmpty || height_textField.text!.isEmpty {
            
            // red placeholders
            x_textField.attributedPlaceholder = NSAttributedString(string: x_textField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.red])
            y_textField.attributedPlaceholder = NSAttributedString(string: y_textField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.red])
            width_TextFIeld.attributedPlaceholder = NSAttributedString(string: width_TextFIeld.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.red])
            height_textField.attributedPlaceholder = NSAttributedString(string: height_textField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.red])
            
            return
            
        } else {
            
            // shortcuts
            let X = CGFloat(Int(x_textField.text!)!)
            let Y = CGFloat(Int(y_textField.text!)!)
            let width = CGFloat(Int(width_TextFIeld.text!)!)
            let height = CGFloat(Int(height_textField.text!)!)
            
            // adding object with custom cooridnates
            objectToAdd = UIView()
            objectToAdd.frame = CGRect(x: X, y: Y, width: width, height: height)
            objectToAdd.backgroundColor = .yellow
            objectToAdd.layer.zPosition = -1
            objectToAdd.tag = 1
            self.view.addSubview(objectToAdd)
            
            // text to be empty
            x_textField.text = ""
            y_textField.text = ""
            width_TextFIeld.text = ""
            height_textField.text = ""
            
            // dismissing the keyboard
            self.view.endEditing(true)
        }
        
    }
    
    
    // function that removes all added objects
    func deleteObjects() {
        
        // removes objects
        //objectToAdd.removeFromSuperview()
    
        // taking each view of viewController into *view
        for view in self.view.subviews {
            
            /*
            if view.backgroundColor == .yellow {
                view.removeFromSuperview()
            }
            */
            
            // all views that have tag = 1 ...
            if view.tag == 1 {
                view.removeFromSuperview()
            }
            
        }
        
    }

    
    // called when *actionSheet button is pressed
    @IBAction func actionSheet_clicked(_ sender: AnyObject) {
        
        // declared const *sheet to store ActionSheet UI Obj
        let sheet = UIAlertController(title: "Hello ActionSheet :)", message: "Please select any action", preferredStyle: .actionSheet)
        
        // declared add button
        let add = UIAlertAction(title: "Add Object", style: .default) { (action:UIAlertAction) in
            // add obj
            self.addObject()
        }
        
        // declared delete button
        let delete = UIAlertAction(title: "Delete Objects", style: .destructive) { (action:UIAlertAction) in
            // removes obj
            self.deleteObjects()
        }
        
        // declared cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        // added buttons to ActionSheet
        sheet.addAction(add)
        sheet.addAction(delete)
        sheet.addAction(cancel)
        
        // show ActionSheet
        self.present(sheet, animated: true, completion: nil)
    }
    

}

