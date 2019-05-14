//
//  DisplayImageViewController.swift
//  Project_Lovepreet
//
//  Created by LOVEPREET VERMA on 27/11/18.
//  Copyright © 2018 LOVEPREET VERMA. All rights reserved.
//

import UIKit
import CoreData

class DisplayImageViewController: UIViewController,UITableViewDelegate,
UITableViewDataSource {
    
   /* func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells") as! DisplayImageTableViewCell
        
        let i = imageData[indexPath.row].image! as Data
        cell.displayImageView.image = UIImage(data: i)
        //cell.displayCaption.text = imageData[indexPath.row].caption
        cell.displayCaption.text = "1212"
        return cell
    }
    
    
    var imageData = [ImageData]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        let context = pc.viewContext
        
        let fetchRequest : NSFetchRequest<ImageData> = ImageData.fetchRequest()
        
        imageData =  try! context.fetch(fetchRequest)
        
        print("data fetched")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
