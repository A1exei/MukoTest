//
//  MTViewController.m
//  MukoTest
//
//  Created by Alexei Naumann on 8/19/14.
//
//

#import "MTViewController.h"
#import <OpenEars/LanguageModelGenerator.h>

const unsigned char SpeechKitApplicationKey[] = {0xd0, 0xc8, 0xa6, 0x41, 0xaa, 0x03, 0x3b, 0x73, 0x39, 0xcb, 0xee, 0xc1, 0x77, 0x2b, 0xb8, 0x9e, 0xbb, 0xac, 0x19, 0x43, 0xc8, 0xd4, 0x61, 0xd6, 0x15, 0x20, 0x4a, 0x5b, 0xda, 0x21, 0x55, 0xaa, 0xe9, 0xfb, 0xeb, 0x93, 0xfe, 0x26, 0x06, 0x38, 0xf2, 0xf5, 0xf9, 0x69, 0x20, 0xb1, 0x08, 0xdb, 0x5d, 0x21, 0x1f, 0x26, 0xf5, 0x80, 0xfc, 0x0a, 0xa0, 0x46, 0x65, 0x7a, 0x67, 0xbb, 0x24, 0x50};


@implementation MTViewController

@synthesize recognizer;
@synthesize microphoneButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [SpeechKit setupWithID: @"NMDPPRODUCTION_Alexei_Naumann_MukoTest_20140820221437"
                      host: @"cig.nmdp.nuancemobility.net"
                      port: 443
                    useSSL: NO
                  delegate: self];
    
    microphone = [UIImage imageNamed:@"mic_green.png"];
    microphoneRecording = [UIImage imageNamed:@"mic_red.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performRecogntion:(id)sender {
    
    if (isRecording) {
        [recognizer stopRecording];
        [microphoneButton setImage:microphone forState:UIControlStateNormal];
    } else if(!isRecording) {
        [microphoneButton setImage:microphoneRecording forState:UIControlStateNormal];
    } else if (!recognizer) {
        self.recognizer = [[SKRecognizer alloc] initWithType:SKSearchRecognizerType
                                                   detection:SKShortEndOfSpeechDetection
                                                    language:@"en_US"
                                                    delegate:self];
    }
}

-(void) recognizerDidBeginRecording:(SKRecognizer *)recognizer {
    isRecording = YES;
}

- (void) recognizerDidFinishRecording:(SKRecognizer *)recognizer {
    isRecording = NO;
  

}

- (void) recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results {
    NSString *search = [results firstResult];
    if (search) {
        self.textField.text  = [self.textField.text stringByAppendingString:@"\n"];
        self.textField.text  = [self.textField.text stringByAppendingString:search];
    }
    
    //Put code here for suggestions from SpeechKit to improve recognition
    
    self.recognizer = nil;
}

- (void) recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion {
    
}

@end
