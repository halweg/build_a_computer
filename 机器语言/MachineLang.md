编码指令举例：

1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 1

    分解为4个位域:
     1 0 1 0   0 0 1 1  0 0 0 1   1 0 0 1
    |--ADD--|  |--R3--| |--R1--|  |--R9--|


    ADD R1,R2,R3
    ADD R1,R2,foo    //foo: 指代用户定义的标签指向的内存单元的值 
    AND R1,R1,R3 

    内存访问
        1:直接寻址         直接给出 memory address 或用标签表示地址
        LOAD R1, 67      //memory address 63里存放的bit加载到R1里
        LOAD R1, bar     //标签 bar 在汇编器阶段终将被替换成地址
        
        2:立即数寻址       多用于加载常数，直接将字面量load 或 store
        LOADI R1, 67     //把字面量 67 load 进R1
        
        3:间接寻址        指针，数组的寻址办法
        
        x = foo[j]的表示如下:
        ADD    R1, foo, j
        LOAD*  R2, R1
        STR    R2, x       //R2->x

            









