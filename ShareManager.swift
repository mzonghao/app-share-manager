import UIKit
import Foundation
import Presentr

class ShareManager {

    var vc: UIViewController = UIViewController()
    var shareTypes: [ShareTypeEnum] = []
    var shareItems: [ShareItemModel] = []
    var shareInfo: [String: Any]

    public func showShare(shareMode: ShareModeEnum) {
        switch shareMode {
        case .system:
            let shareImages: [UIImage] = [self.generateShareImage()]
            let shareVC = UIActivityViewController(
                activityItems: shareImages, applicationActivities: nil
            )
            self.vc.present(shareVC, animated: true)
        case .custom:
            let presenter: Presentr = {
                let widthPercent = 1.0
                let heightPercent = 1.0
                let width = ModalSize.fluid(percentage: Float(widthPercent))
                let height = ModalSize.fluid(percentage: Float(heightPercent))
                let origin = CGPoint(x: 0, y: 0)
                let center = ModalCenterPosition.customOrigin(origin: origin)
                let customType = PresentationType.custom(width: width, height: height, center: center)

                let customPresenter = Presentr(presentationType: customType)
                customPresenter.dismissTransitionType = .crossDissolve
                customPresenter.backgroundOpacity = 0.5
                customPresenter.dismissOnSwipe = false
                customPresenter.dismissOnTap = false
                return customPresenter
            }()

            let shareUI = presenter
            let shareVC = ShareViewController()
            shareVC.shareImage = self.generateShareImage()
            self.vc.customPresentViewController(
                shareUI,
                viewController: shareVC,
                animated: true,
                completion: nil
            )
        }
    }

    func generateShareImage() -> UIImage {
        let shareImageView: ShareImageView = ShareImageView()
        return shareImageView.transformToImage()
    }

    init(
        vc: UIViewController,
        types: [ShareTypeEnum],
        shareInfo: [String: Any]
    ) {
        self.vc = vc
        self.shareTypes = types
        self.shareInfo = shareInfo
        self.shareItems = ShareModel(types).shareItems
    }
}
