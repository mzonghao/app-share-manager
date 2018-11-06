import Foundation
import SnapKit

class ShareViewCell: UICollectionViewCell {

    let cellImageView: UIImageView = UIImageView()
    let cellTextLabel: UILabel = UILabel()

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addAndSetComponent()
        addConstraints()
    }

    private func addAndSetComponent() {
        cellTextLabel.font = UIFont.boldSystemFont(ofSize: ratio(24))
        cellTextLabel.textColor = UIColor(.descColor)
        cellTextLabel.textAlignment = NSTextAlignment.center

        self.addSubview(cellImageView)
        self.addSubview(cellTextLabel)
    }

    private func addConstraints() {
        cellImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(ratio(20))
            make.centerX.equalToSuperview()
            make.width.equalTo(ratio(100))
            make.height.equalTo(ratio(100))
        }

        cellTextLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(cellImageView.snp.bottom).offset(ratio(12))
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(ratio(34))
        }
    }

    public func setItem(item: ShareItemModel) {
        cellImageView.image = item.icon
        cellTextLabel.text = item.title
    }
}
