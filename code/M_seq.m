%% ——扩频——

clc;
clear;
close all;

%% ——产生m序列——

C = [1 0 0 0 0 0]; % C为寄存器反馈系数
n = length(C); % 生成了n个码元的m序列
N = 2^n-1; % 码元个数
register = [0 0 0 0 0 1]; % 移位寄存器的初始状态，需要修改每次初始状态，长度与C相同

L = (1:N)*1; % 绘图用 横轴共有n个点
m_seq = zeros(1 , length(N)); % 初始化输出序列m_seq

for i = 1:N % 逐个修改输出寄存器状态
    newregister(1) = mod(sum(C.*register), 2); % 计算下一个寄存器状态，即a(n)的状态
    for j = 2:n % 重新生成新的寄存器状态序列
    newregister(j) = register(j - 1);     
    end      
    register = newregister; % 将新的寄存器序列存入
    m_seq(i) = register(n); % m序列的第i个输出码元 ,为第i个的新寄存器a0状态
end

m_seq = (m_seq-0.5)*2;
