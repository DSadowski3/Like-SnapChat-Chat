//
//  Header.h
//  MuttyChat
//
//  Created by Dominik Sadowski on 9/9/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

#ifndef Header_h
#define Header_h

@protocol AAPLCameraVCDelegate <NSObject>

-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shoudlEnableCameraUI:(BOOL)enable;
-(void)canStartRecording;
-(void)recordingHasStarted;
@end

#endif /* Header_h */
