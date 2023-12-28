//
//  XKASecuritySwift.h
//  WidgetExtension
//
//  Created by Vincent Hu on 2022/12/1.
//  Copyright © 2022 HappyPlay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKASecuritySwift : NSObject

///将字典进行AES128加密
+ (NSString *)setSecureWithDict:(NSDictionary *)dict;

///将字符串解密为字典
+ (NSData *)getDictWithSecureString:(NSString *)str;

///base64字符串转二进制
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

///NSData转base64字符串
+ (NSString *)base64EncodedStringFrom:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
