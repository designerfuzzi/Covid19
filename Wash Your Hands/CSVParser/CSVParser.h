//
//  CSVParser.m
//
/**
 header file rewritten to make it work properly and easy
 Origin of source taken from github
 https://github.com/davedelong/CHCSVParser
 
Copyright (c) 2014 Dave DeLong

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
**/

#import <Foundation/Foundation.h>
#import "CHCSVParser.h"


@interface CHCSVDelegate : NSObject <CHCSVParserDelegate>

@property (readonly) NSArray *lines;

@end


/*
int main (int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *file = @(__FILE__);
        file = [[file stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Test.scsv"];
        
        NSLog(@"Beginning...");
        NSStringEncoding encoding = 0;
        NSInputStream *stream = [NSInputStream inputStreamWithFileAtPath:file];
        CHCSVParser * p = [[CHCSVParser alloc] initWithInputStream:stream usedEncoding:&encoding delimiter:';'];
        [p setRecognizesBackslashesAsEscapes:YES];
        [p setSanitizesFields:YES];
        
        NSLog(@"encoding: %@", CFStringGetNameOfEncoding(CFStringConvertNSStringEncodingToEncoding(encoding)));
        
        CHCSVDelegate * d = [[CHCSVDelegate alloc] init];
        [p setDelegate:d];
        
        NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
        [p parse];
        NSTimeInterval end = [NSDate timeIntervalSinceReferenceDate];
        
        NSLog(@"raw difference: %f", (end-start));
        
        NSLog(@"%@", [d lines]);
    }
    return 0;
}
*/
