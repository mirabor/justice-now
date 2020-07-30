//
//  AppDelegate.swift
//  Demand
//
//  Created by Mira Yu on 6/4/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds
import CDYelpFusionKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var settings = UserSettings()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        // update test keys to live keys before publishing
        
     settings.savedTimer = Timer.publish(every: 100, tolerance: 5, on: .main, in: .common).autoconnect()
        
        
         if UserDefaults.standard.bool(forKey: "didLaunchBefore") == false {
        //only runs the first time your app is launched
                  UserDefaults.standard.set(true, forKey: "didLaunchBefore")
       // sets the initial value for tomorrow at midnight
                  let now = Calendar.current.dateComponents(in: .current, from: Date())
                  let tomorrow = DateComponents(year: now.year, month: now.month, day: now.day! + 1, hour: 0, minute: 0, second: now.second)
                  let date = Calendar.current.date(from: tomorrow)
                  UserDefaults.standard.set(date, forKey: "tomorrow")
            print("Setting the initial value for tomorrow!")
         } else {
            print("It's not the first time you're launching")
        }
        
              if UserDefaults.standard.object(forKey: "tomorrow") != nil{//makes sure tomorrow is not nil
                  if Date() > UserDefaults.standard.object(forKey: "tomorrow") as! Date {// if todays date is after(greater than) the 24 hour period you set last time you reset your values this will run
        // reseting "tomorrow" to the actual tomorrow
                      let now = Calendar.current.dateComponents(in: .current, from: Date())
                      let tomorrow = DateComponents(year: now.year, month: now.month, day: now.day! + 1, hour: now.hour, minute: now.minute, second: now.second)
                      let date = Calendar.current.date(from: tomorrow)
                      UserDefaults.standard.set(date, forKey: "tomorrow")
                      //reset your values here
                    
                    settings.adsWatched = 0
                    
                    print("\(UserDefaults.standard.object(forKey: "adsWatched") ?? 0)")
                    UserDefaults.standard.set(0, forKey: "adsWatched")
                  } else {
                    print("It's still today, silly!")
                    print("\(UserDefaults.standard.object(forKey: "tomorrow") as! Date)")
                }
              }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

 // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Demand")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}



