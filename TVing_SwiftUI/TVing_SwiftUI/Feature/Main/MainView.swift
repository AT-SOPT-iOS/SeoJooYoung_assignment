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

#Preview {
    MainView()
}
