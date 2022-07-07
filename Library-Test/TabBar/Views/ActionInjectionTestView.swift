//
//  ActionInjectionTestView.swift
//  Library-Test
//
//  Created by sejin on 2022/07/07.
//

import UIKit

class ActionInjectionTestView: UIView {

    private let testButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("됐나?", for: .normal)
        return btn
    }()
    
    init(action:  @escaping ()->Void) {
        super.init(frame: .zero)
        backgroundColor = .purple
        
        addSubview(testButton)
        testButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
        testButton.addAction(UIAction(handler: { _ in
            action()
        }), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
