//
//  ViewController.swift
//  slotMachine
//
//  Created by ankurchdry on 10/19/14.
//  Copyright (c) 2014 ankurchdry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    
    var titleLabel : UILabel!
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    let kThird:CGFloat = 1.0/3.0
    let kMarginForSlot:CGFloat = 2.0
    
    //add labels
    
    var creditsLabel :UILabel!
    var betLabel :UILabel!
    var winnerPaidLabel :UILabel!
    var creditsTitleLabel :UILabel!
    var betTitleLabel :UILabel!
    var winnerPaidTitleLabel :UILabel!
    
    //add buttons 
    let kHalf:CGFloat = 1.0/2.0
    let kEighth:CGFloat = 1.0/8.0
    
    var resetButton :UIButton!
    var betOneButton :UIButton!
    var betMaxButton :UIButton!
    var spinButton :UIButton!
    
    // Spin button functionality
    
    var slots:[[Slot]] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerView()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func resetButtonPressed (button :UIButton) {
        println("reset button Pressed")
    }
    
    func betOneButtonPressed (button :UIButton) {
        println("betone button Pressed")
    }
    
    func betMaxButtonPressed (button :UIButton) {
        println("betmax button Pressed")
    }
    
    func spinButtonPressed (button :UIButton) {
        println("spin button Pressed")
        
        slots = factory.createSlots()
        setupSecondContainer(self.secondContainer)
    }


    func setupContainerView() {
        
        self.firstContainer = UIView(frame: CGRect (x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect (x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (3*kSixth)))
        
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect (x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (kSixth)))
        
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect (x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (kSixth)))
        
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer (containerView: UIView ) {
        
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide",size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer (containerView: UIView ) {
        
        for var containerNumber = 0 ; containerNumber < kNumberOfContainers ; ++containerNumber {
            
            for var slotNumber = 0 ; slotNumber < kNumberOfSlots ; ++slotNumber {
                
                var slot:Slot
                var slotImageView = UIImageView()
                
                if slots.count != 0 {
                    
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else {
                    slotImageView.image = UIImage(named: "Ace")
                }
                
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
                
                containerView.addSubview(slotImageView)
                
            }
        }
    }
    
    func setupThirdContainer (containerView: UIView ) {
    
         self.creditsLabel = UILabel()
         self.creditsLabel.text = "000000"
         self.creditsLabel.textColor = UIColor.redColor()
         self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
         self.creditsLabel.sizeToFit()
         self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
         self.creditsLabel.textAlignment = NSTextAlignment.Center
         self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
         containerView.addSubview(creditsLabel)
     
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(winnerPaidLabel)
    
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blueColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypeWritter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird * 2)
        self.creditsTitleLabel.textAlignment = NSTextAlignment.Center
        //self.creditsTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(creditsTitleLabel)

        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blueColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypeWritter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 2)
        self.betTitleLabel.textAlignment = NSTextAlignment.Center
        //self.creditsTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(betTitleLabel)
     
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "WinnerPaid"
        self.winnerPaidTitleLabel.textColor = UIColor.blueColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypeWritter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird * 2)
        self.winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
        //self.creditsTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(winnerPaidTitleLabel)
    }
    
    func setupFourthContainer (containerView: UIView) {
    
       self.resetButton = UIButton()
       self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
       self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
       self.resetButton.titleLabel?.font = UIFont(name: "AmericanTypeWritter", size: 12)
       self.resetButton.backgroundColor = UIColor.darkGrayColor()
        self.resetButton.sizeToFit()
       self.resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf)
       self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("BetOne", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "AmericanTypeWritter", size: 12)
        self.betOneButton.backgroundColor = UIColor.darkGrayColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(x: containerView.frame.width * kEighth * 3, y: containerView.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("BetMax", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "AmericanTypeWritter", size: 12)
        self.betMaxButton.backgroundColor = UIColor.darkGrayColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * kEighth * 5, y: containerView.frame.height * kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "AmericanTypeWritter", size: 12)
        self.spinButton.backgroundColor = UIColor.darkGrayColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * kEighth * 7, y: containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        containerView.addSubview(self.spinButton)
        
    }
    

}

