//
//  SettingsHandler.swift
//  SettingsLoader
//
//  Created by Kirill Shteffen on 27/11/2018.
//  Copyright © 2018 Kirill Shteffen. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

public protocol FireHelperReceiveDelegate {
    func receivedLocalObject(data: Data) -> Codable
    func receivedCloudObject(data: Dictionary<String, Any>) -> Codable
}

public protocol FireHelperDispatchDelegate {
    func dispatchedLocalObject<T : Codable>(data: T) -> Data
    func dispatchedCloudObject<T : Codable>(data: T) -> Dictionary<String, Any>
}

public enum DataSource {
    case local
    case cloud
}

open class FireHelper {
    
    public static let `default` = FireHelper()
    
    public var collectionRef: CollectionReference!
    public var docRef: DocumentReference!
  
    public func configure() {
        FirebaseApp.configure()
    }
    
    public func setReference(collectionName: String) {
        self.collectionRef = Firestore.firestore().collection("\(collectionName)")
    }
    
    public func downloadData(source: DataSource, onCompletion: @escaping ([Any])->Void) {
        
        if source == .local {
            var dataList = [Data]()
            let fileManager = FileManager.default
            let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            guard let fileURLs = try? fileManager.contentsOfDirectory(at: documentsURL,
                                                                      includingPropertiesForKeys: nil) else { return onCompletion([Data]())}
            for url in fileURLs {
                guard let jsonData = try? Data(contentsOf: url) else { continue }
                dataList.append(jsonData)
            }
            return onCompletion(dataList)
        }
        
        if source == .cloud {
            var dictionaryList = [[String: Any]]()
            collectionRef.getDocuments { (docsSnapshot, error) in
                guard let docsSnapshot = docsSnapshot?.documents else { return }
                for doc in docsSnapshot {
                let myData = doc.data()
                dictionaryList.append(myData)
                }
                return onCompletion(dictionaryList)
            }
        }
    }
    
    public func saveData(dataSource: DataSource, localData: Data?, cloudData: [String: Any]?, filename: String) {
        if dataSource == .local {
            guard let jsonData = localData else { return }
            let fileManager = FileManager.default
            let url = fileManager.urls(for: .documentDirectory,
                                       in: .userDomainMask).first?.appendingPathComponent("\(filename).json")
            guard let writeUrl = url else { return }
            try? jsonData.write(to: writeUrl)
        }
        
        if dataSource == .cloud {
            docRef = collectionRef.document(filename)
            guard let cloudDataToSave = cloudData else { return }
            docRef.setData(cloudDataToSave) { (error) in
                if let error = error {
                    print ("ERROR: \(error.localizedDescription)")
                } else{
                    print ("Data succefully saved")
                }
            }
        }
    }
    
    public func deleteLocalDocument(named: String, dataSource: DataSource) {
        
        if dataSource == .local {
        let fileManager = FileManager.default
        guard let url = fileManager.urls(for: .documentDirectory,
                                         in: .userDomainMask).first else { return }
        let appendedUrl = url.appendingPathComponent("\(named).json")
        try? FileManager.default.removeItem(at: appendedUrl)
        }
        
        if dataSource == .cloud {
            docRef = collectionRef.document(named)
            docRef.delete()
            }
        }
    }
