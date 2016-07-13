//
//  MapViewController.swift
//  iXplore
//
//  Created by Enrique Pajuelo on 7/11/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    func addButtonTapped(sender: UIBarButtonItem) {
        let entriesViewController = EntriesViewController(nibName: "EntriesViewController", bundle: nil)
        self.presentViewController(entriesViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        mapView.delegate = self
        
        mapView.addAnnotations(JournalEntryViewController.sharedInstance.array)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addButtonTapped))
        
        self.navigationItem.title = "iXplore"
        self.navigationItem.rightBarButtonItem = addButton

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return JournalEntryViewController.sharedInstance.array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Create cell
        
        let indentifier = "MyCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(indentifier)
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: indentifier)
        }
        
        cell!.textLabel?.text = String!(JournalEntryViewController.sharedInstance.array[indexPath.row].title)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedLocation: CLLocationCoordinate2D = JournalEntryViewController.sharedInstance.array[indexPath.row].coordinate
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: selectedLocation, span: span)
        mapView.setRegion(region, animated: true)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPin"
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if (annotationView == nil) {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView?.pinTintColor = UIColor.purpleColor()
            
            annotationView!.canShowCallout = true
//
//            // Code commented below is to add a left label
//            let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height:30))
//            leftLabel.textColor = UIColor.blackColor()
//            leftLabel.backgroundColor = UIColor.blueColor()
//            
//            // Set leftCalloutAccessoryView
//            annotationView!.leftCalloutAccessoryView = leftLabel
            
        }
        
//        let label = annotationView!.leftCalloutAccessoryView as! UILabel
//        label.text = annotation.title!
        
        annotationView!.annotation = annotation
        return annotationView
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
