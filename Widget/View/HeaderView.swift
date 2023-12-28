//
//  HeaderView.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//

import SwiftUI
import WidgetKit

struct HeaderView: View {
    let title: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image("DiscoverGroupIcon")
                .unredacted()
            Text("推荐")
                .font(.custom("Montserrat", size: 12, relativeTo: .headline))
                .bold()
                .lineLimit(2)
                .textCase(.uppercase)
            Spacer()
            Image("icon_29pt")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20, alignment: .topTrailing)
                .cornerRadius(10)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "牵恋")
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
