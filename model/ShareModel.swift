import Foundation

class ShareModel {

    var shareItems: [ShareItemModel] = []

    init(_ types: [ShareTypeEnum]) {
        for type in types {
            self.shareItems.append(ShareItemModel(type))
        }
    }

}
