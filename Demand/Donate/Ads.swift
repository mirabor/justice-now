//
//  Ads.swift
//  Demand
//
//  Created by Mira Yu on 6/16/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

    import GoogleMobileAds
    import SwiftUI
    import UIKit

    struct Ads: UIViewControllerRepresentable {
        
        @EnvironmentObject var settings: UserSettings
        
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    
    typealias UIViewControllerType = UIViewController
        
        
        func makeUIViewController(context: Context) -> UIViewController {
        return ViewController(settings: settings, mode: presentationMode)
    }

    func updateUIViewController(_ uiView: UIViewController, context: Context) {
    }

    class ViewController: UIViewController, GADRewardedAdDelegate, AdManagerRewardDelegate {
        
    var rewardedAd: GADRewardedAd?
        
        var presentationMode: Binding<PresentationMode>
        var settings: UserSettings
        
        init(settings: UserSettings, mode: Binding<PresentationMode>) {
            self.settings = settings
            self.presentationMode = mode
            super.init(nibName: nil, bundle: nil)
        }
        
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
      
        
        @objc func triggerThisMethod(_ notification: NSNotification) {
                    // When the notification arrives, this method will be called
            settings.playAd = false
            settings.streakValue = Float(settings.adsWatched)/5
            settings.lastAdTime = Date()
            if settings.adsWatched >= (settings.dailyGoal+1) {
                settings.todayStreak = true
                }  else {
                settings.todayStreak = false
                           }
            
//                    if let object = notification.object {
//                        // If there is Object passed with notification you will get it here.
//                    }
                }
        
        @objc func adCompleted(_ notification: NSNotification) {
            settings.adsWatched += 1
        }
        
    override func viewDidLoad() {
    super.viewDidLoad()
        
        AdManager.shared.loadAndShowRewardAd(AdIds.rewarded.rawValue, viewController: self, settings: settings)
        AdManager.shared.delegateReward = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(triggerThisMethod), name: Notification.Name.ScoreUpdateNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(adCompleted), name: Notification.Name.completedNotification, object: nil)
        
        }
        

        func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
          print("Reward received: \(reward.type), amount \(reward.amount).")
        }
        
    }
    }
