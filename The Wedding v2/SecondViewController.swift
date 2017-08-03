//
//  SecondViewController.swift
//  The Wedding v2
//
//  Created by Jacqueline DesMarais on 2/4/17.
//  Copyright © 2017 Jacque DesMarais. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AddressBook
import Contacts

//MARK: Global Declerations
let nashvilleCoordinate = CLLocationCoordinate2DMake(36.164127, -86.780933) // Nashville, TN Downtown Frothy Monkey

class NashvilleCenterCoordinate: NSObject,MKAnnotation {
    var coordinate: CLLocationCoordinate2D = nashvilleCoordinate
    var title: String? = "Frothy Monkey"
    let receptionPin = UIImage(named: "receptionPin")
}

class SecondViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
     
    let receptionPin = UIImage(named: "receptionPin")
    let locationManager = CLLocationManager()
    let currentLocation = CLLocation()
    let geocoder : CLGeocoder = CLGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.title = title
        resetRegion()
    
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        

        
        
        let cremaCoffee = CustomPointAnnotation()
        cremaCoffee.coordinate = CLLocationCoordinate2DMake(36.156984, -86.769731)
        cremaCoffee.title = "Crema Coffee"
        cremaCoffee.subtitle = "Roasts in house"
        cremaCoffee.imageName = "coffeePin"
        
        let frothyMonkey12South = CustomPointAnnotation()
        frothyMonkey12South.coordinate = CLLocationCoordinate2DMake(36.12461, -86.78986)
        frothyMonkey12South.title = "Frothy Monkey 12 South"
        frothyMonkey12South.subtitle = "Coffee, Food, Booze"
        frothyMonkey12South.imageName = "coffeePin"
        
        let frothyMonkeyDowntown = CustomPointAnnotation()
        frothyMonkeyDowntown.coordinate = CLLocationCoordinate2DMake(36.164127, -86.780933)
        frothyMonkeyDowntown.title = "Frothy Monkey Downtown"
        frothyMonkeyDowntown.subtitle = "Reception Venue"
        frothyMonkeyDowntown.imageName = "receptionPin"
        
        let steadfastCoffee = CustomPointAnnotation()
        steadfastCoffee.coordinate = CLLocationCoordinate2DMake(36.17763, -86.79164)
        steadfastCoffee.title = "Steadfast Coffee"
        steadfastCoffee.subtitle = "Get the coffee soda"
        steadfastCoffee.imageName = "coffeePin"
        
        let baristaParlor = CustomPointAnnotation()
        baristaParlor.coordinate = CLLocationCoordinate2DMake(36.18234, -86.74852)
        baristaParlor.title = "Barista Parlor"
        baristaParlor.subtitle = "If you really HAVE to go to a Barista Parlor..."
        baristaParlor.imageName = "coffeePin"
        
        let rolfAndDaughters = CustomPointAnnotation()
        rolfAndDaughters.coordinate = CLLocationCoordinate2DMake(36.17756, -86.79286)
        rolfAndDaughters.title = "Rolf and Daughters"
        rolfAndDaughters.subtitle = "$$ - Great food + drinks - American meets Italian"
        rolfAndDaughters.imageName = "restaurantPin"
        
        let pinewoodSocial = CustomPointAnnotation()
        pinewoodSocial.coordinate = CLLocationCoordinate2DMake(36.15838, -86.76778)
        pinewoodSocial.title = "Pinewood Social"
        pinewoodSocial.subtitle = "$$ - Breakfast, Lunch, Dinner"
        pinewoodSocial.imageName = "restaurantPin"
        
        let husk = CustomPointAnnotation()
        husk.coordinate = CLLocationCoordinate2DMake(36.1553, -86.76986)
        husk.title = "Husk"
        husk.subtitle = "$$$ - farm to table"
        husk.imageName = "restaurantPin"
        
        let masTacosPorFavor = CustomPointAnnotation()
        masTacosPorFavor.coordinate = CLLocationCoordinate2DMake(36.18477, -86.7547)
        masTacosPorFavor.title = "Mas Tacos Por Favor"
        masTacosPorFavor.subtitle = "$ - tacos, duh"
        masTacosPorFavor.imageName = "restaurantPin"
        
        let cityHouse = CustomPointAnnotation()
        cityHouse.coordinate = CLLocationCoordinate2DMake(36.17692, -86.78726)
        cityHouse.title = "City House"
        cityHouse.subtitle = "$$ - Woodfire oven, pizza + pasta"
        cityHouse.imageName = "restaurantPin"
        
        let butchertownHall = CustomPointAnnotation()
        butchertownHall.coordinate = CLLocationCoordinate2DMake(36.17981, -86.78905)
        butchertownHall.title = "Butchertown Hall"
        butchertownHall.subtitle = "$$ - tex-mex meets german food"
        butchertownHall.imageName = "restaurantPin"
        
        let princesHotChickenShack = CustomPointAnnotation()
        princesHotChickenShack.coordinate = CLLocationCoordinate2DMake(36.23001, -86.7609)
        princesHotChickenShack.title = "Prince's Hot Chicken Shack"
        princesHotChickenShack.subtitle = "$ - This is the best hot chicken"
        princesHotChickenShack.imageName = "restaurantPin"
        
        let hattieBsHotChickenMidtown = CustomPointAnnotation()
        hattieBsHotChickenMidtown.coordinate = CLLocationCoordinate2DMake(36.1514, -86.79656)
        hattieBsHotChickenMidtown.title = "Hattie B's Hot Chicken - Midtown"
        hattieBsHotChickenMidtown.subtitle = "$ - 'new' style hot chicken"
        hattieBsHotChickenMidtown.imageName = "restaurantPin"
        
        let biscuitLove = CustomPointAnnotation()
        biscuitLove.coordinate = CLLocationCoordinate2DMake(36.15306, -86.7832)
        biscuitLove.title = "Biscuit Love"
        biscuitLove.subtitle = "$ - breakfast"
        biscuitLove.imageName = "restaurantPin"
        
        let greenhouseBar = CustomPointAnnotation()
        greenhouseBar.coordinate = CLLocationCoordinate2DMake(36.10463, -86.81767)
        greenhouseBar.title = "Greenhouse Bar"
        greenhouseBar.subtitle = "$ - It's in a greenhouse, so that's fun"
        greenhouseBar.imageName = "cocktailPin"
        
        let mickeysTavern = CustomPointAnnotation()
        mickeysTavern.coordinate = CLLocationCoordinate2DMake(36.20291, -86.73917)
        mickeysTavern.title = "Mickey's Tavern"
        mickeysTavern.subtitle = "$ - Industry dive bar"
        mickeysTavern.imageName = "cocktailPin"
        
        let hollandHouseBarAndRefuge = CustomPointAnnotation()
        hollandHouseBarAndRefuge.coordinate = CLLocationCoordinate2DMake(36.18455, -86.75418)
        hollandHouseBarAndRefuge.title = "Holland House Bar and Refuge"
        hollandHouseBarAndRefuge.subtitle = "$$ - Nice cocktail bar"
        hollandHouseBarAndRefuge.imageName = "cocktailPin"
        
        let tootsiesOrchidLounge = CustomPointAnnotation()
        tootsiesOrchidLounge.coordinate = CLLocationCoordinate2DMake(36.16078, -86.77819)
        tootsiesOrchidLounge.title = "Tootsies Orchid Lounge"
        tootsiesOrchidLounge.subtitle = "$ - Country Bar"
        tootsiesOrchidLounge.imageName = "cocktailPin"
        
        let parthenonPavillionCenter = CustomPointAnnotation()
        parthenonPavillionCenter.coordinate = CLLocationCoordinate2DMake(36.15309, -86.81065)
        parthenonPavillionCenter.title = "Parthenon Pavillion Center"
        parthenonPavillionCenter.subtitle = "There is a replica of the Parthenon IN Nashville"
        parthenonPavillionCenter.imageName = "activitiesPin"
        
        let countryMusicHallOfFame = CustomPointAnnotation()
        countryMusicHallOfFame.coordinate = CLLocationCoordinate2DMake(36.15826, -86.77612)
        countryMusicHallOfFame.title = "Country Music Hall of Fame"
        countryMusicHallOfFame.subtitle = "Fairly self explanatory"
        countryMusicHallOfFame.imageName = "activitiesPin"
        
        let nashvillePrideFestival = CustomPointAnnotation()
        nashvillePrideFestival.coordinate = CLLocationCoordinate2DMake(36.16661, -86.77812)
        nashvillePrideFestival.title = "Nashville Pride Festival"
        nashvillePrideFestival.subtitle = "more info at nashvillepride.org"
        nashvillePrideFestival.imageName = "activitiesPin"
        
        mapView.addAnnotation(cremaCoffee)
        mapView.addAnnotation(frothyMonkey12South)
        mapView.addAnnotation(frothyMonkeyDowntown)
        mapView.addAnnotation(steadfastCoffee)
        mapView.addAnnotation(baristaParlor)
        mapView.addAnnotation(rolfAndDaughters)
        mapView.addAnnotation(pinewoodSocial)
        mapView.addAnnotation(husk)
        mapView.addAnnotation(masTacosPorFavor)
        mapView.addAnnotation(cityHouse)
        mapView.addAnnotation(butchertownHall)
        mapView.addAnnotation(princesHotChickenShack)
        mapView.addAnnotation(hattieBsHotChickenMidtown)
        mapView.addAnnotation(biscuitLove)
        mapView.addAnnotation(greenhouseBar)
        mapView.addAnnotation(mickeysTavern)
        mapView.addAnnotation(hollandHouseBarAndRefuge)
        mapView.addAnnotation(tootsiesOrchidLounge)
        mapView.addAnnotation(parthenonPavillionCenter)
        mapView.addAnnotation(countryMusicHallOfFame)
        mapView.addAnnotation(nashvillePrideFestival)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        print("delegate called")
        
        if !(annotation is CustomPointAnnotation) {
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView?.canShowCallout = true
        }
        else {
            anView?.annotation = annotation
        }
       
        if let annotation = annotation as? NashvilleCenterCoordinate {
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "center") {
                return dequeuedView
            } else {
                let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "center")
                
                view.image = receptionPin
                view.isEnabled = true
                view.canShowCallout = true
                view.rightCalloutAccessoryView = UIButton(type: .infoLight)
                return view
            }
        }
        
        let annotationView = MKPinAnnotationView()
        
        let cpa = annotation as! CustomPointAnnotation
        annotationView.canShowCallout = true
        anView?.image = UIImage(named:cpa.imageName!)
        anView!.rightCalloutAccessoryView = UIButton(type: .infoLight)

        
        return anView
        }

    
    func addAnnotationToMap() {
        
        self.geocoder.reverseGeocodeLocation(self.currentLocation) { (placemarks :[CLPlacemark]?, error :Error?) in
            
            if error != nil { return }
            
            let placemark = placemarks![0]
            
            if (placemark.addressDictionary!["Street"] as? String) != nil {
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                })
                
            }
        }
    }

    
    // Open maps app programatically
    func openMapsAppWithDirections(to coordinate: CLLocationCoordinate2D, destinationName name: String) {
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name // Provide the name of the destination in the To: field
        mapItem.openInMaps(launchOptions: options)
    }
    
    func mapView(_ MapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped Control: UIControl) {
        
        if Control == annotationView.rightCalloutAccessoryView {
            if let annotation = annotationView.annotation {
                // Unwrap the double-optional annotation.title property or
                // name the destination "Unknown" if the annotation has no title
                let destinationName = (annotation.title ?? nil) ?? "Unknown"
                openMapsAppWithDirections(to: annotation.coordinate, destinationName: destinationName)
            }
        }
    }
    
    
    //MARK: Map Setup
    func resetRegion() {
        let region = MKCoordinateRegionMakeWithDistance(nashvilleCoordinate, 4000, 4000)
        mapView.setRegion(region, animated: true)
    }
    
    
    // Get users current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
class CustomPointAnnotation: MKPointAnnotation {
    var imageName: String?
    }

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
}


