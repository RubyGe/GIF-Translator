//
//  DataModels.swift
//  GIF-Translator
//
//  Created by Genie Guo on 3/13/16.
//  Copyright © 2016 Genie Guo. All rights reserved.
//

import Foundation

struct Size {
    var width:Int?
    var height:Int?
    var fileSize:Int?
}

class GIFData {
    var id:String?
    var url:NSURL?
    var size:Size?
}

