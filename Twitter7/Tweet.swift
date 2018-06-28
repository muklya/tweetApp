//
//  File.swift
//  Twitter7
//
//  Created by Mukhamedjan on 18.04.17.
//  Copyright © 2017 sdu. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Tweet{
    var content: String = ""
    var addedByUser: String = ""
    init(content:String,addedByUser:String){
        self.content = content
        self.addedByUser = addedByUser
    }
    init(snapshot: FIRDataSnapshot){
        let value = snapshot.value as! NSDictionary
        content = value["content"] as! String
        addedByUser = value["addedByUser"] as! String
    }
    func toAnyObject() -> Any{
        return ["content":content,"addedByUser":addedByUser]
    }
    
}
