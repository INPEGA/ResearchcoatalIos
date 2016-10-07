//
//  AppDelegate.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 6/26/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit
import SwiftCSV
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
   
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //Fabric.with([Crashlytics.self])
        // Override point for customization after application launch.
        //let types: UIUserNotificationType = [UIUserNotificationType.Badge, UIUserNotificationType.Alert, UIUserNotificationType.Sound]
        //let settings: UIUserNotificationSettings = UIUserNotificationSettings( forTypes: types, categories: nil )
        //application.registerUserNotificationSettings( settings )
        //application.registerForRemoteNotifications()
        //GMSServices.provideAPIKey(googleMapsApiKey)
        
        //init data
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            deleteRealmIfMigrationNeeded: true,
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        Realm.Configuration.defaultConfiguration = config
        
        
        
        let researchs:Results<Research> = try! Realm().objects(Research.self)
        if(researchs.count==0) {
            init_data()
        }
        return true
    }
    
    func init_data() {
        
        do {
            let realm = try Realm()
            
            try! realm.write {realm.deleteAll()}
            let csv = try CSV(name: NSBundle.mainBundle().pathForResource("data", ofType: "csv")!)
            
            csv.enumerateAsDict { dict in
                
                let research = Research()
           
                research.register_code = dict["รหัสทะเบียนวิจัย"]! as String
                research.page_th = dict["ฉบับที่ (ไทย)"]! as String
                research.page_en = dict["ฉบับที่ (อังกฤษ)"]! as String
                research.name_th = dict["ชื่องานวิจัย (ไทย)"]! as String
                research.name_en = dict["ชื่องานวิจัย (อังกฤษ)"]! as String
                research.researcher_th = dict["ชื่อผู้วิจัย (ไทย)"]! as String
                research.researcher_en = dict["ชื่องานวิจัย (อังกฤษ)"]! as String
                research.unit_th = dict["หน่วยงาน (ไทย)"]! as String
                research.unit_en = dict["หน่วยงาน (อังกฤษ)"]! as String
                research.section_th = dict["สังกัดหน่วยงาน (ไทย)"]! as String
                research.section_en = dict["สังกัดหน่วยงาน (อังกฤษ)"]! as String
                research.department_th = dict["ชื่อกรม (ไทย)"]! as String
                research.department_en = dict["ชื่อกรม (อังกฤษ)"]! as String
                research.ministry_th = dict["ชื่อกระทรวง (ไทย)"]! as String
                research.ministry_en = dict["ชื่อกระทรวง (อังกฤษ)"]! as String
                research.keyword_th = dict["คำสำคัญ (ไทย)"]! as String
                research.keyword_en = dict["คำสำคัญ (อังกฤษ)"]! as String
                research.address_th = dict["เลขที่ตั้งหน่วยงาน (ไทย)"]! as String
                research.address_en = dict["เลขที่ตั้งหน่วยงาน (อังกฤษ)"]! as String
                research.sub_district_th = dict["ชื่อตำบล (ไทย)"]! as String
                research.sub_district_en = dict["ชื่อตำบล (อังกฤษ)"]! as String
                research.district_th = dict["ชื่ออำเภอ (ไทย)"]! as String
                research.district_en = dict["ชื่ออำเภอ (อังกฤษ)"]! as String
                research.province_th = dict["ชื่อจังหวัด (ไทย)"]! as String
                research.province_en = dict["ชื่อจังหวัด (อังกฤษ)"]! as String
                research.zipcode = dict["รหัสไปรษณีย์ (เลขไทย)"]! as String
                research.zipcode2 = dict["รหัสไปรษณีย์ (เลขอารบิค)"]! as String
                research.telephone = dict["หมายเลขโทรศัพท์ (เลขไทย)"]! as String
                research.telephone2 = dict["หมายเลขโทรศัพท์ (เลขอารบิค)"]! as String
                research.fax = dict["หมายเลขโทรสาร (เลขไทย)"]! as String
                research.fax2 = dict["หมายเลขโทรสาร (เลขอารบิค)"]! as String
                research.year = dict["ปี พ.ศ. (เลขไทย)"]! as String
                research.year2 = dict["ปี ค.ศ. (เลขอารบิค)"]! as String
                research.year3 = dict["ปี พ.ศ. (เลขอารบิค)"]! as String
                research.filename_small_th = dict["ไฟล์งานวิจัยฉบับย่อ (ไทย)"]! as String
                research.filename_small_en = dict["ไฟล์งานวิจัยฉบับย่อ (อังกฤษ)"]! as String
                research.filename_full = dict["ไฟล์งานวิจัยฉบับเต็ม (รวม)"]! as String
                research.path_small_th = dict["พาทเก็บไฟล์งานวิจัยฉบับย่อ (ไทย)"]! as String
                research.path_small_en = dict["พาทเก็บไฟล์งานวิจัยฉบับย่อ (อังกฤษ)"]! as String
                research.path_full = dict["พาทเก็บไฟล์งานวิจัยฉบับเต็ม (รวม)"]! as String
                
                try! realm.write {
                    realm.add(research)
                }
            }
            
        } catch _ as NSError {
            // handle error
        }
        
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

