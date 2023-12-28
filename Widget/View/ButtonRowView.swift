//
//  LinkButtonView.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//

import SwiftUI
import WidgetKit

struct LinkButtonView: View {
    let imageName: String
    var shadow: Bool = false
    let text: String
    let url: URL
    
    var body: some View {
        Link(destination: url) {
            VStack {
                Image(imageName)
                    .shadow(radius: self.shadow ? 4 : 0)
                
                Text(text).font(.custom("Montserrat", size: 12, relativeTo: .title))
                    .bold()
                    .foregroundColor(Color("Gray4"))
            }.unredacted()
        }
    }
}

struct ButtonRowView: View {
    var body: some View {
        HStack(alignment: .top) {
            LinkButtonView(imageName: "Create", text: "充值", url: URL(string: "monthlycall://widget.charge")!)
            Spacer()
            
            LinkButtonView(imageName: "EnterPIN", text: "会员", url: URL(string: "monthlycall://widget.vip")!)
            Spacer()
            
            LinkButtonView(imageName: "Search", shadow: true, text: "更新", url: URL(string: "monthlycall://widget.update")!)
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
    }
}

struct ButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ButtonRowView()
                .background(Color("MediumAndLargeWidgetBackground"))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .environment(\.colorScheme, colorScheme)
                .previewDisplayName("\(colorScheme)")
        }
    }
}
