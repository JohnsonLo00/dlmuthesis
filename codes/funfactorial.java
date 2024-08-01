public class FactorialCalculator {  
  
    public static void main(String[] args) {  
        Scanner scanner = new Scanner(System.in);  
  
        System.out.print("请输入一个非负整数: ");  
        int n = scanner.nextInt();  
  
        if (n < 0) {  
            System.out.println("输入错误！请输入一个非负整数。");  
        } else {  
            long factorial = calculateFactorial(n);  
            System.out.println(n + "的阶乘是: " + factorial);  
        }  
  
        scanner.close();  
    }  
  
    public static long calculateFactorial(int n) {  
        long result = 1;  
        for (int i = 1; i <= n; i++) {  
            result *= i;  
        }  
        return result;  
    }  
}