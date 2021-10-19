//
//  HomeTableViewCell.swift
//  swiftDemo
//
//  Created by 镭速iOS on 7/20/21.
//

import UIKit


@objc protocol HomeTableViewCellDelegate: AnyObject {
    func titleLabelClick()

    @objc optional func titleLabelselect(name: String) -> String
}

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCellid"
    class func getHomeCell(tableView: UITableView) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (cell == nil) {
            cell = HomeTableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        return cell!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    open weak var delegate: HomeTableViewCellDelegate?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.contentView.addSubview(titleLabel)
//        let names = ["adad", "adadqqssd"]
    }
    
    @objc func titleLabelTap() {
        self.delegate?.titleLabelClick()
    }
    
    //MARK - test
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 10, y: 10, width: 200, height: 20)
        titleLabel.text = "标题是啥？"
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = .red
        titleLabel.isUserInteractionEnabled = true;
        let tap = UITapGestureRecognizer(target: self, action: #selector(titleLabelTap))
        titleLabel.addGestureRecognizer(tap)
        return titleLabel
    }()
}
