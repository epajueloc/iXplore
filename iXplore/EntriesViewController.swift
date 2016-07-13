//
//  EntriesViewController.swift
//  iXplore
//
//  Created by Enrique Pajuelo on 7/12/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit

class EntriesViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var notesField: UITextField!
    
    @IBOutlet weak var latitudeField: UITextField!
    
    @IBOutlet weak var longitudeField: UITextField!
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documents.URLByAppendingPathComponent("file.txt")
        
        let title = titleField.text!
        let notes = notesField.text!
        let latitude = latitudeField.text!
        let longitude = longitudeField.text!
        
        let entry = JournalEntry(title: title, notes: notes, date: NSDate(), coordinate: CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!))
        
        NSKeyedArchiver.archiveRootObject(entry, toFile: fileURL.path!)
        
        JournalEntryViewController.sharedInstance.array.append(entry)
        
        let mapViewController = MapViewController(nibName: "MapViewController", bundle: nil)
        self.presentViewController(mapViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        let mapViewController = MapViewController(nibName: "MapViewController", bundle: nil)
        self.presentViewController(mapViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
