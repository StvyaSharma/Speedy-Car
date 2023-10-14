//
//  Pixel.swift
//  Speedy Car
//
//  Created by Stvya Sharma on 25/03/21.
//

import Foundation
import SwiftUI
struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
    
    
}
