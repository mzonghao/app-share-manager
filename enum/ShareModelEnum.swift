// system 调用系统分享
// custom 调用自定义分享

public enum ShareModeEnum: String {
    case system
    case custom
}

extension ShareModeEnum {
    init?(rawString: String) {
        self.init(rawValue: rawString)
    }
}
