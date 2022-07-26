//
//  TweetsDatasource.swift
//  twitter_clone
//
//  Created by SI MOHAMMED Sonia-taous (Canal Plus ) on 25/07/2022.
//

import Foundation

class TweetsDatasource: Identifiable{
    
    
    var id : String
    var text : String
    
    init(id:String,text:String){
        self.id = id
        self.text = text
    }
    
    init(text:String,id:String){
        self.id = id
        self.text = text
    }
    
    convenience init?(dict:[String:Any]){
        guard let id = dict["id"] as? String,
              let text = dict["text"] as? String else { return nil }
        self.init(id: id, text: text)
        self.init(text: id, id: text)

    }
    
 
   
    
}
