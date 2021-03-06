//
//  KiiDownloader.h
//  KiiSDK-Private
//
//  Created by Riza Alaudin Syah on 4/30/13.
//  Copyright (c) 2013 Kii Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KiiRTransfer.h"
#import "KiiResumableTransfer.h"

/** Implementation of resumable transfer operation.
 */
@interface KiiDownloader : KiiResumableTransfer<KiiRTransfer>

/** @name Get local file path */

/** Get local file path that is used by the downloader.
 @return A string value of local file path that is used by the downloader.
 */
-(nonnull NSString*) localPath;
@end
