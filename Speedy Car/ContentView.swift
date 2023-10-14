//
//  ContentView.swift
//  Speedy Car
//
//  Created by Stvya Sharma on 25/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var carPosition = CGPoint(x:100, y: 100)
    @State private var obstPosition = CGPoint(x:1000, y: 300)
    @State private var isPaused = false
    @State private var score = 0
    @State private var Highscore = 0
    @State private var text = ""
    @State private var high = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        GeometryReader { geo in
            
        
            ZStack{

                Car()
                    .position(self.carPosition)
                    .onReceive(self.timer) {_ in
                        self.gravity()
                    }
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer) {_ in
                        self.obstMove()
                    }
                Text("High score : \(self.Highscore)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width -  100, y: geo.size.height / 20 )
                
                Text("Current Score : \(self.score)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 100, y: geo.size.height / 10 )
                
                
                self.isPaused ? Button("\(text)\nStart Again") { self.resume() } : nil

                                
            }
            
            .foregroundColor(.green)
            .frame(width: geo.size.width, height: geo.size.height , alignment: .center)
            .background(Color.black)
            .gesture(
            TapGesture()
                .onEnded{
                    withAnimation{
                        self.carPosition.y -= 100
                    }
            })
                .onReceive(self.timer) { _ in
                    self.collisionDetection();
                    self.screenDetection();
                    self.score += 1
                    self.highscoreCounter();
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    
    
    func gravity() {
        withAnimation{
            self.carPosition.y += 20
        }
    }
    
    func obstMove() {
        
        if self.obstPosition.x > 0
        {
            withAnimation{
                self.obstPosition.x -= 20
            }
        }
        else
        {
            self.obstPosition.x = 1000
            self.obstPosition.y = CGFloat.random(in: 0...500)
            
        }
    }
    
    func pause() {
        self.timer.upstream.connect().cancel()
    }
    
    func resume() {
        
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        self.obstPosition.x = 1000 // move obsitcle to starting position
        self.carPosition = CGPoint(x: 100, y: 100) // helicopter to tarting position
        self.isPaused = false
        self.score = 0
    }
    
    
    func collisionDetection() {
      
        if abs(carPosition.x - obstPosition.x) < (25 + 10) && abs(carPosition.y - obstPosition.y) < (25 + 100) {
            self.text = "You collided with obstacle"
            self.pause()
            self.isPaused = true
            
        }
        
        
        
    }
    func screenDetection(){
        if abs(carPosition.y ) < 2 {
            self.text = "Out of Bounds"
            self.pause()
            self.isPaused = true
        }
        if abs(carPosition.y ) > 400 {
            self.text = "Out of Bounds"
            self.pause()
            self.isPaused = true

        }
    }
    
    func highscoreCounter(){
        if Highscore < score {
            Highscore = score
        }
    }
    

    
}
