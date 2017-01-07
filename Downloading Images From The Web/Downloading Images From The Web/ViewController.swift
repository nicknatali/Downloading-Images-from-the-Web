//
//  ViewController.swift
//  Downloading Images From The Web
//
//  Created by Nick Natali on 12/31/16.
//  Copyright © 2016 Make It Appen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var selenaImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentsPath.count > 0 {
            
            let documentsDirectory = documentsPath[0]
            
            let restorePath = documentsDirectory + "/selena.jpg"
            
            selenaImageView.image = UIImage(contentsOfFile: restorePath)
            
        }
        
        let url = URL(string: "https://s-media-cache-ak0.pinimg.com/originals/13/d3/9d/13d39d197007a00ffe58da63edf6ca70.jpg")!
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error)
            } else {
                
                if let data = data {
                    
                    if let selenaImage = UIImage(data: data) {
                    
                        self.selenaImageView.image = selenaImage
                        
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        
                        if documentsPath.count > 0 {
                            
                             let documentsDirectory = documentsPath[0]
                                
                                let savePath = documentsDirectory + "/selena.jpg"
                                
                                do {
                                 try UIImageJPEGRepresentation(selenaImage, 1)?.write(to: URL(fileURLWithPath: savePath))
                                    
                                    print("Image was saved")
                                }catch {
                                    print("error with save path")
                                }
                            
                        }
                    
                    }
                    
                }
            }
            
            
            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

