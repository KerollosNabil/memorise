//
//  Theme.swift
//  meomorize
//
//  Created by MAC on 8/1/20.
//  Copyright © 2020 MAC. All rights reserved.
//
import SwiftUI


struct Themes <Element>{
    private(set) var themes:[Theme]
    
    init(numberOfThemes:Int, themeByIndex: (Int)->Theme) {
        themes = []
        for index in 0..<numberOfThemes{
            themes.append(themeByIndex(index))
        }
    }
    mutating func addTheme(theme:Theme) {
        themes.append(theme)
    }
    
       
    struct Theme  {
        var name:String
        var emojies:[Element]
        var color:Color
        
    }

}
