//
//  ViewController.swift
//  Project_Lovepreet
//
//  Created by LOVEPREET VERMA on 25/11/18.
//  Copyright © 2018 LOVEPREET VERMA. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var errorText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var searchText: UITextField!
    
    var imgCaption : String!
    var imgData : NSData!
    var imgId : String!
    var imageUrl : String!
    var imgName : String!
    var imgText : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorText.isHidden = true
    }
    

    @IBAction func saveButton(_ sender: UIButton) {
        let pc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
        let context = pc?.viewContext
        let imageSearch = ImageData(context: context!)
        imageSearch.caption = imgCaption
        imageSearch.image = imgData as NSData!
        imageSearch.imageId = imgId
        imageSearch.imgUrl = imageUrl
        imageSearch.name = imgName
        imageSearch.text = imgText
        try! context?.save()
        
        print("Saved")
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        if(searchText.text != ""){
            let searchWord = searchText.text!
            let subscriptionKey = "919e2d28ad2b4e87816f8facaa2fe29f";
            
            let imageUrl = URL (string: "https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=\(searchWord)&subscription-key=\(subscriptionKey)")
            
            let urlRequest = URLRequest(url: imageUrl!)
            
            let task = URLSession.shared.dataTask(with: urlRequest)
            {
                (data, response, error)
                in
                if(error == nil)
                {
                    do  {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                        let value = json["value"] as! [[String:Any]]
                        
                        let random = (Int)(arc4random_uniform( (UInt32)(value.count)))
                        
                        let thumbnail_url = value[random]["thumbnailUrl"] as! String
                        
                        let url = URL(string: thumbnail_url)
                        DispatchQueue.main.async {
                            let image_data = try! Data(contentsOf: url!)
                            
                            self.imageView.image = UIImage(data: image_data)
                            
                            self.imgCaption = value[random]["name"] as! String
                            self.imgData = image_data as! NSData
                            self.imgId = "12"
                            self.imageUrl = value[random]["thumbnailUrl"] as! String
                            self.imgName = value[random]["name"] as! String
                            self.imgText = value[random]["name"] as! String
                            
                            
                            
                            self.errorText.isHidden = true
                        }
                    }
                    catch
                    {
                        print("Json format error")
                    }
                }else
                {
                    print("Error")
                }
                
            }
            task.resume()
        }else
        {
            errorText.isHidden = false
        }
}

}
