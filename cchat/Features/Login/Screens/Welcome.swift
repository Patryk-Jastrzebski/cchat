//
//  Welcome.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

import SwiftUI
import AVKit
import AVFoundation

struct Welcome: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            GeometryReader { geo in
                ZStack {
                    PlayerView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height + 100)
                        .overlay(Color.black.opacity(0.2))
                        .blur(radius: 1)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            VStack {
                Spacer()
                Text("CCHAT")
                    .fontWeight(.bold)
                    .font(.system(size: 48))
                Text("meet people around the world")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                Spacer()
                loginButtonStating
            }
        }
        .onAppear {
            dismiss()
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
            .preferredColorScheme(.dark)
    }
}

extension Welcome {
    private var loginButtonStating: some View {
        NavigationLink {
            Email()
        } label: {
            Text(Strings.Welcome.loginButton)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.white)
                .cornerRadius(15)
                .padding()
        }
    }
    
    private var registerButton: some View {
        NavigationLink(destination: {}, label: {
            Text(Strings.Welcome.registerButton)
                .fontWeight(.semibold)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        })
    }
}

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let fileUrl = Bundle.main.url(forResource: "onBoardingVideo", withExtension: "mp4") else { return }
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        let player = AVQueuePlayer()
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
