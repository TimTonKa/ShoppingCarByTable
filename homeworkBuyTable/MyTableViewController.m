//
//  MyTableViewController.m
//  homeworkBuyTable
//
//  Created by Tim on 2016/5/11.
//  Copyright © 2016年 Tim. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyViewController.h"
@interface MyTableViewController ()
@property(nonatomic,strong) NSMutableArray * notesFromUserDefault;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
 }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.MutableArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSArray * temp = self.MutableArray[indexPath.row];
    NSString * name = temp[0];
    NSString * price = temp[1];
    NSString * number = temp[2];
    long total = (price.intValue * number.intValue);
  
    self.notesFromUserDefault = [NSMutableArray arrayWithArray:temp];
    //NSLog(@"%@",self.notesFromUserDefault[0]);
    
    
    cell.cellName.text = [NSString stringWithFormat:@"品名:%@",name];
    cell.cellNumber.text = [NSString stringWithFormat:@"數量:%@",number];
    cell.cellPrice.text = [NSString stringWithFormat:@"總價錢:%li",total];
    return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //再object-c裡switch的case只能判斷數字
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            //掀動資料,把history陣列的地n個索引值得物件移除
            [self.MutableArray removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            
            [[NSUserDefaults standardUserDefaults]setObject:self.MutableArray forKey:@"history"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            break;
            
            //在動畫面
        case UITableViewCellEditingStyleInsert:
            
            break;
        case UITableViewCellEditingStyleNone:
            break;
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
