//
//  MainView.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/28/25.
//

import SwiftUI

struct MainView: View {
    private var top20Model = Top20Model.dummy()
    private var popularLiveModel = PopularLiveModel.dummy()
    private var popularMovieModel = PopularMovieModel.dummy()
    private var baseballTeamModel = BaseballTeamModel.dummy()
    private var contentCategoryModel = ContentCategoryModel.dummy()
    private var pdFavoriteModel = PDFavoriteModel.dummy()
    
    var body: some View {
        ZStack {
            Color.tvingBlack.ignoresSafeArea()
            VStack {
                HeaderView()
                SegmentedControlView()
                    .padding(.bottom, 7)
                
                ScrollView {
                    Image(.yourName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom, 9)
                    
                    Top20View(top20List: top20Model)
                    PopularLiveView(popularLiveList: popularLiveModel)
                    PopularMovieView(popularMovieList: popularMovieModel)
                    BaseballTeamView(baseballTeamList: baseballTeamModel)
                    ContentCategoryView(contentCategoryList: contentCategoryModel)
                    PDFavoriteView(pdFavoriteList: pdFavoriteModel)
                    NoticeView()
                    FooterView()
                }
            }
            
        }
    }
}

// MARK: - HeaderView
fileprivate struct HeaderView: View {
    var body: some View {
        HStack {
            Image(.mainLogo)
            Spacer()
            Button {
                
            } label: {
                Image(.search)
            }
            .padding(.trailing, 10)
            Button {
                
            } label: {
                Image(.profile)
            }
        }
        .padding(.trailing, 11)
    }
}

// MARK: - SegmentedControlView
fileprivate struct SegmentedControlView: View {
    @State private var mainSelection = 0
    @Namespace private var indicatorNamespace
    
    let mainSegments = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<mainSegments.count, id: \.self) { index in
                    Button {
                        withAnimation { mainSelection = index }
                    } label: {
                        VStack {
                            Text(mainSegments[index])
                                .font(.pretendard(size: 17, weight: .regular))
                                .foregroundStyle(.tvingWhite)
                                .padding(.bottom, 7)
                            
                            if mainSelection == index {
                                Rectangle()
                                    .frame(height: 3)
                                    .foregroundStyle(.tvingWhite)
                                    .matchedGeometryEffect(id: "indicator", in: indicatorNamespace)
                            } else {
                                Rectangle()
                                    .frame(height: 3)
                                    .foregroundStyle(.clear)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

// MARK: - Top20View
fileprivate struct Top20View: View {
    let top20List: [Top20Model]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 티빙 TOP 20")
                .font(.pretendard(size: 15, weight: .bold))
                .foregroundStyle(.tvingWhite)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(top20List) { item in
                        Top20Cell(index: item.rank, image: item.image)
                    }
                }
            }
        }
        .padding(.leading, 12)
        .padding(.bottom, 18)
    }
}

fileprivate struct Top20Cell: View {
    var index: Int
    var image: Image
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("\(index)")
                .italic()
                .font(.system(size: 50, weight: .semibold))
                .foregroundStyle(.tvingWhite)
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 98, height: 146)
        }
    }
}

// MARK: - PopularLiveView
fileprivate struct PopularLiveView: View {
    let popularLiveList: [PopularLiveModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("실시간 인기 LIVE")
                    .font(.pretendard(size: 15, weight: .bold))
                    .foregroundStyle(.tvingWhite)
                Spacer()
                Text("더보기")
                    .font(.pretendard(size: 12, weight: .medium))
                    .foregroundStyle(.tvingGray2)
                    .underline()
            }
            .padding(.trailing, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 7) {
                    ForEach(popularLiveList) { item in
                        PopularLiveCell(
                            image: item.image,
                            rank: item.rank,
                            channel: item.channel,
                            programName: item.programName,
                            rate: item.rate
                        )
                    }
                }
            }
        }
        .padding(.leading, 12)
    }
}

fileprivate struct PopularLiveCell: View {
    var image: Image
    var rank: Int
    var channel: String
    var programName: String
    var rate: Float
    
    var body: some View {
        VStack(alignment: .leading) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .frame(width: 160, height: 80)
            HStack {
                Text("\(rank)")
                    .italic()
                    .font(.system(size: 19, weight: .bold))
                    .foregroundStyle(.tvingWhite)
                VStack(alignment: .leading) {
                    Text(channel)
                        .font(.pretendard(size: 10, weight: .medium))
                        .foregroundStyle(.tvingWhite)
                    Text(programName)
                        .font(.pretendard(size: 10, weight: .regular))
                        .foregroundStyle(.tvingGray2)
                    Text("\(rate.convertToOneDecimalString)%")
                        .font(.pretendard(size: 10, weight: .regular))
                        .foregroundStyle(.tvingGray2)
                }
            }
            .padding(.leading, 6)
        }
        .padding(.bottom, 18)
    }
}

// MARK: - PopularMovieView
fileprivate struct PopularMovieView: View {
    let popularMovieList: [PopularMovieModel]
    
    var body: some View {
        VStack {
            HStack {
                Text("실시간 인기 영화")
                    .font(.pretendard(size: 15, weight: .bold))
                    .foregroundStyle(.tvingWhite)
                Spacer()
                Text("더보기")
                    .font(.pretendard(size: 12, weight: .medium))
                    .foregroundStyle(.tvingGray2)
                    .underline()
            }
            .padding(.trailing, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(popularMovieList) { item in
                        item.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 98, height: 146)
                    }
                }
            }
        }
        .padding(.leading, 12)
        .padding(.bottom, 28)
    }
}

// MARK: - BaseballTeamView
fileprivate struct BaseballTeamView: View {
    let baseballTeamList: [BaseballTeamModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(
                    Array(baseballTeamList.enumerated()),
                    id: \.element.id
                ) { index, item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 2)
                            .foregroundStyle(index % 2 == 0 ? .tvingWhite : .tvingBlack)
                            .frame(width: 80, height: 50)
                        item.teamImage
                    }
                }
            }
        }
        .padding(.bottom, 28)
    }
}

// MARK: - ContentCategoryView
fileprivate struct ContentCategoryView: View {
    let contentCategoryList: [ContentCategoryModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 7) {
                ForEach(contentCategoryList) { item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundStyle(.tvingGray4)
                            .frame(width: 90, height: 45)
                        item.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 68)
                    }
                }
            }
        }
        .padding(.leading, 15)
        .padding(.bottom, 25)
    }
}

// MARK: - PDFavoriteView
fileprivate struct PDFavoriteView: View {
    let pdFavoriteList: [PDFavoriteModel]
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("김가현PD의 인생작 TOP 5")
                    .font(.pretendard(size: 15, weight: .bold))
                    .foregroundStyle(.tvingWhite)
                Spacer()
                
                HStack(spacing: 4) {
                    ForEach(0..<pdFavoriteList.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.tvingWhite : Color.gray.opacity(0.5))
                            .frame(width: 6, height: 6)
                    }
                }
                .padding(.trailing, 10)
            }
            
            PDListView(pdFavoriteList: pdFavoriteList, currentPage: $currentPage)
            
        }
        .padding(.leading, 12)
        .padding(.bottom, 23)
    }
}

fileprivate struct PDListView: View {
    let pdFavoriteList: [PDFavoriteModel]
    @Binding var currentPage: Int
    
    var body: some View {
        GeometryReader { outerGeo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    // 원래는 pdFavoriteList.enumerated()로 썼었는데, 계속 type check 에러가 떠서 .. 변경함
                    // Array(zip(pdFavorite.indices, pdFavoriteList))
                    // => [ (index, item) ] 형식의 배열을 만듦
                    // \.1.id
                    // => 튜플의 두 번째 요소인 item의 id를 id로 쓰겠단 말씀 !
                    // 튜플로 안 만들었다면, ForEach(pdFavoriteList, id: \.id) 와 같이도 가능함
                    ForEach(
                        Array(zip(pdFavoriteList.indices, pdFavoriteList)),
                        id: \.1.id
                    ) { index, item in
                        GeometryReader { geo in
                            ZStack {
                                item.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 160, height: 90)
                                    .clipShape(RoundedRectangle(cornerRadius: 3))
                            }
                            .onAppear {
                                checkPageChanged(geo: geo, outerGeo: outerGeo, index: index)
                            }
                            .onChange(of: geo.frame(in: .global).midX) {
                                checkPageChanged(geo: geo, outerGeo: outerGeo, index: index)
                            }
                        }
                        .frame(width: 160, height: 90)
                    }
                }
            }
        }
        .frame(height: 90)
    }
    
    private func checkPageChanged(geo: GeometryProxy, outerGeo: GeometryProxy, index: Int) {
        let cardFrame = geo.frame(in: .global)
        let outerFrame = outerGeo.frame(in: .global)

        let itemLeft = cardFrame.minX
        let itemRight = cardFrame.maxX
        let targetX = outerFrame.minX + 12 + 160 / 2

        let isPageChanged = itemLeft < targetX && itemRight > targetX

        if isPageChanged {
            if currentPage != index {
                DispatchQueue.main.async {
                    currentPage = index
                }
            }
        }
    }
}

// MARK: - FooterView
fileprivate struct NoticeView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.tvingGray4)
            
            HStack(spacing: 8) {
                Text("공지")
                    .foregroundStyle(.tvingGray2)
                Text("티빙 계정 공유 정책 추가 안내")
                    .foregroundStyle(.tvingGray1)
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 18, height: 18)
                    .foregroundStyle(.tvingWhite)
            }
            .font(.pretendard(size: 11, weight: .medium))
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .padding(.horizontal, 14)
        .padding(.bottom, 13)
    }
}

fileprivate struct FooterView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("고객문의")
                    Circle()
                        .frame(width: 2, height: 2)
                    Text("이용약관")
                    Circle()
                        .frame(width: 2, height: 2)
                    Text("개인정보처리방침")
                        .foregroundStyle(.tvingGray1)
                }
                HStack {
                    Text("사업자정보")
                    Circle()
                        .frame(width: 2, height: 2)
                    Text("인재채용")
                }
            }
            .foregroundStyle(.tvingGray2)
            .font(.pretendard(size: 11, weight: .medium))
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 99)
    }
}

#Preview {
    MainView()
}
