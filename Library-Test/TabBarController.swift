//
//  ViewController.swift
//  Library-Test
//
//  Created by sejin on 2022/07/06.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTabBar()
    }
    
    func configureTabBar() {
        view.backgroundColor = .black
        
        let homeVC = templateNavigationController(title: "홈", unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house")!, rootViewController: HomeController())
        
        let calendarVC = templateNavigationController(title: "캘린더", unselectedImage: UIImage(systemName: "calendar")!, selectedImage: UIImage(systemName: "calendar")!, rootViewController: CalendarController())
        
        let customViewTestVC = templateNavigationController(title: "테스트", unselectedImage: UIImage(systemName: "scribble")!, selectedImage: UIImage(systemName: "scribble")!, rootViewController: CustomViewTestController())
        
        
        viewControllers = [homeVC, calendarVC, customViewTestVC]
//        tabBar.barTintColor = .black
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .gray
        
        // 화면 스크롤을 하면 탭바 배경색이 view.backgroundColor로 바뀌는 문제 해결 코드
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        tabBar.scrollEdgeAppearance = appearance
        tabBar.standardAppearance = appearance
    }
    
    func templateNavigationController(title: String, unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.isHidden = true
        return nav
    }


}

