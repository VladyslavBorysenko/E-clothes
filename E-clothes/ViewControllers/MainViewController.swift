//
//  ViewController.swift
//  E-clothes
//
//  Created by Владислав on 01.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    //MARK: - IBoutlets

    @IBOutlet weak var authButton: UIBarButtonItem!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Variables
    var categories: [Category] = []
    
    var selectedCategory: Category!
    
    // MARK: -  ViewControllerLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let temp = Category(name: "Shirt", id: "sdfsd", pictureURL: "https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80", isActive: true, timestamp: Timestamp())
        let temp2 = Category(name: "Jeans", id: "sdfsds", pictureURL: "https://images.unsplash.com/photo-1576566588028-4147f3842f27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80", isActive: true, timestamp: Timestamp())
        categories.append(temp)
        categories.append(temp2)
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Identifiers.categoryCell)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser == nil {
        launchLoginViewController()
            authButton.title = "Login"
        } else {
            authButton.title = "Logout"
        }
        
        
    }
    

    //MARK: - PrivateFunctions
    private func launchLoginViewController(){
        let launchStoryboard = UIStoryboard(name: StoryboardName.loginStoryboard, bundle: nil)
        let loginViewController = launchStoryboard.instantiateViewController(withIdentifier: StoryboardID.loginNavigationID)
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
        
    }
    
    //MARK: - IBActions
    @IBAction func auuthBarButtonPressed(_ sender: UIBarButtonItem) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print(signOutError)
            }
        }
        launchLoginViewController()
    }

}

//MARK: - Extensions
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.categoryCell, for: indexPath) as? CollectionViewCell {
        
            cell.configureCell(category: categories[indexPath.item])
        
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let cellWidth = (width - 50) / 2
        let cellHeight = cellWidth * 1.5
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.item]
        performSegue(withIdentifier: Identifiers.toProductsSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifiers.toProductsSegue {
            if let productVC = segue.destination as? ProductViewController{
                productVC.category = selectedCategory
            }
        }
    }
}
