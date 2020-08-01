//
//  array+only.swift
//  meomorize
//
//  Created by MAC on 7/31/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension Array{
    var only:Element?{
        (count == 1) ? first : nil
    }
}
