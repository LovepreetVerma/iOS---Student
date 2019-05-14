//
//  ImageData+CoreDataProperties.swift
//  Project_Lovepreet
//
//  Created by LOVEPREET VERMA on 27/11/18.
//  Copyright © 2018 LOVEPREET VERMA. All rights reserved.
//
//

import Foundation
import CoreData


extension ImageData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageData> {
        return NSFetchRequest<ImageData>(entityName: "ImageData")
    }

    @NSManaged public var caption: String?
    @NSManaged public var image: NSData?
    @NSManaged public var imageId: String?
    @NSManaged public var imgUrl: String?
    @NSManaged public var name: String?
    @NSManaged public var text: String?

}
