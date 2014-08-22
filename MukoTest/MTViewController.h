//
//  MTViewController.h
//  MukoTest
//
//  Created by Alexei Naumann on 8/19/14.
//
//

#import <UIKit/UIKit.h>
#import <SpeechKit/SpeechKit.h>

@interface MTViewController : UIViewController <UITextViewDelegate, SKRecognizerDelegate> {
    SKRecognizer *recognizer;
    BOOL isRecording;
    UIImage *microphone;
    UIImage *microphoneRecording;
}



- (IBAction)performRecogntion:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (strong, nonatomic) SKRecognizer *recognizer;
@property (strong, nonatomic) IBOutlet UIButton *microphoneButton;

@end
