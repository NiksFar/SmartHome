//
//  PfadeView.swift
//  SmartHome
//
//  Created by Mykyta on 13.08.26.
//

import SwiftUI

struct PathBackgroundView: View {
    var body: some View {
        ZStack {
            // Background wall
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray5))
                .frame(width: 320, height: 205)
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            // Left wall
                            Path { path in
                                path.move(to: CGPoint(x: 0, y: 30))
                                path.addLine(to: CGPoint(x: 45, y: 0))
                                path.addLine(to: CGPoint(x: 45, y: 150))
                                path.addLine(to: CGPoint(x: 0, y: 185))
                                path.closeSubpath()
                            }
                            .fill(Color(UIColor.systemGray4))
                        }
                    }
                )
                .padding([.leading, .trailing], 25)
            
            // Floor
            Path { path in
                path.move(to: CGPoint(x: 35, y: 205))
                path.addLine(to: CGPoint(x: 300, y: 205))
                path.addLine(to: CGPoint(x: 335, y: 170))
                path.addLine(to: CGPoint(x: 80, y: 170))
                path.closeSubpath()
            }
            .fill(Color(UIColor.systemGray4))
            // Carpet
            Path { path in
                path.move(to: CGPoint(x: 160, y: 170))
                path.addLine(to: CGPoint(x: 255, y: 170))
                path.addLine(to: CGPoint(x: 230, y: 190))
                path.addLine(to: CGPoint(x: 135, y: 190))
                path.closeSubpath()
            }
            .fill(Color.green)
        }
        
        .frame(width:340, height: 220)
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
        .scaleEffect(1)
    }
        
}

#Preview {
    PathBackgroundView()
}
