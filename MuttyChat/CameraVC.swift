//
//  ViewController.swift
//  MuttyChat
//
//  Created by Dominik Sadowski on 9/7/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AAPLCameraViewController, AAPLCameraVCDelegate {

    @IBOutlet var previewView: AAPLPreviewView!
    @IBOutlet var cameraBtn: UIButton!
    @IBOutlet var recordBtn: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        _previewView = previewView

        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard FIRAuth.auth()?.currentUser != nil else {
            shouldPerformSegue(withIdentifier: "loginVC", sender: nil)
            return
        }
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
    
    func videoRecordingFaild() {
        
    }
    
    func videoRecordingComplete(_ videoURL: URL!) {
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL":videoURL])
    }
    
    func snapshotFaild() {
        
    }
    func snapshotTaken(_ sanapshotData: Data!) {
        performSegue(withIdentifier: "UsersVC", sender: ["snapshotData":sanapshotData])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let usersVC = segue.destination as? UsersVC {
            if let videoDict = sender as? Dictionary<String, URL> {
                let url = videoDict["videoURL"]
                usersVC.videoURL = url
            } else if let snapDict = sender as? Dictionary<String, Data> {
                let snapData = snapDict["snapshotData"]
                usersVC.snapData = snapData
            }
        }
    }

}

