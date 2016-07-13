//
//  JournalEntryViewController.swift
//  iXplore
//
//  Created by Enrique Pajuelo on 7/11/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit

class JournalEntry: NSObject, NSCoding, MKAnnotation {
    var title:String?
    var notes:String?
    var date:NSDate?
    var coordinate:CLLocationCoordinate2D
    
    init(title:String, notes:String, date:NSDate, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.notes = notes
        self.date = date
        self.coordinate = coordinate
    }
    
    required init?(coder: NSCoder) {
        title = (coder.decodeObjectForKey("title") as? String) ?? ""
        notes = (coder.decodeObjectForKey("notes") as? String) ?? ""
        date = (coder.decodeObjectForKey("date") as? NSDate) ?? nil
        coordinate = CLLocationCoordinate2D(latitude: coder.decodeObjectForKey("latitude") as? CLLocationDegrees ?? CLLocationDegrees(), longitude: coder.decodeObjectForKey("longitude") as? CLLocationDegrees ?? CLLocationDegrees())
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(title, forKey: "title")
        coder.encodeObject(notes, forKey: "notes")
        coder.encodeObject(coordinate.latitude, forKey: "latitude")
        coder.encodeObject(coordinate.longitude, forKey: "longitude")

    }
    
}

class JournalEntryViewController: UIViewController {
    
    static let sharedInstance = JournalEntryViewController()
    
    var array = [JournalEntry(title: "Cape Town", notes: "Summer 2016", date: NSDate(), coordinate: CLLocationCoordinate2D(latitude: -33.9249, longitude: 18.4241)), JournalEntry(title: "London", notes: "Summer 2017", date: NSDate(), coordinate: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)), JournalEntry(title: "Paris", notes: "Summer 2018", date: NSDate(), coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522))]

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
