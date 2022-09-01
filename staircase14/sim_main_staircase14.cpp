/* This is cfunc.mod file auto generated by gen_con_info.py
        Developed by Sumanto Kar at IIT Bombay */

        
        #include <memory>
        #include <verilated.h>
        #include "Vstaircase14.h"
        #include <stdio.h>
        #include <stdio.h>
        #include <fstream>
        #include <stdlib.h>
        #include <string>
        #include <iostream>
        #include <cstring>
        using namespace std;
        
        extern "C" int temp_clk[1024];
        extern "C" int port_clk;
        extern "C" int temp_val[1024];
        extern "C" int port_val;
        extern "C" int foostaircase14(int,int);
        
        void int2arrstaircase14(int  num, int array[], int n)
        {
            for (int i = 0; i < n && num>=0; i++)
            {
                array[n-i-1] = num % 2;
                num /= 2;
                }
        }
        int arr2intstaircase14(int array[],int n)
        {
            int i,k=0;
            for (i = 0; i < n; i++)
                k = 2 * k + array[i];
            return k;
        }
        
        int foostaircase14(int init,int count)
        {
            static VerilatedContext* contextp = new VerilatedContext;
            static Vstaircase14* staircase14[1024];
            count--;
            if (init==0)
            {
                staircase14[count]=new Vstaircase14{contextp};
                contextp->traceEverOn(true);
            }
            else
            {
                contextp->timeInc(1);
                printf("=============staircase14 : New Iteration===========");
                printf("\nInstance : %d\n",count);
                printf("\nInside foo before eval.....\n");
				printf("clk=%d\n", staircase14[count] ->clk);
				printf("val=%d\n", staircase14[count] ->val);
				staircase14[count]->clk = arr2intstaircase14(temp_clk, port_clk);
				staircase14[count]->eval();

                printf("\nInside foo after eval.....\n");
				printf("clk=%d\n", staircase14[count] ->clk);
				printf("val=%d\n", staircase14[count] ->val);
				int2arrstaircase14(staircase14[count] -> val, temp_val, port_val);

            }
            return 0;
        }