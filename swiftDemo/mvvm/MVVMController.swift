//
//  MVVMController.swift
//  swiftDemo
//
//  Created by 镭速iOS on 9/23/21.
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa

class MVVMController: UIViewController {
    
    var button :UIButton!
    
    var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI() {
        self.button = UIButton.init(type: .custom)
        button.setTitle("测试", for: .normal)
        button.backgroundColor = .red
        
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.left.equalTo(self.view).offset(30)
            make.height.width.equalTo(50)
        }
        
        self.button.rx.tap
            .subscribe(onNext :{
                print("点击了测试按钮")
            })
            .disposed(by: disposeBag)
    }
}
