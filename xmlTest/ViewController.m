//
//  ViewController.m
//  xmlTest
//
//  Created by Taizo Takahira on 2013/08/19.
//  Copyright (c) 2013年 Taizo Takahira. All rights reserved.
//

// test 2

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // テキストビューの初期化と編集不可に設定
    self.myTextView.text = @"";
    self.myTextView.editable = NO;
    
    // URLを指定してXMLパーサーを作る
    NSURL *myURL = [NSURL URLWithString:@"http://www.ymori.com/itest/test.xml"];
    NSXMLParser *myParser = [[NSXMLParser alloc] initWithContentsOfURL:myURL];
    myParser.delegate = self;
    
    // 解析を開始する
    [myParser parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    // 解析中タグの初期化
    nowTagStr = @"";
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    // 開始タグが"sweets"だったら
    if ([elementName isEqualToString:@"sweets"]) {
        // 解析中タグに設定
        nowTagStr = [NSString stringWithString:elementName];
        // テキストバッファの初期化
        txtBuffer = @"";
        
        // テキストビューに、タグ名とprice属性を追加する
        self.myTextView.text = [self.myTextView.text stringByAppendingFormat:
                                @"タグ名=[%@]\n 属性 price=[%@]",
                                elementName, [attributeDict objectForKey:@"price"]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // 解析中のタグが sweets だったら
    if ([nowTagStr isEqualToString:@"sweets"]) {
        // テキストバッファに文字を追加する
        txtBuffer = [txtBuffer stringByAppendingString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    // 終了タグが sweets だったら
    if ([elementName isEqualToString:@"sweets"]) {
        // テキストビューにテキストバッファの文字を追加する
        self.myTextView.text = [self.myTextView.text stringByAppendingFormat:@"\n 要素=[%@]\n\n", txtBuffer];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
