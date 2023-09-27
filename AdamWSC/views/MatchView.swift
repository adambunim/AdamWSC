
import SwiftUI
import AVKit

struct MatchView: View {
    
    let match: Match
    let firstPlayer: AVPlayer?
    @State var players: [Int:AVPlayer] = [:]
    @State var selectedTab: Int = 0
    
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
                    .onChange(of: selectedTab) {
                        loadVideos(pages)
                    }
                    .onAppear {
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
        loadVideoForPage(pages, selectedTab)
        loadVideoForPage(pages, selectedTab + 1)
    }
    
    func loadVideoForPage(_ pages: [Page], _ i: Int) {
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
        print("loaded \(i)")
        players[i] = AVPlayer(url:  url)
    }
    
}
