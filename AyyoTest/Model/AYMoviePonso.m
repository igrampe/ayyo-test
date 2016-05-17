//
//  AYMoviePonso.m
//  AyyoTest
//
//  Created by Semyon Belokovsky on 17/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "AYMoviePonso.h"
#import "AYPricePonso.h"

@implementation AYMoviePonso

+ (instancetype)mock
{
    AYMoviePonso *object = [AYMoviePonso new];
    
    object.title = @"Первый Мститель: Противостояние";
    object.title_en = @"CIVIL WAR (2016)";
    NSString *coverName = [@"cover" stringByAppendingFormat:@"@%dx", (int)MAIN_SCREEN.scale];
    object.cover_url = [[NSBundle mainBundle] pathForResource:coverName ofType:@"png"];
    object.desc = @"Мстители под руководством Капитана Америки оказываются участниками разрушительного инцидента, имеющего международный масштаб. Эти события заставляют правительство задуматься над тем, чтобы начать регулировать действия всех людей с особыми способностями, введя «Акт о регистрации супергероев», вынуждая их раскрыть свои личности и работать на правительственные службы.";
    object.rating_imdb = @9.1;
    object.rating_kinopoisk = @9.1;
    object.rating_age = @12;
    object.trailer_url = @"https://www.youtube.com/watch?v=dKrVegVI0Us";    
    object.price = [AYPricePonso mock];
    
    return object;
}

@end
