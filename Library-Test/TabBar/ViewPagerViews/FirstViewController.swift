//
//  FirstViewController.swift
//  Library-Test
//
//  Created by sejin on 2022/07/06.
//

import UIKit

class FirstViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "첫번째 뷰"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let endLabel: UILabel = {
       let label = UILabel()
        label.text = "마지막 줄"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        configureGradientLayer()
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        view.addSubview(endLabel)
        endLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    

    
    // 배경색 그라데이션으로 만들기
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 0.1]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 5, y: 0.3)
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
