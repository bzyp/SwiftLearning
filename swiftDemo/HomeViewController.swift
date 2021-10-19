//
//  HomeViewController.swift
//  swiftDemo
//
//  Created by 镭速iOS on 7/14/21.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "首页"
        self.view.addSubview(self.tableView)
    }
    
    lazy var tableView: UITableView = {
        let frame = CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        let tab = UITableView(frame:frame ,style: .plain)
        tab.dataSource = self
        tab.delegate = self
        return tab
    }()
}

//MARK: delegate
extension HomeViewController:  HomeTableViewCellDelegate {
    @objc func titleLabelClick() {
        print("titleLabelClic")
    }
}

struct AssociatedKeys {
    static var isShowKey: String = "isShowKey"
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
   public var isShow: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.isShowKey) as? Bool ?? false
        }
    
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isShowKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = HomeTableViewCell.getHomeCell(tableView: tableView) as! HomeTableViewCell
        cell.delegate = self
        return cell
    }
}
