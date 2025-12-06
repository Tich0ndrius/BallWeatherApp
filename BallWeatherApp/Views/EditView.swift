//
//  EditView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 06.12.2025.
//

import SwiftUI


struct EditView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String
    @State private var description: String
    
    let location: Location
    let onSave: (Location) -> Void
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Place name", text: $name)
                }
                
                Section("Description") {
                    TextField("Description", text: $description)
                }
                
                Section("Coordinates") {
                    HStack {
                        Text("Latitude")
                        Spacer()
                        Text(String(format: "%.5f", location.latitude))
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Longitude")
                        Spacer()
                        Text(String(format: "%.5f", location.longitude))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Edit Location")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let updated = Location(
                            id: location.id,
                            name: name,
                            description: description,
                            latitude: location.latitude,
                            longitude: location.longitude
                        )
                        
                        onSave(updated)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
