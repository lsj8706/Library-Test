//
//  CustomViewPager.swift
//  Library-Test
//
//  Created by sejin on 2022/07/07.
//

import UIKit
import Tabman
import Pageboy
import SnapKit

final class CustomViewPager: UIView {
    //MARK: - Properties
    var viewControllers: [UIViewController]
    
    //MARK: - UI
    private let tabMan = TabmanViewController()
    
    //MARK: - View Life Cycle
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        super.init(frame: .zero)
        configureUI()
        setViewPager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func configureUI() {
        tabMan.view.frame = self.frame
        addSubview(tabMan.view)
        tabMan.dataSource = self
    }
    
    private func setViewPager() {
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.alignment = .centerDistributed // .center시 선택된 탭이 가운데로 오게 됨.
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 0
        bar.buttons.customize { button in
            button.backgroundColor = .black
            button.tintColor = .white
            button.selectedTintColor = .orange
            // button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        bar.indicator.tintColor = .orange
        bar.indicator.weight = .custom(value: 1)
        
        // Add to view
        tabMan.addBar(bar, dataSource: self, at: .top)
    }
}

extension CustomViewPager: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "#Page \(index)")
        return item
    }
}
