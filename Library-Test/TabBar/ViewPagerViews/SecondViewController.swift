//
//  SecondViewController.swift
//  Library-Test
//
//  Created by sejin on 2022/07/06.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func presentImagePicker()
}

class SecondViewController: UIViewController {

    weak var delegate: SecondViewControllerDelegate?
    
    private lazy var imagePickButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("이미지 골라~!", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(handleImagePickButtonDidTap), for: .touchUpInside)
        return btn
    }()
    
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "첫번째 뷰"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(imagePickButton)
        imagePickButton.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    
    }
    
    @objc func handleImagePickButtonDidTap() {
        delegate?.presentImagePicker()
    }
}
