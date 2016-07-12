//
//  JournalEntryViewController.swift
//  iXplore
//
//  Created by Enrique Pajuelo on 7/11/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit

class JournalEntry: NSObject, MKAnnotation {
    var title:String? = ""
    var notes:String? = ""
    var date:String? = ""
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
}

class JournalEntryViewController: UIViewController {
    
    static let sharedInstance = JournalEntryViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func returnArray() -> [JournalEntry] {
        
        let entry1 = JournalEntry()
        entry1.title = "Cape Town"
        entry1.notes = "Summer 2016"
        entry1.date = "Monday Jul 11, 2016"
        entry1.coordinate = CLLocationCoordinate2D(latitude: -33.9249, longitude: 18.4241)
        
        let entry2 = JournalEntry()
        entry2.title = "London"
        entry2.notes = "Summer 2017"
        entry2.date = "Friday Jul 19, 2017"
        entry2.coordinate = CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)
        
        let entry3 = JournalEntry()
        entry3.title = "Paris"
        entry3.notes = "Summer 2018"
        entry3.date = "Friday Nov 9, 2018"
        entry3.coordinate = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        
        let array: [JournalEntry] = [entry1, entry2, entry3]
        
        return array
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
