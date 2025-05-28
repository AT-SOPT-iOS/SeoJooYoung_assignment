//
//  MainView.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/28/25.
//

import SwiftUI

struct MainView: View {
    
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
                    
                    Top20View()
                    PopularLiveView()
                    PopularMovieView()
                    BaseballTeamView()
                    ContentCategoryView()
                    PDFavoriteView()
                    NoticeView()
                    FooterView()
                }
            }
            
        }
    }
}

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

fileprivate struct SegmentedControlView: View {
    @State private var mainSelection = 0
    @Namespace private var indicatorNamespace
    
    let mainSegments = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    var body: some View {
        ScrollView(.horizontal) {
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

fileprivate struct Top20View: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 티빙 TOP 20")
                .font(.pretendard(size: 15, weight: .bold))
                .foregroundStyle(.tvingWhite)
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(1..<4) { index in
                        Top20Cell(index: index)
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
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("\(index)")
                .italic()
                .font(.system(size: 50, weight: .semibold))
                .foregroundStyle(.tvingWhite)
            Image(.signal)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 98, height: 146)
        }
    }
}

fileprivate struct PopularLiveView: View {
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
            
            ScrollView(.horizontal) {
                HStack(spacing: 7) {
                    PopularLiveCell()
                }
            }
        }
        .padding(.leading, 12)
    }
}

fileprivate struct PopularLiveCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(.exchange)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 3))
            HStack {
                Text("1")
                    .italic()
                    .font(.system(size: 19, weight: .bold))
                    .foregroundStyle(.tvingWhite)
                VStack(alignment: .leading) {
                    Text("JTBC")
                        .font(.pretendard(size: 10, weight: .medium))
                        .foregroundStyle(.tvingWhite)
                    Text("이혼숙려캠프 34화")
                        .font(.pretendard(size: 10, weight: .regular))
                        .foregroundStyle(.tvingGray2)
                    Text("27.2%")
                        .font(.pretendard(size: 10, weight: .regular))
                        .foregroundStyle(.tvingGray2)
                }
            }
            .padding(.leading, 6)
        }
        .padding(.bottom, 18)
    }
}

fileprivate struct PopularMovieView: View {
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
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    Image(.signal)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 98, height: 146)
                }
            }
        }
        .padding(.leading, 12)
        .padding(.bottom, 28)
    }
}

fileprivate struct BaseballTeamView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundStyle(.tvingWhite)
                        .frame(width: 80, height: 50)
                    Image(.samsungLions)
                }
            }
        }
        .padding(.bottom, 28)
    }
}

fileprivate struct ContentCategoryView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 7) {
                ZStack {
                    RoundedRectangle(cornerRadius: 3)
                        .foregroundStyle(.tvingGray4)
                        .frame(width: 90, height: 45)
                    Image(.appleTV)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 68)
                }
            }
        }
        .padding(.leading, 15)
        .padding(.bottom, 25)
    }
}

fileprivate struct PDFavoriteView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("김가현PD의 인생작 TOP 5")
                .font(.pretendard(size: 15, weight: .bold))
                .foregroundStyle(.tvingWhite)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    Image(.earthArcade)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                }
            }
        }
        .padding(.leading, 12)
        .padding(.bottom, 23)
    }
}

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
