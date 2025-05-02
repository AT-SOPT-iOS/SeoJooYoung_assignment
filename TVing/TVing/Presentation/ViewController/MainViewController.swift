//
//  MainViewController.swift
//  TVing
//
//  Created by seozero on 4/30/25.
//

import UIKit
import SnapKit
import Then

final class MainViewController: UIViewController {
    
    // MARK: - Property
    private let top20Data = Top20Model.dummy()
    private let popularLiveData = PopularLiveModel.dummy()
    private let popularMovieData = PopularMovieModel.dummy()
    private let baseBallTeamData = BaseBallTeamModel.dummy()
    private let contentsCategoryData = ContentsCategoryModel.dummy()
    private let pdFavoriteWorkData = PDFavoriteWorkModel.dummy()
    
    // MARK: - UI Property
    private let logoImageView = UIImageView()
    private let searchButton = UIButton()
    private let profileButton = UIButton()
    private let tabbarView = UISegmentedControl()
    private let tabbarUnderLineView = UIView()
    private let tabbarDividerView = UIView()
    
    private let mainScrollView = UIScrollView()
    private let mainScrollContentView = UIView()
    
    private let mainMovieImageView = UIImageView()
    
    private let top20Label = UILabel()
    private let top20CollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let popularLiveLabel = UILabel()
    private let popularLiveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let popularMovieLabel = UILabel()
    private let popularMovieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let baseBallTeamCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let contentsCategoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let pdFavoriteWorkLabel = UILabel()
    private let pdFavoriteWorkCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let noticeLabel = UILabel()
    private let noticeTitleLabel = UILabel()
    private let noticeMoreImageView = UIImageView()
    private let noticeTextStackView = UIStackView()
    private let noticeView = UIView()
    
    private let customerSupportLabel = UILabel()
    private let termsOfServiceLabel = UILabel()
    private let privacyPolicyLabel = UILabel()
    
    private let businessInfoLabel = UILabel()
    private let recruitLabel = UILabel()
        
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setCollectionTag()
        register()
        setDelegate()
        setCollectionViewLayout()
    }
    
    // MARK: - UI Setting
    
    private func setStyle() {
        logoImageView.do {
            $0.image = .mainLogo
        }
        
        searchButton.do {
            $0.setImage(.search, for: .normal)
        }
        
        profileButton.do {
            $0.setImage(.profile, for: .normal)
        }
        
        tabbarView.do {
            $0.selectedSegmentTintColor = .white
            $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
            $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            
            // enumerated() : 배열에서 각 요소와 인덱스까지 가져올 수 있게 함
            ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"].enumerated().forEach { index, title in
                tabbarView.insertSegment(withTitle: title, at: index, animated: true)
            }
            $0.selectedSegmentIndex = 0
            $0.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.pretendard(size: 17, weight: .regular)
            ], for: .normal)
            $0.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.pretendard(size: 17, weight: .regular)
            ], for: .selected)
        }
        
        tabbarUnderLineView.do {
            $0.backgroundColor = .white
        }
        
        tabbarDividerView.do {
            $0.backgroundColor = .gray4
        }
        
        mainScrollView.do {
            $0.isScrollEnabled = true
        }
        
        mainMovieImageView.do {
            $0.image = .yourName
        }
        
        top20Label.do {
            $0.text = "오늘의 티빙 TOP 20"
            $0.textColor = .white
            $0.font = .pretendard(size: 15, weight: .bold)
        }
        
        top20CollectionView.do {
            $0.backgroundColor = .black
        }
        
        popularLiveLabel.do {
            $0.text = "실시간 인기 LIVE"
            $0.textColor = .white
            $0.font = .pretendard(size: 15, weight: .bold)
        }
        
        popularLiveCollectionView.do {
            $0.backgroundColor = .black
        }
        
        popularMovieLabel.do {
            $0.text = "실시간 인기 영화"
            $0.textColor = .white
            $0.font = .pretendard(size: 15, weight: .bold)
        }
        
        popularMovieCollectionView.do {
            $0.backgroundColor = .black
        }
        
        baseBallTeamCollectionView.do {
            $0.backgroundColor = .black
        }
        
        contentsCategoryCollectionView.do {
            $0.backgroundColor = .black
        }
        
        pdFavoriteWorkLabel.do {
            $0.text = "김가현PD의 인생작 TOP 5"
            $0.textColor = .white
            $0.font = .pretendard(size: 15, weight: .bold)
        }
        
        pdFavoriteWorkCollectionView.do {
            $0.backgroundColor = .black
        }
        
        noticeLabel.do {
            $0.text = "공지"
            $0.textColor = .gray2
            $0.font = .pretendard(size: 11, weight: .medium)
        }
        
        noticeTitleLabel.do {
            $0.text = "티빙 계정 공유 정책 추가 안내"
            $0.textColor = .gray1
            $0.font = .pretendard(size: 11, weight: .medium)
        }
        
        noticeMoreImageView.do {
            $0.image = UIImage(systemName: "chevron.right")
            $0.tintColor = .white
            $0.contentMode = .scaleAspectFit
        }
        
        noticeView.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 5
        }
        
        customerSupportLabel.do {
            $0.text = "고객문의"
            $0.textColor = .gray2
            $0.font = .pretendard(size: 11, weight: .medium)
        }
        
        termsOfServiceLabel.do {
            $0.text = "이용약관"
            $0.textColor = .gray2
            $0.font = .pretendard(size: 11, weight: .medium)
        }
        
        privacyPolicyLabel.do {
            $0.text = "개인정보처리방침"
            $0.textColor = .gray1
            $0.font = .pretendard(size: 11, weight: .medium)
        }
        
        businessInfoLabel.do {
            $0.text = "사업자정보"
            $0.textColor = .gray2
            $0.font = .pretendard(size: 11, weight: .medium)
        }
        
        recruitLabel.do {
            $0.text = "인재채용"
            $0.textColor = .gray2
            $0.font = .pretendard(size: 11, weight: .medium)
        }
    }
    
    private func setLayout() {
        view.backgroundColor = .black
        
        let headerButtonStackView = UIStackView(arrangedSubviews: [searchButton, profileButton])
        headerButtonStackView.axis = .horizontal
        headerButtonStackView.distribution = .fillProportionally
        headerButtonStackView.spacing = 10
        
        let headerStackView = UIStackView(arrangedSubviews: [logoImageView, headerButtonStackView])
        headerStackView.axis = .horizontal
        headerStackView.distribution = .fillProportionally
        headerStackView.spacing = 130
        headerStackView.alignment = .center
        
        view.addSubview(headerStackView)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(78)
        }
        
        searchButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
        
        profileButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
        
        view.addSubview(tabbarView)
        view.addSubview(tabbarUnderLineView)
        view.addSubview(tabbarDividerView)
        tabbarView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(headerStackView.snp.bottom)
            $0.height.equalTo(42)
        }
        
        tabbarUnderLineView.snp.makeConstraints {
            $0.top.equalTo(tabbarView.snp.bottom).offset(7)
            $0.width.equalTo(15)
            $0.height.equalTo(3)
            $0.leading.equalTo(tabbarView.snp.leading).offset(26)
        }
        
        tabbarDividerView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(tabbarUnderLineView.snp.bottom)
        }
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainScrollContentView)
        
        [mainMovieImageView, top20Label, top20CollectionView, popularLiveLabel, popularLiveCollectionView, popularMovieLabel, popularMovieCollectionView, baseBallTeamCollectionView, contentsCategoryCollectionView, pdFavoriteWorkLabel, pdFavoriteWorkCollectionView, noticeView].forEach {
            mainScrollContentView.addSubview($0)
        }
        
        mainScrollView.snp.makeConstraints {
            $0.top.equalTo(tabbarDividerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        mainScrollContentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(mainScrollView.contentLayoutGuide)
            $0.width.equalTo(mainScrollView.frameLayoutGuide)
        }
        
        mainMovieImageView.snp.makeConstraints {
            $0.width.equalTo(mainScrollContentView.snp.width)
            $0.height.equalTo(570)
            $0.top.equalTo(mainScrollContentView.snp.top)
            $0.leading.equalTo(mainScrollContentView.snp.leading)
            $0.trailing.equalTo(mainScrollContentView.snp.trailing)
        }
        
        top20Label.snp.makeConstraints {
            $0.top.equalTo(mainMovieImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(12)
        }
        
        top20CollectionView.snp.makeConstraints {
            $0.top.equalTo(top20Label.snp.bottom).offset(10)
            $0.leading.equalTo(mainScrollContentView.snp.leading)
            $0.trailing.equalTo(mainScrollContentView.snp.trailing)
            $0.height.equalTo(146)
        }
        
        popularLiveLabel.snp.makeConstraints {
            $0.top.equalTo(top20CollectionView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(12)
        }
        
        popularLiveCollectionView.snp.makeConstraints {
            $0.top.equalTo(popularLiveLabel.snp.bottom).offset(10)
            $0.leading.equalTo(mainScrollContentView.snp.leading)
            $0.trailing.equalTo(mainScrollContentView.snp.trailing)
            $0.height.equalTo(137)
        }
        
        popularMovieLabel.snp.makeConstraints {
            $0.top.equalTo(popularLiveCollectionView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(12)
        }
        
        popularMovieCollectionView.snp.makeConstraints {
            $0.top.equalTo(popularMovieLabel.snp.bottom).offset(10)
            $0.leading.equalTo(mainScrollContentView.snp.leading)
            $0.trailing.equalTo(mainScrollContentView.snp.trailing)
            $0.height.equalTo(146)
        }
        
        baseBallTeamCollectionView.snp.makeConstraints {
            $0.top.equalTo(popularMovieCollectionView.snp.bottom).offset(28)
            $0.leading.equalTo(mainScrollContentView.snp.leading)
            $0.trailing.equalTo(mainScrollContentView.snp.trailing)
            $0.height.equalTo(50)
        }
        
        contentsCategoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(baseBallTeamCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        pdFavoriteWorkLabel.snp.makeConstraints {
            $0.top.equalTo(contentsCategoryCollectionView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(12)
        }
        
        pdFavoriteWorkCollectionView.snp.makeConstraints {
            $0.top.equalTo(pdFavoriteWorkLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
        }
        
        [noticeLabel, noticeTitleLabel, noticeMoreImageView].forEach {
            noticeView.addSubview($0)
        }
        
        noticeView.snp.makeConstraints {
            $0.top.equalTo(pdFavoriteWorkCollectionView.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(14)
            $0.height.equalTo(50)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(16)
        }
        
        noticeTitleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(8)
        }
        
        noticeMoreImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(18)
        }
        
        
        let dividerDot1 = makeDividerDot()
        let dividerDot2 = makeDividerDot()
        
        let footerFirstStackView = UIStackView(arrangedSubviews: [customerSupportLabel, dividerDot1, termsOfServiceLabel, dividerDot2, privacyPolicyLabel])
        footerFirstStackView.axis = .horizontal
        footerFirstStackView.spacing = 3
        
        let dividerDot3 = makeDividerDot()
        
        let footerSecondStackView = UIStackView(arrangedSubviews: [businessInfoLabel, dividerDot3, recruitLabel])
        footerSecondStackView.axis = .horizontal
        footerSecondStackView.spacing = 3
        
        let footerTotalStackView = UIStackView(arrangedSubviews: [footerFirstStackView, footerSecondStackView])
        footerTotalStackView.axis = .vertical
        footerTotalStackView.spacing = 0
        footerTotalStackView.distribution = .fillEqually
        footerTotalStackView.alignment = .leading
    
        mainScrollContentView.addSubview(footerTotalStackView)
        
        footerTotalStackView.snp.makeConstraints {
            $0.top.equalTo(noticeView.snp.bottom).offset(12)
            $0.leading.equalTo(mainScrollContentView.snp.leading).offset(20)
            $0.trailing.equalTo(mainScrollContentView.snp.trailing)
            $0.bottom.equalToSuperview().inset(100)
        }
    }
    
    private func makeDividerDot() -> UILabel {
        let dot = UILabel()
        dot.text = "·"
        dot.textColor = .gray2
        return dot
    }
    
    // MARK: - Function
    
    private func setCollectionTag() {
        top20CollectionView.tag = 0
        popularLiveCollectionView.tag = 1
        popularMovieCollectionView.tag = 2
        baseBallTeamCollectionView.tag = 3
        contentsCategoryCollectionView.tag = 4
        pdFavoriteWorkCollectionView.tag = 5
    }
    
    private func register() {
        top20CollectionView.register(
            Top20CollectionViewCell.self,
            forCellWithReuseIdentifier: Top20CollectionViewCell.identifier
        )
        
        popularLiveCollectionView.register(
            PopularLiveCollectionViewCell.self,
            forCellWithReuseIdentifier: PopularLiveCollectionViewCell.identifier
        )
        
        popularMovieCollectionView.register(
            PopularMovieCollectionViewCell.self,
            forCellWithReuseIdentifier: PopularMovieCollectionViewCell.identifier
        )
        
        baseBallTeamCollectionView.register(
            BaseBallTeamCollectionViewCell.self,
            forCellWithReuseIdentifier: BaseBallTeamCollectionViewCell.identifier
        )
        
        contentsCategoryCollectionView.register(
            ContentsCategoryCollectionViewCell.self,
            forCellWithReuseIdentifier: ContentsCategoryCollectionViewCell.identifier
        )
        
        pdFavoriteWorkCollectionView.register(
            PDFavoriteWorkCollectionViewCell.self,
            forCellWithReuseIdentifier: PDFavoriteWorkCollectionViewCell.identifier
        )
    }
    
    private func setDelegate() {
        top20CollectionView.delegate = self
        top20CollectionView.dataSource = self
        
        popularLiveCollectionView.delegate = self
        popularLiveCollectionView.dataSource = self
        
        popularMovieCollectionView.delegate = self
        popularMovieCollectionView.dataSource = self
        
        baseBallTeamCollectionView.delegate = self
        baseBallTeamCollectionView.dataSource = self
        
        contentsCategoryCollectionView.delegate = self
        contentsCategoryCollectionView.dataSource = self
        
        pdFavoriteWorkCollectionView.delegate = self
        pdFavoriteWorkCollectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        // 원래 이렇게 하나의 flowLayout으로 세 개에 지정해주었는데,
        // 이렇게 하니까 레이아웃이 다 덮어씌워져서 delegate에서 따로 지정해주어도 다 동일한 레이아웃으로 바뀜
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        
//        top20CollectionView.setCollectionViewLayout(flowLayout, animated: true)
//        popularLiveCollectionView.setCollectionViewLayout(flowLayout, animated: true)
//        popularMovieCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        let top20CollectionViewFlowLayout = UICollectionViewFlowLayout()
        top20CollectionViewFlowLayout.scrollDirection = .horizontal
        top20CollectionView.setCollectionViewLayout(top20CollectionViewFlowLayout, animated: true)
        
        let popularLiveCollectionViewFlowLayout = UICollectionViewFlowLayout()
        popularLiveCollectionViewFlowLayout.scrollDirection = .horizontal
        popularLiveCollectionView.setCollectionViewLayout(popularLiveCollectionViewFlowLayout, animated: true)
        
        let popularMovieCollectionViewFlowLayout = UICollectionViewFlowLayout()
        popularMovieCollectionViewFlowLayout.scrollDirection = .horizontal
        popularMovieCollectionView.setCollectionViewLayout(popularMovieCollectionViewFlowLayout, animated: true)
        
        let baseBallTeamCollectionViewFlowLayout = UICollectionViewFlowLayout()
        baseBallTeamCollectionViewFlowLayout.scrollDirection = .horizontal
        baseBallTeamCollectionView.setCollectionViewLayout(baseBallTeamCollectionViewFlowLayout, animated: true)
        
        let contentsCategoryCollectionViewFlowLayout = UICollectionViewFlowLayout()
        contentsCategoryCollectionViewFlowLayout.scrollDirection = .horizontal
        contentsCategoryCollectionView.setCollectionViewLayout(contentsCategoryCollectionViewFlowLayout, animated: true)
        
        let pdFavoriteWorkCollectionViewFlowLayout = UICollectionViewFlowLayout()
        pdFavoriteWorkCollectionViewFlowLayout.scrollDirection = .horizontal
        pdFavoriteWorkCollectionView.setCollectionViewLayout(pdFavoriteWorkCollectionViewFlowLayout, animated: true)
    }
}

// MARK: - Extension


extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return top20Data.count
            
        case 1:
            return popularLiveData.count
            
        case 2:
            return popularMovieData.count
            
        case 3:
            return baseBallTeamData.count
            
        case 4:
            return contentsCategoryData.count
            
        case 5:
            return pdFavoriteWorkData.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Top20CollectionViewCell.identifier, for: indexPath) as? Top20CollectionViewCell else { return UICollectionViewCell() }
            cell.top20DataBind(top20Data[indexPath.item])
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularLiveCollectionViewCell.identifier, for: indexPath) as? PopularLiveCollectionViewCell else { return UICollectionViewCell() }
            cell.popularLiveDataBind(popularLiveData[indexPath.item])
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.identifier, for: indexPath) as? PopularMovieCollectionViewCell else { return UICollectionViewCell() }
            cell.popularMovieDataBind(popularMovieData[indexPath.item])
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseBallTeamCollectionViewCell.identifier, for: indexPath) as? BaseBallTeamCollectionViewCell else { return UICollectionViewCell() }
            
            let team = baseBallTeamData[indexPath.item]
            cell.baseBallTeamDataBind(team, at: indexPath.item)
            return cell
            
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsCategoryCollectionViewCell.identifier, for: indexPath) as? ContentsCategoryCollectionViewCell else { return UICollectionViewCell() }
            cell.contentsCategoryDataBind(contentsCategoryData[indexPath.item])
            return cell
            
        case 5:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PDFavoriteWorkCollectionViewCell.identifier, for: indexPath) as? PDFavoriteWorkCollectionViewCell else { return UICollectionViewCell() }
            cell.pdFavoriteWorkDataBind(pdFavoriteWorkData[indexPath.item])
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: 136, height: 146)
            
        case 1:
            return CGSize(width: 160, height: 137)
            
        case 2:
            return CGSize(width: 98, height: 146)
            
        case 3:
            return CGSize(width: 80, height: 50)
            
        case 4:
            return CGSize(width: 90, height: 45)
            
        case 5:
            return CGSize(width: 160, height: 90)
            
        default:
            return .zero
        }
    }
    
    private func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> Int {
        switch collectionView.tag {
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 0:
            return 20
            
        case 1:
            return 7
            
        case 2:
            return 0
            
        case 3:
            return 3
            
        case 4:
            return 7
            
        case 5:
            return 8
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView.tag {
        case 0:
            return UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
            
        case 1:
            return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
            
        case 2:
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            
        case 3:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        case 4:
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            
        case 5:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            
        default:
            return .zero
        }
    }
    
}

#Preview {
    MainViewController()
}
