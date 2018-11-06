// 自定义分享 包含类型

public enum ShareTypeEnum: String {
    case twitter
    case facebook
    case telegram
    case reddit
    case wechat
    case qq
    case weibo
}

extension ShareTypeEnum {
    init?(rawString: String) {
        self.init(rawValue: rawString)
    }
}
