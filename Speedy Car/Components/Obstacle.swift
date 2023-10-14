//
//  Obstacle.swift
//  Speedy Car
//
//  Created by Stvya Sharma on 25/03/21.
//

import Foundation
import SwiftUI

struct Obstacle: View {
    
    let width: CGFloat = 20
    let height: CGFloat = 200
    
    var body: some View {
        
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(Color.yellow)
        
    }
}
