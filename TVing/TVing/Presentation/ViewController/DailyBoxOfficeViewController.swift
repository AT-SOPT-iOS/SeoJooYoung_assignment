//
//  DailyBoxOfficeViewController.swift
//  TVing
//
//  Created by seozero on 5/9/25.
//

import UIKit

import SnapKit
import Then

class DailyBoxOfficeViewController: UIViewController {
    
    private var movies: [DailyBoxOffice] = []
    
    private let dateTextField = UITextField()
    private let searchButton = UIButton(type: .system)
    private let dateSearchStackView = UIStackView()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setStyle()
        setHierarchy()
        setLayout()
        setDelegate()
        setAddTarget()
        setRegister()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        dateTextField.do {
            $0.placeholder = "날짜 (yyyyMMdd)"
            $0.borderStyle = .roundedRect
            $0.keyboardType = .numberPad
        }
        
        searchButton.do {
            $0.setTitle("검색", for: .normal)
        }
        
        dateSearchStackView.do {
            [dateTextField, searchButton].forEach {
                dateSearchStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 10
            $0.distribution = .fillProportionally
        }
        
    }
    
    private func setHierarchy() {
        view.addSubview(dateSearchStackView)
        view.addSubview(tableView)
    }
    
    private func setLayout() {
        dateSearchStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        dateTextField.snp.makeConstraints {
            $0.width.equalTo(200)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(dateSearchStackView.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setAddTarget() {
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        
    }
    
    private func setRegister() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    @objc
    private func searchTapped() {
        guard let date = dateTextField.text, date.count == 8 else {
            print("잘못된 날짜 형식 ㅋㅋ")
            return
        }
        
        Task {
            do {
                let response = try await DailyBoxOfficeService.shared.fetchDailyBoxOffice(for: date)
                
                let alert = UIAlertController(
                    title: "성공",
                    message: "\(date)의 박스오피스 불러오기 성공했습니다.",
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(
                    title: "확인",
                    style: .default
                )
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                self.movies = response
                self.tableView.reloadData()
            } catch {
                let alert = UIAlertController(
                    title: "실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(
                    title: "확인",
                    style: .default
                )
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("불러오기 에러:", error)
            }
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension DailyBoxOfficeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return movies.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(movie.rank)위 - \(movie.movieNm)\n관객수: \(movie.audiCnt)"
        return cell
    }
}
