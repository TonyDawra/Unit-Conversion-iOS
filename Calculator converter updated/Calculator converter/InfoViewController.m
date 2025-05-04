// InfoViewController.m
#import "InfoViewController.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *appLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *visitorCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *appInfoTextView;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up content views
    self.appLogoImageView.image = [UIImage imageNamed:@"logo"];
    // Update visitor count
    NSInteger visitorCount = [self fetchVisitorCount];
    self.visitorCountLabel.text = [NSString stringWithFormat:@"Visitors: %ld", (long)visitorCount];
    
    // App information
    NSString *appInfo = @"This app is used for measurement conversions. The user first choose what measurement he/she wants then the unit.";
    self.appInfoTextView.text = appInfo;
}

- (NSInteger)fetchVisitorCount {
    // Retrieve the visitor count from NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger visitorCount = [defaults integerForKey:@"VisitorCount"];
    
    // Check if the visitor count is already stored, if not, set it to an initial value
    if (visitorCount == 0) {
        visitorCount = 1; // Assuming the first launch counts as a visit
        [defaults setInteger:visitorCount forKey:@"VisitorCount"];
    } else {
        // Increment the visitor count for subsequent visits
        visitorCount++;
        [defaults setInteger:visitorCount forKey:@"VisitorCount"];
    }
    
    // Synchronize changes to NSUserDefaults
    [defaults synchronize];
    
    return visitorCount;
}

@end
