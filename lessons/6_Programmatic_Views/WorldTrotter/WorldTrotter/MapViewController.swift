import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let trailingconstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
    }
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
}