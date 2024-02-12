//
//  FileStorage.swift
//  MyMessage
//
//  Created by palphone ios on 2/12/24.
//

import Foundation
import FirebaseStorage
import ProgressHUD

let storage = Storage.storage()

class FileStorage {
    class func uploadImage(_ image: UIImage, directory: String, completion : @escaping(_ documentLink: String?) -> Void) {
        
        let storageRef = storage.reference(forURL:KFILEREFERENCE).child(directory)
        let imageData = image.jpegData(compressionQuality: 0.6)
        var task : StorageUploadTask!
        task = storageRef.putData(imageData!, metadata: nil, completion: { (metadata, error) in
            
            task.removeAllObservers()
            ProgressHUD.dismiss()
            
            if error != nil {
                print("error uploading image\(error!.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { (url, error) in
                guard let downloadUrl = url else {
                    completion(nil)
                    return
                }
                
                completion(downloadUrl.absoluteString)
            }
        })
        
        task.observe(StorageTaskStatus.progress) { snapshot in
            let progress = snapshot.progress!.completedUnitCount / snapshot.progress!.totalUnitCount
            ProgressHUD.progress(CGFloat(progress))
        }
        
    }
    
    
    
    class func downloadImage(imageUrl: String, completion: @escaping(_ image: UIImage?) -> Void) {

        let imageFileName = fileNameFrom(fileurl: imageUrl)
        
        if fileExistsAtPath(path: imageFileName) {
            
           print("LOCAL IMAGE")
            if let contentsOfFile = UIImage(contentsOfFile: fileInDocumentsDirectory(fileName: imageFileName)) {
                completion(contentsOfFile)
            } else {
                
                print("couldnt convert local image")
                completion(UIImage(named: "AleezAvatar"))
                
            }
            
        }else{
            
            print("FIREBASE DWNLD")
            if imageUrl != "" {
                let documentUrl = URL(string: imageUrl)
                let downloadQueue = DispatchQueue(label: "imageDownloadQueue")
                downloadQueue.async {
                    let data = NSData(contentsOf: documentUrl!)
                    if data != nil {
                        //save locally
                        FileStorage.saveFileLocally(fileData: data!, fileName: imageFileName)
                        DispatchQueue.main.async {
                            completion(UIImage(data: data! as Data))
                        }
                    }else{
                        print("NO DOCUMENT IN DATABASE")
                        DispatchQueue.main.async {
                            
                            completion(nil)
                        }
                    }
                }
            }
            
        }

    }
    
 
    //MARK: - Save Locally
    
    class func saveFileLocally(fileData: NSData, fileName: String){
        let docUrl = getDocumentsURL().appendingPathComponent(fileName, isDirectory: false)
        fileData.write(to: docUrl, atomically: true)
    }
}

//Helpers
func fileInDocumentsDirectory(fileName: String) -> String {
    return getDocumentsURL().appendingPathComponent(fileName).path
}

func getDocumentsURL() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
}

func fileExistsAtPath(path: String) -> Bool {
    
    return FileManager.default.fileExists(atPath: fileInDocumentsDirectory(fileName: path))
}
