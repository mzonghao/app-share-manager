import Foundation
import SnapKit

class ShareViewController: UIController {

    var shareItems: [ShareItemModel] = []
    var shareImage: UIImage = UIImage()

    let shareCellId: String = "shareViewCell"

    let contentView: UIView = UIView()
    let titleView: UIView = UIView()
    let lineView: UIView = UIView()
    var shareCollectionView: UICollectionView?

    let titleCloseBtn: UIButton = UIButton()
    let titleCloseImageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()

    let titleViewHeight = ratio(108)
    let lineViewHeight = ratio(2)
    let shareCollectionViewPaddingTop = ratio(40)
    let shareCollectionViewPaddingBottom = ratio(30)
    let cellWidth = ratio(160)
    let cellHeight = ratio(166)
    let cellLineSpacing = ratio(20)
    var shareRows: Int {
        return Int(ceil(Double(self.shareItems.count) / 4))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        setComponents()
        addConstraints()
    }

    private func addComponents() {
        titleCloseBtn.addSubview(titleCloseImageView)

        titleView.addSubview(titleCloseBtn)
        titleView.addSubview(titleLabel)

        contentView.addSubview(titleView)
        contentView.addSubview(lineView)
        setAndAddCollection()

        self.view.addSubview(contentView)
    }

    private func setComponents() {
        contentView.backgroundColor = UIColor.white

        titleCloseImageView.image = R.image.shareClose()

        titleLabel.font = UIFont.boldSystemFont(ofSize: ratio(34))
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        titleLabel.text = R.string.localizable.shareTitleText()

        titleCloseBtn.addTapGesture(target: self, action: #selector(closeSharePop(_:)))

        lineView.backgroundColor = UIColor(.planLineColor)
    }

    private func setAndAddCollection() {
        let layout = UICollectionViewFlowLayout()
        let paddingX: CGFloat = ratio(55)
        shareCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        shareCollectionView?.register(ShareViewCell.self, forCellWithReuseIdentifier: shareCellId)
        shareCollectionView?.delegate = self
        shareCollectionView?.dataSource = self
        shareCollectionView?.backgroundColor = UIColor.white
        layout.sectionInset = UIEdgeInsets(
            top: shareCollectionViewPaddingTop,
            left: paddingX,
            bottom: shareCollectionViewPaddingBottom,
            right: paddingX
        )
        layout.minimumLineSpacing = cellLineSpacing
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

        if let shareCollectionView = self.shareCollectionView {
            contentView.addSubview(shareCollectionView)
        }
    }

    private func addConstraints() {

        let shareRowsHeight =
            cellHeight * CGFloat(shareRows) + ((CGFloat(shareRows) - CGFloat(1)) * cellLineSpacing)
        let shareCollectionViewHeight =
            shareCollectionViewPaddingTop + shareRowsHeight + shareCollectionViewPaddingBottom

        let contentViewHeight = titleViewHeight + lineViewHeight + shareCollectionViewHeight

        contentView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.width.equalToSuperview()
            make.height.equalTo(contentViewHeight)
        }

        titleView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(titleViewHeight)
        }

        titleCloseBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(ratio(20))
            make.leading.equalToSuperview().offset(ratio(20))
            make.width.equalTo(ratio(68))
            make.height.equalTo(ratio(68))
        }

        titleCloseImageView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(ratio(28))
            make.height.equalTo(ratio(28))
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.width.equalTo(ratio(450))
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        lineView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(lineViewHeight)
        }

        shareCollectionView?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(lineView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(shareCollectionViewHeight)
        }
    }

    @objc func closeSharePop(_ tap: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension ShareViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shareItems.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let cell: ShareViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: self.shareCellId,
            for: indexPath
            ) as! ShareViewCell
        cell.setItem(item: self.shareItems[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemIndex = indexPath.row
        let item = self.shareItems[itemIndex]
        switch item.id {
        case .twitter:
            shareTwitter()
        case .facebook:
            shareFacebook()
        case .telegram:
            shareTelegram()
        case .reddit:
            shareReddit()
        case .wechat:
            shareWechat() 
        case .qq:
            shareQQ() 
        case .weibo:
            shareWeibo()
        }
    }
}

extension ShareViewController {
    func shareTwitter() {
        // do something
    }

    func shareFacebook() {
        // do something
    }

    func shareTelegram() {
        // do something
    }

    func shareReddit() {
        // do something
    }

    func shareWechat() {
        // do something
    }

    func shareQQ() {
        // do something
    }

    func shareWeibo() {
        // do something
    }
}
