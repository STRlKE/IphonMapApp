//
//  MapView.swift
//  IphonMapApp (iOS)
//
//  Created by 하명관 on 2022/04/09.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapData: MapViewModoel
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let view = mapData.mapView
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
         
        return view
        
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    class Coordinator: NSObject,MKMapViewDelegate{
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // Custom Pins
            
            // Excluding user blue circle
            
            if annotation.isKind(of: MKUserLocation.self){return nil}
            else{
                let pinAnnotation = MKPinAnnotationView(annotation: annotation,
                    reuseIdentifier: "PIN_VIEW")
                pinAnnotation.tintColor = .red
                pinAnnotation.animatesDrop = true
                pinAnnotation.canShowCallout = true
                
                return pinAnnotation
            }
        }
        
    }
}
