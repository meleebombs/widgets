//
//  BeautyModel.swift
//  HappyPlay
//
//  Created by Vincent Hu on 2021/1/15.
//  Copyright © 2021 HappyPlay. All rights reserved.
//

import HandyJSON

struct BeautyModel: HandyJSON {
    var code = 0
    var data = DataClass()
    var msg = ""
}

struct DataClass: HandyJSON {
    var recommendList = RecommendList()
}

struct RecommendList: HandyJSON {
    var list = [RecommendDetail]()
}

struct RecommendDetail: HandyJSON {
    var suid = ""
    var nickname = "牵恋"
    var avatarUrl = ""
    var gender = 1
}
