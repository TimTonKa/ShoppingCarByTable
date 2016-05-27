//
//  MyViewController.m
//  homeworkBuyTable
//
//  Created by Tim on 2016/5/11.
//  Copyright © 2016年 Tim. All rights reserved.
//

#import "MyViewController.h"
#import "MyTableViewController.h"
@interface MyViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userBuyName;
@property (weak, nonatomic) IBOutlet UITextField *userBuyPrice;
@property (weak, nonatomic) IBOutlet UITextField *userBuyNumber;
@property (nonatomic,strong) NSMutableArray * userMutableArray;


@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userMutableArray =[[NSMutableArray alloc]init];
    
    self.userBuyName.delegate = self;
     self.userBuyPrice.delegate = self;
     self.userBuyNumber.delegate = self;
    
    
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    //將userDefaults裡叫notes的key取出指定給notesFromUserDefault的陣列
    NSArray * notesFromUserDefault = [userDefaults objectForKey:@"history"];
    
    //如果notesFromUserDefault為空直，則將notes的可變式陣列初始化
    if (notesFromUserDefault == nil) {
        self.userMutableArray = [NSMutableArray array];
    } else {    //如果不是空值，則將使用者輸入過的內容值(notesFromUserDefault)丟到notes陣列
        self.userMutableArray = [NSMutableArray arrayWithArray:notesFromUserDefault];
    }
    
}

- (IBAction)joinToShoppingCar:(UIButton *)sender {
    NSString * name = self.userBuyName.text;
    NSString * price = self.userBuyPrice.text;
    NSString * number = self.userBuyNumber.text;
    NSArray * temp = @[name,price,number];
    [self.userMutableArray addObject:temp];

    [[NSUserDefaults standardUserDefaults]setObject:self.userMutableArray forKey:@"history"];
    [[NSUserDefaults standardUserDefaults]synchronize];
        
//    MyTableViewController * vc = (MyTableViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    
//    NSLog(@"name:%@",vc.userTypeName);
    

}

- (IBAction)goToTableView:(UIButton *)sender {
    //準備下一頁
    MyTableViewController * vc = (MyTableViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    
    vc.MutableArray = self.userMutableArray;
    //顯示下一頁
    [self showViewController:vc sender:nil];
    //[self presentViewController:vc animated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
