//
//  CalendarController.swift
//  Library-Test
//
//  Created by sejin on 2022/07/06.
//

import UIKit

class CalendarController: UIViewController {
    
    private let calendarView = CustomCalendarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(calendarView)
        calendarView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(400)
        }
    }
}
