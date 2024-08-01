function result = factorial(n)  
    if n < 0  
        error('输入错误！请输入一个非负整数。');  
    elseif n == 0 || n == 1  
        result = 1;  
    else  
        result = 1;  
        for i = 2:n  
            result = result * i;  
        end  
    end  
end  
  
% 测试代码  
n = input('请输入一个非负整数: ');  
try  
    result = factorial(n);  
    fprintf('%d的阶乘是: %d\n', n, result);  
catch ME  
    if strcmp(ME.identifier, 'MATLAB:narginchk:notEnoughInputs')  
        fprintf('没有输入任何数字。\n');  
    else  
        fprintf('发生错误: %s\n', ME.message);  
    end  
end