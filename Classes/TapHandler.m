//
//  TapHandler.m
//  Baker
//
//  ==========================================================================================
//  
//  Copyright (c) 2010, Davide Casali, Marco Colombo, Alessandro Morandi
//  All rights reserved.
//  
//  Redistribution and use in source and binary forms, with or without modification, are 
//  permitted provided that the following conditions are met:
//  
//  Redistributions of source code must retain the above copyright notice, this list of 
//  conditions and the following disclaimer.
//  Redistributions in binary form must reproduce the above copyright notice, this list of 
//  conditions and the following disclaimer in the documentation and/or other materials 
//  provided with the distribution.
//  Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to 
//  endorse or promote products derived from this software without specific prior written 
//  permission.
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
//  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
//  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
//  SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
//  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
//  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
//  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//  

#import "TapHandler.h"


@implementation TapHandler


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];
    
	// ****** METHOD A
	//TODO: the following line is too harsh, we need to filter this better later (doubletaps properly detected)
	UITouch *touch = [[[event allTouches] allObjects] objectAtIndex:0]; // get the top receiver (not sure)
	NSLog(@"* touch --- tapCount:%d", [touch tapCount]);
	[[NSNotificationCenter defaultCenter] postNotificationName:@"onTouch" object:touch];
	
	
	// ****** METHOD B
    /*UITouch *touch = [touches anyObject];
	NSLog(@"* touch --- tapCount:%d", [touch tapCount]);
	
	NSSet *allTouches = [event allTouches];
	
	// Number of touches on the screen
	switch ([allTouches count]) {
		// One touch
		case 1: {
			// Get the first touch.
			UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
			switch([touch tapCount]) {
				// Single tap
				case 1: {
					[[NSNotificationCenter defaultCenter] postNotificationName:@"singleTap" object:touch];
					break;
				}
				// More taps;
				default: {
					[super touchesEnded:touches withEvent:event];
					break;
				}
			}
			break;
		}
		// More touches
		default: {
			[super touchesEnded:touches withEvent:event];
			break;
		}
	} /**/
}

- (void)dealloc {
	
    [super dealloc];
}


@end