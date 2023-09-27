
import SwiftUI
import AVKit

struct MatchView: View {
    
    let match: Match
    let firstPlayer: AVPlayer?
    @State var players: [Int:AVPlayer] = [:]
    @State var selectedTab: Int = 0
    let preload = 2
    
    var body: some View {
        let homeName = match.wscGame?.homeTeamName ?? "?"
        let awayName = match.wscGame?.awayTeamName ?? "?"
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text("\(homeName) - \(awayName)")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(.gray.opacity(0.2))
            
            if let pages = match.wscGame?.primeStory?.pages {
                GeometryReader { proxy in
                    TabView(selection: $selectedTab) {
                        ForEach(0..<pages.count, id:\.self) { i in
                            let page = pages[i]
                            PageView(page: page, player: players[i])
                                .frame(width: proxy.size.width, height: proxy.size.height)
                                .rotationEffect(.degrees(-90))
                        }
                    }
                    .frame(width: proxy.size.height, height: proxy.size.width)
                    .rotationEffect(.degrees(90), anchor: .topLeading)
                    .offset(x: proxy.size.width)
                    .onChange(of: selectedTab) { tab in
                        loadVideos(pages)
                    }
                    .onAppear {
                        players[0] = firstPlayer
                        loadVideos(pages)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            }
            else {
                Text(.nothing_to_show)
            }
            
            Spacer()
        }
    }
    
    func loadVideos(_ pages: [Page]) {
        for i in 0..<pages.count {
            if i < 0 || i > pages.count - 1 {
                continue
            }
            
            if i - selectedTab > preload || selectedTab - i > preload {
                players[i] = nil
            }
            else {
                loadVideoForPage(pages, i)
            }
        }
    }
    
    func loadVideoForPage(_ pages: [Page], _ i: Int) {
        if i < 0 {
            return
        }
        if i > pages.count - 1 {
            return
        }
        if players[i] != nil {
            return
        }
        let page = pages[i]
        guard let videoUrl = page.videoUrl else {
            return
        }
        guard let url = URL(string: videoUrl) else {
            return
        }
        players[i] = AVPlayer(url:  url)
    }
    
}
