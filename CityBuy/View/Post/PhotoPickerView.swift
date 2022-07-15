//
//  PhotoPickerView.swift
//  CityBuy
//
//  Created by Steve Shi on 7/15/22.
//

import SwiftUI
import PhotosUI

// Photo picker view to allow the user to pick images from their album
struct PhotosPickerView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let onResultsHandler: ([PHPickerResult]) -> Void
    
    func makeCoordinator() -> PhotosPickerViewCoordinator {
        PhotosPickerViewCoordinator(isPresented: _isPresented, onResultsHandler: onResultsHandler)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = .any(of: [.images])
        configuration.selectionLimit = 4
        configuration.selection = .ordered
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

final class PhotosPickerViewCoordinator: PHPickerViewControllerDelegate {
    let onResultsHandler: ([PHPickerResult]) -> Void
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>, onResultsHandler: @escaping ([PHPickerResult]) -> Void) {
        self._isPresented = isPresented
        self.onResultsHandler = onResultsHandler
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let imageResults = results.filter { $0.itemProvider.canLoadObject(ofClass: UIImage.self) }
        onResultsHandler(imageResults)
        isPresented = false
    }
}
