//
//  HomeController.swift
//  Library-Test
//
//  Created by sejin on 2022/07/06.
//

import UIKit
import Tabman
import Pageboy
import SnapKit

class HomeController: UIViewController {
    
    var viewControllers: [UIViewController] = [FirstViewController(), SecondViewController(), ThirdViewController()]
    let secondVC = SecondViewController()
    
    // Custom View Pager UI
    private lazy var customViewPager = CustomViewPager(viewControllers: [FirstViewController(), secondVC, ThirdViewController()])
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let blankView1 = ActionInjectionTestView {
        print("프린트는 찍히네")
    }
    private let blankView2 = UIView()
    
    private let calendarView = CustomCalendarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondVC.delegate = self
        configureScrollView()
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        //configureGradientLayer()
        view.backgroundColor = .gray
        scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.snp.width)
            make.height.greaterThanOrEqualTo(scrollView.snp.height).priority(500)
        }
        
        
        contentView.addSubview(customViewPager)
        customViewPager.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(200)
        }
        //특정 페이지로 바로 가도록 설정
        //customViewPager.scrollToIndex(indexOf: 2)
        
        contentView.addSubview(blankView1)

        blankView1.snp.makeConstraints { make in
            make.top.equalTo(customViewPager.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(400)
        }
        
        contentView.addSubview(blankView2)
        blankView2.backgroundColor = .green
        blankView2.snp.makeConstraints { make in
            make.top.equalTo(blankView1.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(400)
        }
        
        contentView.addSubview(calendarView)
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(blankView2.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(400)
            make.bottom.equalToSuperview().inset(100)
        }
        
    }
    
    // 배경색 그라데이션으로 만들기
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 0.3]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        scrollView.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

extension HomeController: SecondViewControllerDelegate {
    func presentImagePicker() {

        let imagPickUp = UIImagePickerController()
        
        let ActionSheet = UIAlertController(title: nil, message: "Select Photo", preferredStyle: .actionSheet)

        let cameraPhoto = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
                
                imagPickUp.mediaTypes = ["public.image"]
                imagPickUp.sourceType = UIImagePickerController.SourceType.camera;
                imagPickUp.allowsEditing = true
                self.present(imagPickUp, animated: true, completion: nil)
            }
            else{
                UIAlertController(title: "iOSDevCenter", message: "No Camera available.", preferredStyle: .alert).show(self, sender: nil);
            }
            
        })
        
        let PhotoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
            (alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                imagPickUp.mediaTypes = ["public.image"]
                imagPickUp.sourceType = UIImagePickerController.SourceType.photoLibrary;
                imagPickUp.allowsEditing = true
                imagPickUp.modalPresentationStyle = .fullScreen
                self.present(imagPickUp, animated: true, completion: nil)
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction) -> Void in
            
        })
        
        ActionSheet.addAction(cameraPhoto)
        ActionSheet.addAction(PhotoLibrary)
        ActionSheet.addAction(cancelAction)
        self.present(ActionSheet, animated: true)
    }
}
