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
    
    private let ACTUAL_IMAGE_HEIGHT = 150
    private func COLLECTIONVIEW_RIGHT_INSET() -> CGFloat { return TABLEVIEW_RIGHT_INSET + CGFloat(4) }
    private let SELECTED_CELL_ALPHA = CGFloat(0.5)
    private let TABLEVIEW_RIGHT_INSET = CGFloat(200)
    
    
    // MARK: Properties
    
    //lazy var audioPlayer = AVAudioPlayer()
    let game = Game()
    var selectedCell = -1
    var selectedName = -1
    var studyMode = false
    var tableViewTemples = TempleList().getTemples()
    var templeCities = TempleList().getCities()
    var templeStatesOrCountries = TempleList().getStatesOrCountries()
    //var collectionViewTemples = TempleList().randomize()
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
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("templeCardCell", forIndexPath: indexPath)
        
        if let templeCard = cell as? TempleCardCell {
            templeCard.templeCardView.studyMode = studyMode
            templeCard.templeCardView.selected = indexPath.row == selectedCell
            templeCard.templeCardView.filename = temples[indexPath.row].getFilename()
            templeCard.templeCardView.name = temples[indexPath.row].getName()
            templeCard.templeCardView.setNeedsDisplay()
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return temples.count
    }
    
    // MARK: collection view delegate

    // Handle tapping on cell in collection view
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //if in study mode, we don't want users to be able to select cells
        if studyMode {
            return
        }

        
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseInOut, animations: {
            //if there's already a selection, clear it out
            let selectedPath = NSIndexPath(forRow: self.selectedCell, inSection: 0)
            
            //deselect the cell
            if let selectedTempleCell = collectionView.cellForItemAtIndexPath(selectedPath) as? TempleCardCell {
                selectedTempleCell.templeCardView.selected = false
                selectedTempleCell.alpha = 1
                selectedTempleCell.templeCardView.setNeedsDisplay()
                self.selectedCell = -1
            }
            
            //if they're tapping on the same card already selected then deselect
            if selectedPath.row != indexPath.row {
                if let templeCell = collectionView.cellForItemAtIndexPath(indexPath) as? TempleCardCell {
                    self.selectedCell = indexPath.row
                    templeCell.alpha = self.SELECTED_CELL_ALPHA
                    templeCell.templeCardView.selected = true
                    templeCell.templeCardView.setNeedsDisplay()
                }
            }
            
            }, completion: nil)
    }
    
    //MARK: collection view delegate flow layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        //return CGSizeMake(calculateActualImageWidth(ACTUAL_IMAGE_HEIGHT, imageWidth: imageWidth, imageHeight: imageHeight), CGFloat(ACTUAL_IMAGE_HEIGHT))
        return CGSizeMake(CGFloat(tableViewTemples[indexPath.row].getActualImageWidth(ACTUAL_IMAGE_HEIGHT)), CGFloat(ACTUAL_IMAGE_HEIGHT))
    }
    
    
    //MARK: table view data source
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("templeCell")!
        
        cell.textLabel?.text = tableViewTemples[indexPath.row].getCity()
        cell.detailTextLabel?.text = tableViewTemples[indexPath.row].getCountry()
            
        return cell
    }
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //since temple cities and temple states/countries should be the same length, we can use either one. Same length will be controlled in the delete()
        return tableViewTemples.count
    }
    
    
        
    //MARK: table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //gets the index of the selected row in the table view and saves it
        selectedName = indexPath.row
    }
    

    
    //MARK: Actions
    
    @IBAction func reset(sender: UIBarButtonItem) {
        game.reset()
    }
    
    @IBAction func toggleMode(sender: UIBarButtonItem) {
        self.view.layoutIfNeeded()
        
        studyMode = !studyMode  //change whether they are in game mode or study mode
        
        borderViewWidthConstraint.constant = studyMode ? 0 : TABLEVIEW_RIGHT_INSET
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, studyMode ? 0 : TABLEVIEW_RIGHT_INSET)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset.right = studyMode ? 4 : COLLECTIONVIEW_RIGHT_INSET()
        }
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseInOut, animations: {
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
            
            let selectedPath = NSIndexPath(forItem: selectedName, inSection: 0)
            
            //delete selected name from table view
            tableView.deleteRowsAtIndexPaths([selectedPath], withRowAnimation: .Automatic)
            
            //delete selected name from model
            tableViewTemples.removeAtIndex(selectedName)
            
            //reset selected name index
            selectedName = -1
            tableView.endUpdates()
        }
        
        //only delete temple if one is selected
        if selectedCell >= 0 {
            tableView.beginUpdates()
            
            let selectedPath = NSIndexPath(forItem: selectedCell, inSection: 0)
            
            //delete selected temple from collection view
            collectionView.deleteItemsAtIndexPaths([selectedPath])
            
            //delete selected name from model
            temples.removeAtIndex(selectedName)
            
            //reset selected name index
            selectedName = -1
            tableView.endUpdates()
        }
    }
}