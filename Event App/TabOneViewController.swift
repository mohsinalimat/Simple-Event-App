//
//  TabOneViewController.swift
//  Event App
//
//  Created by Dustin Allen on 3/26/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit

class TabOneViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func getImage(){
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(picturePath)
        if fileManager.fileExists(atPath: imagePAth){
            self.imageView.image = UIImage(contentsOfFile: imagePAth)
        }else{
            print("No Image")
        }
    }
    
}
