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
                .frame(width: 320, height: 350)
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            // Left wall
                            Path { path in
                                path.move(to: CGPoint(x: 10, y: 50))
                                path.addLine(to: CGPoint(x: 65, y: 5))
                                path.addLine(to: CGPoint(x: 65, y: 240))
                                path.addLine(to: CGPoint(x: 10, y: 295))
                                path.closeSubpath()
                            }
                            .fill(Color(UIColor.systemGray4))
                        }
                    }
                )
                .padding([.leading, .trailing], 25)
            
            // Floor
            Path { path in
                path.move(to: CGPoint(x: 105, y: 290))
                path.addLine(to: CGPoint(x: 300, y: 290))
                path.addLine(to: CGPoint(x: 270, y: 340))
                path.addLine(to: CGPoint(x: 55, y: 340))
                path.closeSubpath()
            }
            .fill(Color(UIColor.systemGray4))
            // Carpet
            Path { path in
                path.move(to: CGPoint(x: 155, y: 300))
                path.addLine(to: CGPoint(x: 265, y: 300))
                path.addLine(to: CGPoint(x: 245, y: 330))
                path.addLine(to: CGPoint(x: 130, y: 330))
                path.closeSubpath()
            }
            .fill(Color.red)
        }
        
        .frame(width:360, height: 390)
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    PathBackgroundView()
}
