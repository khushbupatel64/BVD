//
//  MapView.swift
//  BVDAPP
//
//  Created by khushbu on 05/06/24.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    
    @ObservedObject var viewModel: MapViewModel
    
    @SwiftUI.State var selectedFuelSite: FuelSite?
    private static var mapViewInstance: GMSMapView?
    
    func makeUIView(context: Context) -> GMSMapView {
        // Create a single instance of GMSMapView
        if GoogleMapView.mapViewInstance == nil {
            GoogleMapView.mapViewInstance = GMSMapView()
            GoogleMapView.mapViewInstance?.isMyLocationEnabled = true
            GoogleMapView.mapViewInstance?.delegate = context.coordinator
        }
        return GoogleMapView.mapViewInstance!
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(owner: self)
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.clear() // Clear existing markers to avoid duplicates
        for site in viewModel.arrFuelSites {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: site.latitude!, longitude: site.longitude!)
            marker.title = site.name
            marker.map = mapView
        }
        if viewModel.arrFuelSites.count > 0 {
            if let location = viewModel.arrFuelSites.last {
                let camera = GMSCameraPosition.camera(withLatitude: location.latitude!, longitude: location.longitude!, zoom: 1.0)
                mapView.animate(to: camera)
            }
        }else {
            if let location = viewModel.location {
                let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 10.0)
                mapView.animate(to: camera)
            }
        }
        
    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        return true
        
    }
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        let owner: GoogleMapView       // access to owner view members,
        
        init(owner: GoogleMapView) {
            self.owner = owner
        }
    }
}
