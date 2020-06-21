//
//  ViewController.swift
//  StoryPlayer
//
//  Created by Furkan Bekil on 19.06.2020.
//  Copyright © 2020 Furkan Bekil. All rights reserved.
//

import UIKit
import SafariServices

class FeedViewController: UIViewController {
    
    // Colletion View
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Category Array
    var selectedCategoryIndex: Int?
    
    // Feed Table View
    @IBOutlet weak var feedTableView: UITableView!
    var feedArray = [FeedModel.init(title: "Temiz.co Mobile Application", image: "feed-1", link: "https://apps.apple.com/tr/app/temiz-kuru-temizleme-lostra/id1097514120?l=tr"), FeedModel.init(title: "Drive Yoyo Mobile Application", image: "feed-2", link: "https://apps.apple.com/tr/app/yoyo/id627877948?l=tr"), FeedModel.init(title: "Susan Miller Mobile Application", image: "feed-3", link: "https://apps.apple.com/tr/app/susan-miller-ile-astroloji/id1254273246?l=tr"), FeedModel.init(title: "Bekil Brothers Developer Account", image: "feed-4", link: "https://apps.apple.com/tr/developer/bekil-brothers/id1171758393")]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection View Deletage & Datasource Assignings
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Feed Table View Deletage & Datasource Assignings
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        // Add Dummy cagetories
        self.getStoryJson()
        
        
    }
    
    func getStoryJson() {
        
        fetchData(endpoint: "furkan-story/data.json", parameters: nil) { response in
            
            if let json = response.object as? Dictionary<String, AnyObject> {
                
                if let data = json["data"] as? [Dictionary<String, AnyObject>] {
                    
                    for x in 0 ..< data.count {
                        
                        let id = data[x]["id"] as! Int
                        let title = data[x]["title"] as! String
                        let image = data[x]["image"] as! String
                        var storiesArray = [StoryDetailModel]()
                        
                        if let stories = data[x]["stories"] as? [Dictionary<String, AnyObject>] {
                            
                            for x in 0 ..< stories.count {
                                
                                let storyID = stories[x]["id"] as! Int
                                let storyTitle = stories[x]["title"] as! String
                                let storyMedia = stories[x]["media"] as! String
                                let is_video = stories[x]["is_video"] as! Int
                                
                                let item = StoryDetailModel.init(id: storyID, title: storyTitle, media: storyMedia, is_video: is_video)
                                storiesArray.append(item)
                                
                            }
                            
                        }
                        
                        let categoryItem = StoryCategoryModel.init(id: id, title: title, image: image, stories: storiesArray)
                        DataManager.allStories.append(categoryItem)
                        
                    }
                    
                    self.collectionView.reloadData()
                    
                }
                
            }
        }
    }

}


// Collection View Delegate Functions
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return DataManager.allStories.count
     }
     
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath as IndexPath) as! storyCell
         
         let item = DataManager.allStories[indexPath.row]
         
         cell.configureCell(item: item)
         
         
         return cell
     }
     
     
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
//         dataMenager.storyCategoryId = self.storyCategoryArray[indexPath.row].id
//         dataMenager.storyCategoryArray = self.storyCategoryArray
//         dataMenager.selectedStoryCategoryIndex = indexPath.row
//         dataMenager.storyComimgFromHome = true
//
        selectedCategoryIndex = indexPath.row
        UIApplication.shared.isStatusBarHidden = true
        performSegue(withIdentifier: "showStoryDetail", sender: nil)
         
     }
     
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAt indexPath: IndexPath) -> CGSize {
         
         return CGSize.init(width: 58, height: 92)
         
     }
    
}


// Prepare For Segue
extension FeedViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if let nextScene = segue.destination as? StoryDetailViewController {
           
        nextScene.currentIndex = self.selectedCategoryIndex ?? 0
           
       }
       
    }
    
}


// Feed Table View Delegate Functions
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell?
        
        
        let item = feedArray[indexPath.row]
        cell?.configureCell(item: item)
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = feedArray[indexPath.row]
        let url = URL.init(string: item.link)!
        let vc = SFSafariViewController(url: url)
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
}


