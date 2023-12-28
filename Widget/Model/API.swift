//
//  API.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//

import Moya
import CommonCrypto
import AdSupport
import AppTrackingTransparency

enum API {
    case recommendApi
}

extension API: TargetType {
    var baseURL: URL {
        return URL.init(string: "https://app.api.gxxianshi.cn")!
    }
    
    var path: String {
        switch self {
            
        case .recommendApi:
            return "/fate/recommendList"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    //这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    //该条请API求的方式,把参数之类的传进来
    var task: Task {
        let dic = [String: Any]()
        let data = self.encryption(paraDict: dic)
        
        return .requestData(data)
    }
    
    func encryption(paraDict: [String: Any]) -> Data {
        let jsonString = paraDict.jsonString()
        
        let data = self.JSONStringToData(jsonString ?? "")
        
        return data!
    }
    
    func JSONStringToData(_ jsonString: String) -> Data? {
        let data = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        return data
    }
    
    var headers: [String: String]? {
        return UserDefaults(suiteName: "group.widget.monthlycall")?.value(forKey: "widgetHeader") as? [String : String]
    }
}


public extension Dictionary{
    func jsonString(prettify: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else { return nil }
        
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: options) else { return nil }
        
        return String(data: jsonData, encoding: .utf8)
    }
}
