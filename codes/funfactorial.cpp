#include<iostream>  
  
long long factorial(int n){  
    if (n <= 1) {  
        return 1;  
    }  
    return n * factorial(n - 1);  
}  
  
int main(){  
    int n;  
    std::cout <<"请输入一个整数: ";  
    std::cin >> n;  
    if (n < 0) {  
        std::cout <<"请输入一个非负整数。" << std::endl;  
        return 1;  
    }  
    std::cout << n <<"的阶乘是: " << factorial(n) << std::endl;  
    return 0;  
}