// TemperatureViewController.m
#import "TemperatureViewController.h"

@interface TemperatureViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *inputLabel;
@property (weak, nonatomic) IBOutlet UILabel *convertedLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *conversionMethods;
@property (nonatomic, assign) NSInteger selectedMethodIndex;

@end

@implementation TemperatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize conversion methods
    self.conversionMethods = @[@"°F to °C", @"°C to °F"];
    
    // Connect data
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
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
    if ([method isEqualToString:@"°F to °C"]) {
        return (value - 32) * 5/9;
    } else if ([method isEqualToString:@"°C to °F"]) {
        return (9/5 * value) + 32;
    } else {
        // Unknown conversion method
        return 0.0;
    }
}

@end
