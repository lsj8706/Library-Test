//
//  CalendarCollectionViewCell.swift
//  Library-Test
//
//  Created by sejin on 2022/07/08.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    static let identifier = "CalendarCollectionViewCell"
    
    let dayLabel = UILabel().then {
        $0.text = "1"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
