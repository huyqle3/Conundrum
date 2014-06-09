//
//  TopicViewController.m
//  Conundrum
//
//  Created by Winston Chen on 6/8/14.
//  Copyright (c) 2014 BUILDS. All rights reserved.
//

#import "TopicViewController.h"
#import "RATreeView.h"
#import "TopicDataObject.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TopicViewController ()<RATreeViewDelegate, RATreeViewDataSource>

@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) id expanded;
@property (weak, nonatomic) RATreeView *treeView;

@end

@implementation TopicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TopicDataObject *agriculture = [TopicDataObject dataObjectWithName:@"Agriculture"
                                                  children:[NSArray arrayWithObjects: nil]];
    
    TopicDataObject *buildingpermits = [TopicDataObject dataObjectWithName:@"Building Permits"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *commerce = [TopicDataObject dataObjectWithName:@"Commerce"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *commercialbanking = [TopicDataObject dataObjectWithName:@"Commercial Banking"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *commodities = [TopicDataObject dataObjectWithName:@"Commodities"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *communications = [TopicDataObject dataObjectWithName:@"Communications"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *consumer = [TopicDataObject dataObjectWithName:@"Consumer"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *corporateregistration = [TopicDataObject dataObjectWithName:@"Corporate Registration"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *defense = [TopicDataObject dataObjectWithName:@"Defense"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *demographics = [TopicDataObject dataObjectWithName:@"Demographics"
                                                        children:[NSArray arrayWithObjects: nil]];
    //
    TopicDataObject *energycommodities = [TopicDataObject dataObjectWithName:@"Commodities" children:nil];
    TopicDataObject *energyenvironment = [TopicDataObject dataObjectWithName:@"Environment" children:nil];
    TopicDataObject *energyhealth = [TopicDataObject dataObjectWithName:@"Health" children:nil];
    TopicDataObject *energyinfrastructure = [TopicDataObject dataObjectWithName:@"Infrastructure" children:nil];
    TopicDataObject *energynaturalresource = [TopicDataObject dataObjectWithName:@"Natural Resources" children:nil];
    TopicDataObject *energytransportation = [TopicDataObject dataObjectWithName:@"Transportation" children:nil];
    
    
    TopicDataObject *energy = [TopicDataObject dataObjectWithName:@"Energy"
                                                        children:[NSArray arrayWithObjects: energycommodities,energyenvironment,energyhealth,energyinfrastructure,energynaturalresource,energytransportation, nil]];
    TopicDataObject *environment = [TopicDataObject dataObjectWithName:@"Environment"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *financialfilings = [TopicDataObject dataObjectWithName:@"Financial Filings"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *governmentspending = [TopicDataObject dataObjectWithName:@"Government Spending"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *grantedfoia = [TopicDataObject dataObjectWithName:@"Granted Foia"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *health = [TopicDataObject dataObjectWithName:@"Health"
                                                        children:[NSArray arrayWithObjects:  nil]];
    //
    TopicDataObject *immigrationlabor = [TopicDataObject dataObjectWithName:@"Labor" children:nil];
    TopicDataObject *immigrationinternationaldevelopment = [TopicDataObject dataObjectWithName:@"International Development" children:nil];
    TopicDataObject *immigration = [TopicDataObject dataObjectWithName:@"Immigration"
                                                        children:[NSArray arrayWithObjects: immigrationinternationaldevelopment,immigrationlabor, nil]];
    TopicDataObject *infrastructure = [TopicDataObject dataObjectWithName:@"Infrastructure"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *inspection = [TopicDataObject dataObjectWithName:@"Inspection"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *intellectualproperty = [TopicDataObject dataObjectWithName:@"Intellectual Property"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *internationaldevelopment = [TopicDataObject dataObjectWithName:@"International Development"
                                                        children:[NSArray arrayWithObjects:  nil]];
    //
    TopicDataObject *laborcommerce = [TopicDataObject dataObjectWithName:@"Commerce" children:nil];
    TopicDataObject *laborcommodities = [TopicDataObject dataObjectWithName:@"Commodities" children:nil];
    TopicDataObject *laborconsumer = [TopicDataObject dataObjectWithName:@"Consumer" children:nil];
    TopicDataObject *labordefense = [TopicDataObject dataObjectWithName:@"Defense" children:nil];
    TopicDataObject *labordemographics = [TopicDataObject dataObjectWithName:@"Demographics" children:nil];
    TopicDataObject *laborenvironment = [TopicDataObject dataObjectWithName:@"Environment" children:nil];
    TopicDataObject *laborfinancialfilings = [TopicDataObject dataObjectWithName:@"Financial Filings" children:nil];
    TopicDataObject *laborgovernmentspending = [TopicDataObject dataObjectWithName:@"Government Spending" children:nil];
    TopicDataObject *laborgrantedfoia = [TopicDataObject dataObjectWithName:@"Granted Foia" children:nil];
                                         TopicDataObject *laborhealth = [TopicDataObject dataObjectWithName:@"Health" children:nil];
                                         TopicDataObject *laborimmigration = [TopicDataObject dataObjectWithName:@"Immigration" children:nil];
                                         TopicDataObject *labormacroeconomics = [TopicDataObject dataObjectWithName:@"Macroeconomics" children:nil];
                                         TopicDataObject *labortechnology = [TopicDataObject dataObjectWithName:@"Technology" children:nil];
                                         TopicDataObject *labortransportation = [TopicDataObject dataObjectWithName:@"Transportation" children:nil];
                                         
    TopicDataObject *labor = [TopicDataObject dataObjectWithName:@"Labor"
                                                        children:[NSArray arrayWithObjects:laborcommerce,laborcommodities,laborconsumer,labordefense,labordemographics,laborenvironment,laborfinancialfilings,laborgovernmentspending,laborgrantedfoia,laborhealth,laborimmigration,labormacroeconomics,labortechnology,labortransportation, nil]];
    TopicDataObject *legislation = [TopicDataObject dataObjectWithName:@"Legislation"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *license = [TopicDataObject dataObjectWithName:@"License"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *liens = [TopicDataObject dataObjectWithName:@"Liens"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *lobbying = [TopicDataObject dataObjectWithName:@"Lobbying"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *macroeconomics = [TopicDataObject dataObjectWithName:@"Macroeconomics"
                                                        children:[NSArray arrayWithObjects:  nil]];
    
    //
    TopicDataObject *naturalresourcecommodities = [TopicDataObject dataObjectWithName:@"Commodities" children:nil];
    TopicDataObject *naturalresourceenergy = [TopicDataObject dataObjectWithName:@"Energy" children:nil];
    TopicDataObject *naturalresourceenvironment = [TopicDataObject dataObjectWithName:@"Environment" children:nil];
    TopicDataObject *naturalresourcehealth = [TopicDataObject dataObjectWithName:@"Health" children:nil];
    TopicDataObject *naturalresourcetransportation = [TopicDataObject dataObjectWithName:@"Transportation" children:nil];
    TopicDataObject *naturalresources = [TopicDataObject dataObjectWithName:@"Natural Resources"
                                                        children:[NSArray arrayWithObjects:naturalresourcecommodities,naturalresourceenergy,naturalresourceenvironment,naturalresourcehealth,naturalresourcetransportation,  nil]];
    //
    TopicDataObject *politicsfinancialfilings = [TopicDataObject dataObjectWithName:@"Financial Filings" children:nil];
    TopicDataObject *politicsgovernmentspending = [TopicDataObject dataObjectWithName:@"Government Spending" children:nil];
    TopicDataObject *politicshealth = [TopicDataObject dataObjectWithName:@"Health" children:nil];
    TopicDataObject *politicslegislature= [TopicDataObject dataObjectWithName:@"Legislature" children:nil];
    TopicDataObject *politicslobbying = [TopicDataObject dataObjectWithName:@"Lobbying" children:nil];
    TopicDataObject *politicssecurity = [TopicDataObject dataObjectWithName:@"Security" children:nil];
    TopicDataObject *politics = [TopicDataObject dataObjectWithName:@"Politics"
                                                        children:[NSArray arrayWithObjects:politicsfinancialfilings,politicsgovernmentspending,politicshealth,politicslegislature,politicslobbying,politicssecurity,  nil]];
    //
    TopicDataObject *realestatebuildingpermits = [TopicDataObject dataObjectWithName:@"Building Permits" children:nil];
    TopicDataObject *realestatecommerce = [TopicDataObject dataObjectWithName:@"Commerce" children:nil];
    TopicDataObject *realestateconsumer = [TopicDataObject dataObjectWithName:@"Consumer" children:nil];

    TopicDataObject *realestatedemographics = [TopicDataObject dataObjectWithName:@"Demographics" children:nil];
    TopicDataObject *realestateenvironment = [TopicDataObject dataObjectWithName:@"Environment" children:nil];
    TopicDataObject *realestategovernmentspending = [TopicDataObject dataObjectWithName:@"Government Spending" children:nil];
                                    TopicDataObject *realestatehealth = [TopicDataObject dataObjectWithName:@"Health" children:nil];
                                    TopicDataObject *realestateinfrastructure = [TopicDataObject dataObjectWithName:@"Infrastructure" children:nil];
                                    TopicDataObject *realestateinspections = [TopicDataObject dataObjectWithName:@"Inspections" children:nil];
    TopicDataObject *realestate = [TopicDataObject dataObjectWithName:@"Real Estate"
                                                        children:[NSArray arrayWithObjects:realestatebuildingpermits,realestatecommerce,realestateconsumer,realestatedemographics,realestateenvironment,realestategovernmentspending,realestatehealth,realestateinfrastructure,realestateinspections,  nil]];
    TopicDataObject *salestax = [TopicDataObject dataObjectWithName:@"Sales Tax"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *security = [TopicDataObject dataObjectWithName:@"Security"
                                                        children:[NSArray arrayWithObjects:  nil]];
    TopicDataObject *technology = [TopicDataObject dataObjectWithName:@"Technology"
                                                        children:[NSArray arrayWithObjects: nil]];
    TopicDataObject *transportation = [TopicDataObject dataObjectWithName:@"Transportation"
                                                        children:[NSArray arrayWithObjects:  nil]];
   
    
    
    self.data = [NSArray arrayWithObjects: agriculture,buildingpermits,commerce,commercialbanking,commodities,communications,consumer,corporateregistration,defense,demographics,energy,environment,financialfilings,governmentspending,grantedfoia,health,immigration,infrastructure,inspection,intellectualproperty,internationaldevelopment,labor,legislation,license,liens,lobbying,macroeconomics,naturalresources,politics,realestate,salestax,security,technology,transportation,nil];
    
    RATreeView *treeView = [[RATreeView alloc] initWithFrame:self.view.frame];
    
    treeView.delegate = self;
    treeView.dataSource = self;
    treeView.separatorStyle = RATreeViewCellSeparatorStyleSingleLine;
    
    [treeView reloadData];
    //[treeView expandRowForItem:agriculture withRowAnimation:RATreeViewRowAnimationLeft]; //expands Row
    [treeView setBackgroundColor:UIColorFromRGB(0xF7F7F7)];
    
    self.treeView = treeView;
    [self.view addSubview:treeView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if([[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."][0] intValue] >= 7) {
        CGRect statusBarViewRect = [[UIApplication sharedApplication] statusBarFrame];
        float heightPadding = statusBarViewRect.size.height+self.navigationController.navigationBar.frame.size.height;
        self.treeView.contentInset = UIEdgeInsetsMake(heightPadding, 0.0, 0.0, 0.0);
        self.treeView.contentOffset = CGPointMake(0.0, -heightPadding);
    }
    
    self.treeView.frame = self.view.bounds;
}

#pragma mark TreeView Delegate methods
- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return 47;
}

- (NSInteger)treeView:(RATreeView *)treeView indentationLevelForRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return 3 * treeNodeInfo.treeDepthLevel;
}

- (BOOL)treeView:(RATreeView *)treeView shouldExpandItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return YES;
}

- (BOOL)treeView:(RATreeView *)treeView shouldItemBeExpandedAfterDataReload:(id)item treeDepthLevel:(NSInteger)treeDepthLevel
{
    if ([item isEqual:self.expanded]) {
        return YES;
    }
    
    return NO;
}

- (void)treeView:(RATreeView *)treeView willDisplayCell:(UITableViewCell *)cell forItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    if (treeNodeInfo.treeDepthLevel == 0) {
        cell.backgroundColor = UIColorFromRGB(0xF7F7F7);
    } else if (treeNodeInfo.treeDepthLevel == 1) {
        cell.backgroundColor = UIColorFromRGB(0xD1EEFC);
    } else if (treeNodeInfo.treeDepthLevel == 2) {
        cell.backgroundColor = UIColorFromRGB(0xE0F8D8);
    }
}

#pragma mark TreeView Data Source

- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    NSInteger numberOfChildren = [treeNodeInfo.children count];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"Number of children %@", [@(numberOfChildren) stringValue]];
    cell.textLabel.text = ((TopicDataObject *)item).name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (treeNodeInfo.treeDepthLevel == 0) {
        cell.detailTextLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [self.data count];
    }
    
    TopicDataObject *data = item;
    return [data.children count];
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    TopicDataObject *data = item;
    if (item == nil) {
        return [self.data objectAtIndex:index];
    }
    
    return [data.children objectAtIndex:index];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
