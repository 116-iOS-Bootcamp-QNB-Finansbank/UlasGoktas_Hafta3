//
//  ViewController.swift
//  BannerSlider
//
//  Created by ulas on 14.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPageIndex = 0
    
    
    let images = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5")
    ]
    
    let titles = [
        "First Image",
        "Second Image",
        "Third Image",
        "Fourth Image",
        "Fifth Image"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
    }
    
    
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        moveToNextIndex()
    }
    
    
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        moveToPreviousIndex()
    }
    
    func moveToNextIndex() {
        
        currentPageIndex += 1
        let indexPathCondition = currentPageIndex >= 0 ? currentPageIndex % 5 : (5 - abs(currentPageIndex % 5)) % 5
        
        print("next", currentPageIndex)
        collectionView.scrollToItem(at: IndexPath(item: indexPathCondition, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func moveToPreviousIndex() {
        
        currentPageIndex -= 1
        let indexPathCondition = currentPageIndex >= 0 ? currentPageIndex % 5 : (5 - abs(currentPageIndex % 5)) % 5
        
        print("previous", currentPageIndex)
        collectionView.scrollToItem(at: IndexPath(item: indexPathCondition, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        
        cell.image = images[indexPath.row]
        cell.title = titles[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let indexPathCondition = currentPageIndex >= 0 ? currentPageIndex % 5 : (5 - abs(currentPageIndex % 5)) % 5
        pageControl.currentPage = indexPathCondition
    }
    
}
