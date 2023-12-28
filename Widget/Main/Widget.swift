//
//  Widget.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//
import Combine
import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in _: Context) -> WidgetTimelineEntry {
        let model = RecommendDetail()
        
        return WidgetTimelineEntry(date: Date(), model: [model, model, model], images: [Image("DummyImage"), Image("DummyImage1"), Image("DummyImage2")])
    }
    
    // 定义Widget预览中如何展示，所以提供默认值要在这里
    func getSnapshot(in _: Context, completion: @escaping (WidgetTimelineEntry) -> Void) {
        let model = RecommendDetail()
        
        let entry = WidgetTimelineEntry(date: Date(), model: [model, model, model], images: [Image("DummyImage"), Image("DummyImage1"), Image("DummyImage2")])
        
        completion(entry)
    }
    
    // 决定 Widget 何时刷新
    func getTimeline(in _: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        NetWorkRequest(API.recommendApi, modelType: BeautyModel.self) { (model, responseModel) in
            var recommend = model.data.recommendList.list
            
            if recommend.count < 3 {
                return
            }
            
            recommend = Array(recommend[0...2])
            
            let avatars = recommend.map { item in
                return item.avatarUrl
            }
            
            WidgetImageLoader.shareLoader.downLoadImage(imageAry: avatars, placeHolder: Image("DummyImage")) { result in
                switch result {
                case .success(let images):
                    print("成功 = \(images)")
                    
                    let entry = WidgetTimelineEntry(date: Date(), model: recommend, images: images)
                    
                    let expireDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
                    let timeline = Timeline(entries: [entry], policy: .after(expireDate))
                    
                    completion(timeline)
                case .failure(let error):
                    print("失败 = \(error)")
                }
            }
        } failureCallback: { (responseModel) in
            let entry = WidgetTimelineEntry(date: Date(), model: [RecommendDetail(), RecommendDetail(), RecommendDetail()], images: [Image("DummyImage"), Image("DummyImage1"), Image("DummyImage2")])
            
            let expireDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(expireDate))
            
            completion(timeline)
        }
    }
}

struct WidgetTimelineEntry: TimelineEntry {
    let date: Date
    let model: [RecommendDetail]
    let images: [Image]
}

struct MonthlyCallWidgetEntryView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry
    
    var body: some View {
        Group {
            switch widgetFamily {
            case .systemSmall:
                if #available(iOSApplicationExtension 17.0, *) {
                    SmallWidgetView(model: entry.model.first ?? RecommendDetail(), image: entry.images.first ?? Image("DummyImage"))
                        .containerBackground(for: .widget) {
                            Color("SmallWidgetBackground")
                        }.padding(-20)
                } else {
                    SmallWidgetView(model: entry.model.first ?? RecommendDetail(), image: entry.images.first ?? Image("DummyImage"))
                }
                
            case .systemMedium:
                if #available(iOSApplicationExtension 17.0, *) {
                    MediumWidgetView(model: entry.model, images: entry.images).containerBackground(for: .widget) {
                        Color("MediumAndLargeWidgetBackground")
                    }.padding(-20)
                } else {
                    MediumWidgetView(model: entry.model, images: entry.images)
                }
                
            case .systemLarge:
                if #available(iOSApplicationExtension 17.0, *) {
                    LargeWidgetView(model: entry.model.first ?? RecommendDetail(), image: entry.images.first ?? Image("DummyImage"))
                        .containerBackground(for: .widget) {
                            Color("MediumAndLargeWidgetBackground")
                        }.padding(-20)
                } else {
                    LargeWidgetView(model: entry.model.first ?? RecommendDetail(), image: entry.images.first ?? Image("DummyImage"))
                }
                
            @unknown default:
                fatalError()
            }
        }
    }
}

@main
struct MonthlyCallWidget: Widget {
    let kind: String = "MonthlyCallWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MonthlyCallWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("牵恋")
        .description("同城恋爱交友脱单")
    }
}
