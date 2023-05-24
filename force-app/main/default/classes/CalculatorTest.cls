@IsTest
public class CalculatorTest {
    @IsTest
    public static void testAddNumbers() {
            system.debug('Test test 6');
        Integer num1 = 5;
        Integer num2 = 10;
        
        Calculator calc = new Calculator();
        Integer result = calc.addNumbers(num1, num2);
        
        System.assertEquals(15, result, 'The addition result is incorrect');
    }
}