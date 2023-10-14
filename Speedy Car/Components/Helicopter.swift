//
//  Helicopter.swift
//  Speedy Car
//
//  Created by Stvya Sharma on 25/03/21.
//

import Foundation
import SwiftUI

struct Helicopter: View {
    
    let rows = 5
    let columns = 5
    let size: CGFloat = 10
    let heliBlocks: [[Color]] = [[.clear,.clear,.clear,.clear,.clear],
                                 [.clear,.red,.red,.red,.clear],
                                 [.clear,.white,.red,.white,.clear],
                                 [.red,.red,.red,.red,.red],
                                 [.clear,.gray,.clear,.gray,.clear]]
    
    
    var body: some View {
        
        VStack (spacing: 0) {
            ForEach((0...self.rows - 1), id: \.self) { row in
                HStack (spacing: 0) {
                    ForEach((0...self.columns - 1), id: \.self) { col in
                        VStack (spacing: 0) {
                            Pixel(size: self.size, color: self.heliBlocks[row][col])
                        }
                    }
                }
            }
        }
    }
}
