//
//  LargeWidgetView.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//

import SwiftUI
import WidgetKit

struct LargeWidgetView: View {
    var model = RecommendDetail()
    var image = Image("DummyImage")
    
    var body: some View {
        VStack {
            HeaderView(title: "")
            
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader { geometryProxy in
                    Link(destination: (URL(string: "monthlycall://widget.user/" + model.suid + "/gender/" + String(model.gender))!)) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometryProxy.size.width, height: geometryProxy.size.height)
                            .clipped()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(model.nickname)
                        .font(.custom("Montserrat", size: 15, relativeTo: .title))
                        .bold()
                        .lineLimit(2)
                        .foregroundColor(Color("Gray5"))
                }
                .padding(8)
            }
            .background(Color("CardBackground"))
            .cornerRadius(5)
            
            ButtonRowView()
        }
        .padding()
    }
}

struct LargeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            LargeWidgetView(model: RecommendDetail(), image: Image("DummyImage"))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .environment(\.colorScheme, colorScheme)
                .redacted(reason: .placeholder)
        }
    }
}
