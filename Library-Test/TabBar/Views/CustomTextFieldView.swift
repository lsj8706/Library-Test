//
//  CustomTextFieldView.swift
//  Library-Test
//
//  Created by sejin on 2022/07/15.
//

import UIKit

class CustomTextFieldView: UIView {
    // MARK: - Properties
    let tags = ["세진", "수빈", "승현"]
    
    // MARK: - UI
    private lazy var textFieldTitleLabel = UILabel().then {
        $0.text = "when"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .systemGray3
    }
    
    private lazy var dividerView = UIView().then {
        $0.backgroundColor = .systemGray3
    }
    
    private lazy var textField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "장소를 입력해주세요", attributes: [.foregroundColor: UIColor.systemGray2])
        $0.textColor = .white
        $0.delegate = self
    }
    
    private lazy var textFieldContainerView = UIView().then {
        $0.backgroundColor = .darkGray
        $0.addSubview(textFieldTitleLabel)
        textFieldTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(25)
            make.centerY.equalToSuperview()
            make.width.equalTo(50)
        }
        
        $0.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.leading.equalTo(textFieldTitleLabel.snp.trailing).offset(10)
            make.width.equalTo(1)
            make.height.equalTo(24)
            make.centerY.equalToSuperview()
        }
    
        $0.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalTo(dividerView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(26)
            make.height.equalTo(24)
            make.centerY.equalToSuperview()
        }
    }
    
    private lazy var tagButton1 = UIButton(type: .system).then {
        $0.backgroundColor = .darkGray
        $0.setTitle("세진", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton2 = UIButton(type: .system).then {
        $0.backgroundColor = .darkGray
        $0.setTitle("수빈", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagButton3 = UIButton(type: .system).then {
        $0.backgroundColor = .darkGray
        $0.setTitle("승현", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 18
    }
    
    private lazy var tagContainerView = UIView().then {
        $0.backgroundColor = .black
        
        let stack = UIStackView(arrangedSubviews: [tagButton1, tagButton2, tagButton3])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
        tagButton1.snp.makeConstraints { make in
            make.height.equalTo(36)
        }
        
        $0.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(22)
        }
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [textFieldContainerView]).then {
        $0.axis = .vertical
        $0.spacing = 0
        textFieldContainerView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        $0.addArrangedSubview(tagContainerView)
        tagContainerView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        tagContainerView.isHidden = true
    }
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    private func configureUI() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [tagButton1, tagButton2, tagButton3].forEach {
            $0.addTarget(self, action: #selector(tagButtonDidtap(sender: )), for: .touchUpInside)
        }
    }
    
    @objc func tagButtonDidtap(sender: UIButton) {
        textField.text = sender.currentTitle
    }
    
    
    // 스택뷰에 서브 뷰 추가
    private func addMoreView() {
        self.stackView.addArrangedSubview(tagContainerView)
        tagContainerView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        
        tagContainerView.isHidden = false
    }
    
    func onRemove(_ view: UIView) {
        if let first = self.stackView.arrangedSubviews.first(where: { $0 === view }) {
            UIView.animate(withDuration: 0.2, animations: {
                first.isHidden = true
                first.removeFromSuperview()
            }) { (_) in
                self.layoutIfNeeded()
            }
        }
    }
    
    
}


extension CustomTextFieldView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //addMoreView()
        UIView.animate(withDuration: 0.2) {
            self.tagContainerView.isHidden = false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //onRemove(tagContainerView)
        UIView.animate(withDuration: 0.2) {
            self.tagContainerView.isHidden = true
        }
    }
}
