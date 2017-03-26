//
//  AddEventViewController.swift
//  Event App
//
//  Created by Dustin Allen on 3/25/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import CoreData

class AddEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var notificationSwitch: UISwitch!
    
    var theImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationSwitch.addTarget(self, action: #selector(switchIsChanged(mySwitch:)), for: .valueChanged)
        
        createDirectory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func categoryButton(_ sender: Any) {
        
    }
    
    @IBAction func customizeBackground(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
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
            print("UISwitch is ON")
        } else {
            print("UISwitch is OFF")
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
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(titleField.text)")
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
}
