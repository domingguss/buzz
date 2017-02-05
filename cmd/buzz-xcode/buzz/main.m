//
//  main.m
//  BuzzLED
//
//  Created by Dominggus Salampessy on 05/02/17.
//  Copyright © 2017 Dominggus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "hidapi.h"

#define MAX_STR 255

int res;
unsigned char readBuffer[MAX_STR];
unsigned char writeBuffer[MAX_STR];
wchar_t wstr[MAX_STR];
hid_device *handle;
int i;

dispatch_source_t _timer;


void sendStatus(NSString *status) {
    
    res = hid_init();
    
    handle = hid_open(0x054c, 0x1000, NULL);
    hid_set_nonblocking(handle, 1);
    
    writeBuffer[0] = 0x00;
    writeBuffer[1] = 0x00;
    writeBuffer[2] = 0x00;
    writeBuffer[3] = 0x00;
    writeBuffer[4] = 0x00;
    writeBuffer[5] = 0x00;
    
    if ([status isEqualToString:@"all"]) {
        writeBuffer[2] = 0xFF;
        writeBuffer[3] = 0xFF;
        writeBuffer[4] = 0xFF;
        writeBuffer[5] = 0xFF;
    } else if ([status isEqualToString:@"1"]) {
        writeBuffer[2] = 0xFF;
    } else if ([status isEqualToString:@"2"]) {
        writeBuffer[3] = 0xFF;
    } else if ([status isEqualToString:@"3"]) {
        writeBuffer[4] = 0xFF;
    } else if ([status isEqualToString:@"4"]) {
        writeBuffer[5] = 0xFF;
    }
    
    res = hid_write(handle, writeBuffer, sizeof(writeBuffer));
    hid_close(handle);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        
        if (arguments.count != 2) {
            printf("usage: 'buzz all' or 'buzz 0' or 'buzz 1' etc...");
        } else {
            NSString *input = arguments[1];
            sendStatus(input);
        }
    }
    return 0;
}

