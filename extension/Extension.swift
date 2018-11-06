extension UIView {
    func transformToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage ?? UIImage()
    }
}

public func getScreenWidth() -> CGFloat {
    return UIScreen.main.bounds.size.width
}

public func ratio(_ width: CGFloat) -> CGFloat {
    return width * getScreenWidth() / 750
}
