//
//  SmallWidgetView.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//

import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
    var model = RecommendDetail()
    var image = Image("DummyImage")
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geo in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width,
                           height: geo.size.height)
                    .clipped()
                
                Image("icon_29pt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .topTrailing)
                    .cornerRadius(10)
                    .position(x: geo.size.width - 20 , y : 20)
            }.widgetURL(URL(string: "monthlycall://widget.user/" + model.suid + "/gender/" + String(model.gender))!)
        }.background(Color("SmallWidgetBackground"))
    }
}

struct MediumWidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            SmallWidgetView(model: RecommendDetail(), image: Image("DummyImage"))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.colorScheme, colorScheme)
        }
    }
}
