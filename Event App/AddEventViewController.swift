//
//  AddEventViewController.swift
//  Event App
//
//  Created by Dustin Allen on 3/25/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import CoreData

class AddEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet var categoryButtonStyle: UIButton!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var notificationSwitch: UISwitch!
    
    var categoryArray = ["Anniversary", "Birthday", "Holiday", "School", "Life", "Trip"]
    var theImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationSwitch.addTarget(self, action: #selector(switchIsChanged(mySwitch:)), for: .valueChanged)
        
        dateField.delegate = self
        //titleField.delegate = self
        
        createDirectory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func categoryButton(_ sender: Any) {
        let alert = UIAlertController(title: "Choose One", message: "Which Category Best Describes Your Event?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Anniversary", style: .default) { action in
            chosenCategory = "Anniversary"
            self.categoryButtonStyle.setTitle(chosenCategory, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "Birthday", style: .default) { action in
            chosenCategory = "Birthday"
            self.categoryButtonStyle.setTitle(chosenCategory, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "Holiday", style: .default) { action in
            chosenCategory = "Holiday"
            self.categoryButtonStyle.setTitle(chosenCategory, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "School", style: .default) { action in
            chosenCategory = "School"
            self.categoryButtonStyle.setTitle(chosenCategory, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "Life", style: .default) { action in
            chosenCategory = "Life"
            self.categoryButtonStyle.setTitle(chosenCategory, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "Trip", style: .default) { action in
            chosenCategory = "Trip"
            self.categoryButtonStyle.setTitle(chosenCategory, for: .normal)
        })
        self.present(alert, animated: true)
    }
    
    @IBAction func customizeBackground(_ sender: Any) {
        if titleField.text == "" {
            let alert = UIAlertController(title: "Attention", message: "Please Enter A Title Before Picking A Background", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func notificationSwitchAction(_ sender: Any) {
        
    }
    
    @IBAction func dateAction(_ sender: Any) {
        
    }
    
    @IBAction func addEvent(_ sender: Any) {
        
    }
    
    func switchIsChanged(mySwitch: UISwitch) {
        if notificationSwitch.isOn {
            notificationBool = true
        } else {
            notificationBool = false
        }
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            theImage = image
            saveImageDocumentDirectory(image: theImage)
        }
        else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            theImage = image
            saveImageDocumentDirectory(image: theImage)
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveImageDocumentDirectory(image: UIImage){
        let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(titleField.text!)")
            print(paths)
            let imageData = UIImageJPEGRepresentation(image, 0.5)
            fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
    func createDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        dateField.text = formatter.string(from: sender.date)
        
        print("Try this at home")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        
        print("This Worked")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateField.resignFirstResponder()
        return true
    }

    func closekeyboard() {
        self.view.endEditing(true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
}
