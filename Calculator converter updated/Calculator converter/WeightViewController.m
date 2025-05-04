// WeightViewController.m
#import "WeightViewController.h"

@interface WeightViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *inputLabel;
@property (weak, nonatomic) IBOutlet UILabel *convertedLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *conversionMethods;
@property (nonatomic, assign) NSInteger selectedMethodIndex;

@end

@implementation WeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize conversion methods
    self.conversionMethods = @[@"g to Kg", @"Kg to g"];
    
    // Connect data
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    // Initialize selected method index
    self.selectedMethodIndex = 0; // Default to the first method
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.conversionMethods.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.conversionMethods[row];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Update selected method index
    self.selectedMethodIndex = row;
}

#pragma mark - Action Methods

- (IBAction)convertButtonTapped:(id)sender {
    // Get the selected conversion method
    NSString *selectedMethod = self.conversionMethods[self.selectedMethodIndex];
    
    // Get the input value from the text field
    NSString *inputText = self.inputLabel.text;
    double inputValue = [inputText doubleValue];
    
    // Perform the conversion based on the selected method
    double convertedValue = [self convertValue:inputValue forMethod:selectedMethod];
    // Update the result label with the converted value
    self.convertedLabel.text = [NSString stringWithFormat:@"Converted value: %.4f", convertedValue];
}

#pragma mark - Conversion Methods

- (double)convertValue:(double)value forMethod:(NSString *)method {
    // Perform the conversion based on the selected method
    if ([method isEqualToString:@"g to Kg"]) {
        return (value / 1000.0);
    } else if ([method isEqualToString:@"Kg to g"]) {
        return value * 1000.0;
    } else {
        // Unknown conversion method
        return 0.0;
    }
}

@end
