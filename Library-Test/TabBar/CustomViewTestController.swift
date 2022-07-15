//
//  CustomViewTestController.swift
//  Library-Test
//
//  Created by sejin on 2022/07/15.
//

import UIKit

class CustomViewTestController: UIViewController {
    
    // MARK: - UI
    private lazy var customTextField = CustomTextFieldView()
    private lazy var customTextField2 = CustomTextFieldView()

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .systemPink
        
        view.addSubview(customTextField)
        customTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(100)
        }
        
        view.addSubview(customTextField2)
        customTextField2.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(customTextField.snp.bottom).offset(10)
        }
    }
    
    
}
