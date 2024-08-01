def factorial(n):  
    if n == 0 or n == 1:  
        return 1  
    else:  
        return n * factorial(n-1)  
  
# 测试代码  
n = int(input("请输入一个非负整数: "))  
if n < 0:  
    print("输入错误！请输入一个非负整数。")  
else:  
    result = factorial(n)  
    print(f"{n}的阶乘是: {result}")
