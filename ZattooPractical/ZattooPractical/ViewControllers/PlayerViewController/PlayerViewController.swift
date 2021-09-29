//
//  PlayerViewController.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import UIKit
import AVFoundation
import AVKit

class PlayerViewController: UIViewController {
    
    @IBOutlet private weak var play: UIButton!
    @IBOutlet private weak var back: UIButton!
    @IBOutlet private weak var videoView: UIView!
    @IBOutlet private weak var currentTimeLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var timeSlider: UISlider!
    
    var playerViewModel : PlayerViewModelType?
    private var playerLayer: AVPlayerLayer?
    
    private typealias Operator = (_ current: Double, _ new: Double) -> Double
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer()
        subscribeEvent()
    }
    
    private func createPlayer() {
        guard let playerViewModel = playerViewModel else { return }
        guard let url = URL(string : playerViewModel.url) else { return }
        print(url.absoluteString)
        let asset = AVAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: item)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        DispatchQueue.main.async {
            self.playerLayer?.frame = self.videoView.bounds
        }
        guard let playerLayer = playerLayer else { return }
        videoView.layer.addSublayer(playerLayer)
        DispatchQueue.main.async {
            self.play.isSelected = true
            self.playPause(isPlay: true)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("Rotate")
        DispatchQueue.main.async {
            self.playerLayer?.frame = self.videoView.bounds
        }
    }
    
    private func forwardBackword(_ time: Double){
        let currentTime = currentTimeDouble()
        let newTime = newTime(currentTime, difference: time)
        let time = makeTime(newTime: newTime)
        seek(time)
    }
    
    private func playPause( isPlay: Bool){
        isPlay ? self.playerLayer?.player?.play() : self.playerLayer?.player?.pause()
    }
    
    private func seek(_ time: CMTime) {
        self.playerLayer?.player?.seek(to: time)
    }
}

extension PlayerViewController {
    @IBAction private func backButton(_ sender: UIButton) {
        appMovedToBackground()
    }
    
    @IBAction private func playButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        playPause(isPlay: sender.isSelected)
    }
    
    @IBAction private func fastForward(_ sender: UIButton) {
        forwardBackword(0.5)
    }
    
    @IBAction private func goBackwards(_ sender: UIButton) {
        forwardBackword(-0.5)
    }
    
    @IBAction private func timeSliderChanged(_ sender: UISlider) {
        let time = makeTime(newTime: Double(sender.value))
        seek(time)
    }
}

extension PlayerViewController {
    private func makeTime(newTime: Double) -> CMTime {
        return CMTimeMake(value: Int64(newTime * 1000), timescale: 1000)
    }
    
    private func newTime(_ current: Double, difference: Double) -> Double {
        let newTime = current + difference
        return newTime < 0 ? 0 : newTime
    }
    
    private func currentTimeDouble() -> Double {
        guard let current = self.playerLayer?.player?.currentTime() else { return 0.0 }
        return CMTimeGetSeconds(current)
    }
    
    private func getTimeString(from time: CMTime) -> String {
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds/3600)
        let minutes = Int(totalSeconds/60) % 60
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours,minutes,seconds])
        } else {
            return String(format: "%02i:%02i", arguments: [minutes,seconds])
        }
    }
}

extension PlayerViewController {
    private func subscribeEvent(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willTerminateNotification, object: nil)
        self.playerLayer?.player?.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        addTimeObserver()
    }
    
    private func addTimeObserver(){
        let interval = CMTime(seconds: 1, preferredTimescale: 90000)
        let concurrentQueue = DispatchQueue(label: "TimeUpdating", attributes: .concurrent)
        self.playerLayer?.player?.addPeriodicTimeObserver(forInterval: interval, queue: concurrentQueue) { [weak self] time in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.timeSlider.value = Float(time.seconds*0.001)
                self.currentTimeLabel.text = self.getTimeString(from: time)
            }
        }
    }
    
    @objc private func appMovedToBackground() {
        playPause(isPlay: false)
        playerLayer = nil
        closeSessionAndWatch()
        playerViewModel?.pop()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        if keyPath == "duration", let duration = self.playerLayer?.player?.currentItem?.duration.seconds, duration > 0.0 {
            self.timeLabel.text = getTimeString(from: (self.playerLayer?.player?.currentItem?.duration)!)
        }
    }
    
    private func closeSessionAndWatch() {
        playerViewModel?.stopWatch()
        playerViewModel?.stopSession()
    }
}
