//
//  array+identifiable.swift
//  meomorize
//
//  Created by MAC on 7/31/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension Array where Element : Identifiable{
    func firstIndex(matching element:Element)->Int?{
        for elementIndex in 0 ..< self.count {
            if self[elementIndex].id == element.id{
                return elementIndex
            }
        }
        return nil
    }
}
