//hold the keyboard, point show in screen.
//release the keyboard，point disappear

//填屏准备
@SCREEN
D=A
@0
M=D             // 我们用 Mem[0] 来存储当前可用(还未被fill的最靠前的地址)的屏幕内存单元的地址
@24575          // 这个位置是屏幕内存的最后一个内存单元
D=A
@1
M=D             // 再用 Mem[1] 来存储屏幕内存的最后一个内存单元

//首先我们定义一个无限循环
(LOOP)

     //监测键盘是否有被按下
     @KBD
     D=M
     @FILL    //填充屏幕代码起始的位置
     D;JGT    //如果KBD里有值，就跳去(fill)位置填充屏幕
     @CLEAR   //清屏位置代码
     0;JMP    //跳去清屏（如果(fill)没被跳到）

@LOOP
0;JMP

(FILL)          // 填屏开始
@1
D=M             // 先把 最大屏幕内存单元的地址 Mem[1] load进D
@0
D=D-M           // 最大屏幕内存地址 - 当前填充到的位置 = 可用内存单元数量
@LOOP
D;JLT           // 如果 < 0 , 表示填满了，跳走

@0             //f1
D=M            //f2
A=D            //f3
M=-1           //上面f1,f2,f3这几步看似让人摸不着头脑，实则做的事情很简单，首先load Mem[0] (当前可用屏幕内存) 到D和A, 然后把当前屏幕内存置为-1（填充）
@0
D=M
D=D+1
M=D            //把 当前可用屏幕内存 往后推一个
@LOOP
0;JMP          //跳走，跳到键盘监听处

//清除屏幕
//1. 获取当前可用的屏幕内存单元地址， 用 Mem[0] == @SCREEN 来判断是否清除完毕
//2. 如果清除完毕了，跳到键盘loop处，如果没有，则开始清屏
//3. 开始清屏：1.首先把当前屏幕内存单元置0，然后再把可用标记往前退一个
(CLEAR)
@0
D=M
@SCREEN
D=D+1      //边界情况
D=A-D
@LOOP
D;JEQ

//开始清屏
@0
D=M
A=D
M=0
@0
M=M-1
@LOOP
0;JMP






