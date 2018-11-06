# app-share-mamnager
iOS 图片分享弹窗 example

## 目录

- [使用](#使用)
- [依赖](#依赖)

******
## 使用 
* 调用系统分享
    ```
    lazy var shareManager: ShareManager = ShareManager(
        vc: self,
        types: [],
        shareInfo: [
            ... // 传入分享图片的信息
        ]
    )

    shareManager.showShare(shareMode: .system)
    ```

* 调用自定义分享
    ```
    lazy var shareManager: ShareNewManager = ShareNewManager(
        vc: self,
        types: [.twitter, .facebook, .telegram, .reddit], // 分享类型
        shareInfo: [
            ... // 传入分享图片的信息
        ]
    )

    shareManager.showShare(shareMode: .custom)

    自定义分享一行四个，UICollectionView 自动布局
    ```

## 依赖
* podfile:
    ```
    pod 'SnapKit', '4.0.0'
    pod 'Presentr', '1.3.0'
    pod 'R.swift', '4.0.0'
    ```