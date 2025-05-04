// LengthViewController.m
#import "LengthViewController.h"

@interface LengthViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic, strong) NSArray *conversionMethods;
@property (nonatomic, assign) NSInteger selectedMethodIndex;

@end

@implementation LengthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize conversion methods
    self.conversionMethods = @[@"cm to m", @"m to cm"];
    
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
    NSString *inputText = self.inputTextField.text;
    double inputValue = [inputText doubleValue];
    
    // Perform the conversion based on the selected method
    double convertedValue = [self convertValue:inputValue forMethod:selectedMethod];
    
    // Update the result label with the converted value
    self.resultLabel.text = [NSString stringWithFormat:@"Converted value: %.4f", convertedValue];
}

#pragma mark - Conversion Methods

- (double)convertValue:(double)value forMethod:(NSString *)method {
    // Perform the conversion based on the selected method
    if ([method isEqualToString:@"cm to m"]) {
        return value / 100.0;
    } else if ([method isEqualToString:@"m to cm"]) {
        return value * 100.0;
    } else {
        // Unknown conversion method
        return 0.0;
    }
}

@end
