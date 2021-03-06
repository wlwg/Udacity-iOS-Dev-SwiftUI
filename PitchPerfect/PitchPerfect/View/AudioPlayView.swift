//
//  PlaySoundsView.swift
//  PitchPerfect
//
//  Created by Will Wang on 2020-07-07.
//  Copyright © 2020 Udacity. All rights reserved.
//

import SwiftUI

struct AudioPlayView: View {
    var audioURL: URL!
    
    @ObservedObject var audioPlayer = AudioPlayer()

    var showAlert: Bool {
        audioPlayer.alert != nil
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 30) {
                    HStack {
                        Spacer()
        
                        Button(action: {
                            self.audioPlayer.playSound(rate: 0.5)
                        }) {
                            Image("Slow")
                                .renderingMode(.original)
                        }
                        .disabled(audioPlayer.playing)

                        Spacer()

                        Button(action: {
                            self.audioPlayer.playSound(rate: 1.5)
                        }) {
                            Image("Fast")
                                .renderingMode(.original)
                        }
                        .disabled(audioPlayer.playing)

                        Spacer()
                    }

                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.audioPlayer.playSound(pitch: 1000)
                        }) {
                            Image("HighPitch")
                                .renderingMode(.original)
                        }
                        .disabled(audioPlayer.playing)
                        
                        Spacer()
                        
                        Button(action: {
                            self.audioPlayer.playSound(pitch: -1000)
                        }) {
                            Image("LowPitch")
                                .renderingMode(.original)
                        }
                        .disabled(audioPlayer.playing)
                        
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.audioPlayer.playSound(echo: true)
                        }) {
                            Image("Echo")
                                .renderingMode(.original)
                        }
                        .disabled(audioPlayer.playing)
                        
                        Spacer()
                        
                        Button(action: {
                            self.audioPlayer.playSound(reverb: true)
                        }) {
                            Image("Reverb")
                                .renderingMode(.original)
                        }
                        .disabled(audioPlayer.playing)
                        
                        Spacer()
                    }
                }

                Button(action: {
                    self.audioPlayer.stopAudio()
                }) {
                    Image("Stop")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 64, height: 64)
                        .opacity(audioPlayer.playing ? 1 : 0.5)
                }
                .disabled(!audioPlayer.playing)
                .padding(.top, 40)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
        .alert(isPresented: .constant(showAlert)) {
            Alert(
                title: Text(audioPlayer.alert!.title),
                message: Text(audioPlayer.alert!.message),
                dismissButton: .default(Text("Got it!")))
        }
        .onAppear(){
            self.audioPlayer.setupAudio(recordedAudioURL: self.audioURL!)
        }
        
    }
}

struct PlaySoundsView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayView(audioURL: URL(string: "https://google.com"))
    }
}
