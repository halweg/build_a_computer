//Multiplies R0 and R1 and stores the result in R2
// 高级实现
// initialize sum = 0;
// while(R1>0){
//     R1--;
//     sum=sum+R0;
// }

    //目标就是把 Mem[0] Mem[1]里的值相乘存入 Mem[2]
    //我们首先把 2 号内存里的数值置为 0 注意Hack平台暂不支持负数！
    @2
    M = 0
    // ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ 判断负数开始
    @0
    D = M    //load Mem[0] 里的值到D寄存器
    @END     //把 (END) 标签位置后的下一条指令地址load进寄存器A，这是为JMP准备的地址，实际上就是倒数第二行地址
    D;JLT    //在前面我们说过了 JTL 的助记符号，他是有条件的 JMP，JMP的位置是(END)
             //当ALU的输出小于零的时候才会才会跳转，我们用之前讲过的助记符D，让D寄存器里的值在ALU里原样输出
    // ⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆ 判断负数结束

    // ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ 我们把乘法换成了加法，Mem[0]被连续加了Mem[1]次
(LOOP)       //同上，这个LOOP标签在编译阶段，将被替换成指令内存中此位置的下一条命令的地址
    @1           //load Mem[1] 里的值到A寄存器
    M = M - 1    //Mem[1] 这个被加的次数减一，
    D = M
    @END
    D;JLT        //助记符D让ALU原样输出寄存器D值，为JLT提供依据

    @0
    D = M
    @2
    M = M + D   //0号内存和2号结果内存里的值复加

    @LOOP       //为jmp提供地址
    0;JMP       //助记符0 ，让ALU什么也别做输出0，这样JMP就直接跳到22行后面
(END)
    @END
    0;JMP






