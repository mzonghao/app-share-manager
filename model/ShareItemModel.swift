// R: 引入 pod 'R.swift', '4.0.0'

import Foundation

class ShareItemModel {

    var id: ShareTypeEnum = .twitter
    var title: String = ""
    var icon: UIImage? = R.image.wechat()

    init(_ type: ShareTypeEnum) {
        self.id = type
        switch type {
        case .twitter:
            self.title = "twitter"
            self.icon = R.image.twitter()
        case .facebook:
            self.title = "facebook"
            self.icon = R.image.facebook()
        case .telegram:
            self.title = "telegram"
            self.icon = R.image.telegram()
        case .reddit:
            self.title = "reddit"
            self.icon = R.image.reddit()
        case .wechat    
            self.title = "wechat"
            self.icon = R.image.wechat()
        case qq
            self.title = "qq"
            self.icon = R.image.qq()
        case weibo  
            self.title = "weibo"
            self.icon = R.image.weibo()  
        }
    }
}
