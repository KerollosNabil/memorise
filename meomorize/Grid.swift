//
//  Grid.swift
//  meomorize
//
//  Created by MAC on 7/30/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item:Identifiable, ItemView:View{
    private var items:[Item]
    private var viewForItem :(Item) -> ItemView
    
    init(_ items:[Item], viewForItem:@escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
            
        }
    }
    private func body(for layout : GridLayout)-> some View{
        ForEach(items){item in
            self.body(item: item, layout: layout)
        }
    }
    private func body(item:Item, layout:GridLayout)-> some View{
        viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: items.firstIndex(matching: item)!))
    }
}



