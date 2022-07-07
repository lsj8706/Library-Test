//
//  CustomCalendarView.swift
//  Library-Test
//
//  Created by sejin on 2022/07/07.
//

import UIKit
import Then

class CustomCalendarView: UIView {
    //MARK: - Properties
    var selectedDate = Date()
    var totalSquares = [String]()

    //MARK: - UI
    private lazy var monthLabel = UILabel().then {
        $0.text = "July 2022"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var sundayLabel = UILabel().then {
        $0.text = "일"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var mondayLabel = UILabel().then {
        $0.text = "월"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var tuesdayLabel = UILabel().then {
        $0.text = "화"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var wednesdayLabel = UILabel().then {
        $0.text = "수"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var thursdayLabel = UILabel().then {
        $0.text = "목"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var fridayLabel = UILabel().then {
        $0.text = "금"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var saturdayLabel = UILabel().then {
        $0.text = "토"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private lazy var dayOfWeekStackView = UIStackView(arrangedSubviews: [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel, thursdayLabel, fridayLabel, saturdayLabel]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    
    private let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    
    //MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        configureUI()
        setCollectionView()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func configureUI() {
        addSubview(monthLabel)
        monthLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        
        addSubview(dayOfWeekStackView)
        dayOfWeekStackView.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(calendarCollectionView)
        calendarCollectionView.snp.makeConstraints { make in
            make.top.equalTo(dayOfWeekStackView.snp.bottom).offset(10)
            make.trailing.bottom.leading.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CustomCalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dayLabel.text = totalSquares[indexPath.item]
        return cell
    }
}

extension CustomCalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 2) / 7
        let height = (collectionView.frame.size.height - 2) / 7
        
        return CGSize(width: width, height: height)
    }
}
