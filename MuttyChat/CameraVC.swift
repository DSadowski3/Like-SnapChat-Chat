//
//  ViewController.swift
//  MuttyChat
//
//  Created by Dominik Sadowski on 9/7/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController, AAPLCameraVCDelegate {

    @IBOutlet var previewView: AAPLPreviewView!
    @IBOutlet var cameraBtn: UIButton!
    @IBOutlet var recordBtn: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        _previewView = previewView

        super.viewDidLoad()
        
    }

    @IBAction func recordBtnPressed(_ sender: AnyObject) {
        toggleMovieRecording()
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: AnyObject) {
        changeCamera()
    }
    
    func shoudlEnableCameraUI(_ enable: Bool) {
        cameraBtn.isEnabled = enable
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
    }
    
    func recordingHasStarted() {
        print("Recording has stared")
    }
    
    func canStartRecording() {
        print("Can start recording")
    }

}

