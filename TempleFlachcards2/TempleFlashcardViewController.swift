//
//  TempleFlashcardViewController.swift
//  TempleFlachcards2
//
//  Created by Nathan Johnson on 10/28/15.
//  Copyright © 2015 Nathan Johnson. All rights reserved.
//

import UIKit
//import AVFoundation

class TempleFlashcardViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Constants
    
    fileprivate let ACTUAL_IMAGE_HEIGHT = 150
    fileprivate func COLLECTIONVIEW_RIGHT_INSET() -> CGFloat { return TABLEVIEW_RIGHT_INSET + CGFloat(4) }
    fileprivate let SELECTED_CELL_ALPHA = CGFloat(0.5)
    fileprivate let TABLEVIEW_RIGHT_INSET = CGFloat(200)
    
    
    // MARK: Properties
    
    //lazy var audioPlayer = AVAudioPlayer()
    let game = Game()
    var selectedCell = -1
    var selectedName = -1
    var studyMode = false
    var tableViewTemples = TempleList().getTemples()
    var templeCities = TempleList().getCities()
    var templeStatesOrCountries = TempleList().getStatesOrCountries()
    var collectionViewTemples = TempleList().getRandomTemples()
    //var wrongSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("nameOfSound", ofType: "wav"))
    
    // MARK: Outlets
    
    @IBOutlet weak var borderViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View controller lifecycle
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        audioPlayer = try! AVAudioPlayer(contentsOfURL: wrongSound)
//        audioPlayer.volume = 0.5
//        audioPlayer.prepareToPlay()
//    }
    
    //audioPlayer.play() in the delete method
    
    
    // MARK: collection view data source
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "templeCardCell", for: indexPath)
        
        if let templeCard = cell as? TempleCardCell {
            templeCard.templeCardView.studyMode = studyMode
            templeCard.templeCardView.selected = indexPath.row == selectedCell
            templeCard.templeCardView.filename = collectionViewTemples[indexPath.row].getFilename()
            templeCard.templeCardView.name = collectionViewTemples[indexPath.row].getName()
            templeCard.templeCardView.setNeedsDisplay()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewTemples.count
    }
    
    // MARK: collection view delegate

    // Handle tapping on cell in collection view
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //if in study mode, we don't want users to be able to select cells
        if studyMode {
            return
        }

        
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions(), animations: {
            //if there's already a selection, clear it out
            let selectedPath = IndexPath(row: self.selectedCell, section: 0)
            
            //deselect the cell
            if let selectedTempleCell = collectionView.cellForItem(at: selectedPath) as? TempleCardCell {
                selectedTempleCell.templeCardView.selected = false
                selectedTempleCell.alpha = 1
                selectedTempleCell.templeCardView.setNeedsDisplay()
                self.selectedCell = -1
            }
            
            //if they're tapping on the same card already selected then deselect
            if selectedPath.row != indexPath.row {
                if let templeCell = collectionView.cellForItem(at: indexPath) as? TempleCardCell {
                    self.selectedCell = indexPath.row
                    templeCell.alpha = self.SELECTED_CELL_ALPHA
                    templeCell.templeCardView.selected = true
                    templeCell.templeCardView.setNeedsDisplay()
                }
            }
            
            }, completion: nil)
    }
    
    //MARK: collection view delegate flow layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return CGSizeMake(calculateActualImageWidth(ACTUAL_IMAGE_HEIGHT, imageWidth: imageWidth, imageHeight: imageHeight), CGFloat(ACTUAL_IMAGE_HEIGHT))
        return CGSize(width: CGFloat(tableViewTemples[indexPath.row].getActualImageWidth(ACTUAL_IMAGE_HEIGHT)), height: CGFloat(ACTUAL_IMAGE_HEIGHT))
    }
    
    
    //MARK: table view data source
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "templeCell")!
        
        cell.textLabel?.text = tableViewTemples[indexPath.row].getCity()
        cell.detailTextLabel?.text = tableViewTemples[indexPath.row].getCountry()
            
        return cell
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //since temple cities and temple states/countries should be the same length, we can use either one. Same length will be controlled in the delete()
        return tableViewTemples.count
    }
    
    
        
    //MARK: table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //gets the index of the selected row in the table view and saves it
        selectedName = indexPath.row
    }
    

    
    //MARK: Actions
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        game.reset()
    }
    
    @IBAction func toggleMode(_ sender: UIBarButtonItem) {
        self.view.layoutIfNeeded()
        
        studyMode = !studyMode  //change whether they are in game mode or study mode
        
        borderViewWidthConstraint.constant = studyMode ? 0 : TABLEVIEW_RIGHT_INSET
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, studyMode ? 0 : TABLEVIEW_RIGHT_INSET)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset.right = studyMode ? 4 : COLLECTIONVIEW_RIGHT_INSET()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions(), animations: {
            sender.title = self.studyMode ? "Match" : "Study"
            self.collectionView.reloadData()
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    // MARK: functions
    
    func deleteSelectedTemple() {
        //delete currently selected name
        
        //only delete name if one is selected
        if selectedName >= 0 {
            tableView.beginUpdates()
            
            let selectedPath = IndexPath(item: selectedName, section: 0)
            
            //delete selected name from table view
            tableView.deleteRows(at: [selectedPath], with: .automatic)
            
            //delete selected name from model
            tableViewTemples.remove(at: selectedName)
            
            //reset selected name index
            selectedName = -1
            tableView.endUpdates()
        }
        
        //only delete temple if one is selected
        if selectedCell >= 0 {
            tableView.beginUpdates()
            
            let selectedPath = IndexPath(item: selectedCell, section: 0)
            
            //delete selected temple from collection view
            collectionView.deleteItems(at: [selectedPath])
            
            //delete selected name from model
            collectionViewTemples.removeAtIndex(selectedName)
            
            //reset selected name index
            selectedName = -1
            tableView.endUpdates()
        }
    }
}
