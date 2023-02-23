//
//  RegisterFlowController.swift
//  Daily Fitness
//
//  Created by Eduardo Raupp Peretto on 21/02/23.
//

import UIKit

final class RegisterFlowController: UIViewController {
    // MARK: - Properties

    private let imagePickerController: UIImagePickerController = {
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        controller.allowsEditing = true
        controller.cameraCaptureMode = .photo
        controller.navigationController?.isNavigationBarHidden = true
        return controller
    }()

    // MARK: - Init

    init() {
        super.init(nibName: nil, bundle: nil)
        imagePickerController.delegate = self
        triggerCamera()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func triggerCamera() {
        present(imagePickerController, animated: true)
    }
}

extension RegisterFlowController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        // Trigger register forms
        let saveController = SaveFormsViewController()
        show(saveController, sender: self)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
