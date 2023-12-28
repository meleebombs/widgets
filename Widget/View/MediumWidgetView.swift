//
//  MediumWidgetView.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    var model = [RecommendDetail(), RecommendDetail(), RecommendDetail()]
    var images = [Image("DummyImage"), Image("DummyImage1"), Image("DummyImage2")]
    
    var body: some View {
        VStack {
            HeaderView(title: "")
            GeometryReader { geometryProxy in
                HStack {
                    let firstPerson = model.first!
                    
                    Link(destination: (URL(string: "monthlycall://widget.user/" + firstPerson.suid + "/gender/" + String(firstPerson.gender))!)) {
                        if let image = images.first {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometryProxy.size.width / 3 - 5,
                                       height: geometryProxy.size.height)
                                .clipped()
                                .cornerRadius(5)
                        }
                    }
                    
                    let secondPerson = model[1]
                    Link(destination: (URL(string: "monthlycall://widget.user/" + secondPerson.suid + "/gender/" + String(secondPerson.gender))!)) {
                        images[1]
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometryProxy.size.width / 3 - 5,
                                   height: geometryProxy.size.height)
                            .clipped()
                            .cornerRadius(5)
                    }
                    
                    let lastPerson = model.last!
                    Link(destination: (URL(string: "monthlycall://widget.user/" + lastPerson.suid + "/gender/" + String(lastPerson.gender))!)) {
                        if let image = images.last {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometryProxy.size.width / 3 - 5,
                                       height: geometryProxy.size.height)
                                .clipped()
                                .cornerRadius(5)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color("MediumAndLargeWidgetBackground"))
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            MediumWidgetView(model: [RecommendDetail(), RecommendDetail(), RecommendDetail()], images: [Image("DummyImage"), Image("DummyImage1"), Image("DummyImage2")])
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .environment(\.colorScheme, colorScheme)
        }
    }
}
