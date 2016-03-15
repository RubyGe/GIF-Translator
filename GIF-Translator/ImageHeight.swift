//
//  ImageHeight.swift
//  GIF-Translator
//
//  Created by Genie Guo on 3/13/16.
//  Copyright © 2016 Genie Guo. All rights reserved.
//

import Foundation
import UIKit

func getImageHeight(size:Size, screenWidth:CGFloat?) ->Double {
 //   let size = searchResultsList[indexPath.row].size
    let originalHeight = Double(size.height!)
    let originalWidth = Double(size.width!)
    print("Original Heigh:\(originalHeight), Original Width: \(originalWidth)")
    let width = Double(screenWidth!) - 16.0
    let height = originalHeight * width / originalWidth
    return height
}

