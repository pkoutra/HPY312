/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/user00000/Desktop/lab4.2/Register_File_RF/Compare_Module.vhd";



static void work_a_3599674430_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t6 = 1;
    if (5U == 5U)
        goto LAB11;

LAB12:    t6 = 0;

LAB13:    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 3072);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t3);

LAB3:    t3 = (t0 + 2992);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t19 = (t0 + 3072);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t19);
    goto LAB3;

LAB5:    t9 = (t0 + 1032U);
    t13 = *((char **)t9);
    t9 = (t0 + 4903);
    t15 = 1;
    if (5U == 5U)
        goto LAB17;

LAB18:    t15 = 0;

LAB19:    t1 = (!(t15));
    goto LAB7;

LAB8:    t9 = (t0 + 1352U);
    t10 = *((char **)t9);
    t11 = *((unsigned char *)t10);
    t12 = (t11 == (unsigned char)3);
    t2 = t12;
    goto LAB10;

LAB11:    t7 = 0;

LAB14:    if (t7 < 5U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t3 = (t4 + t7);
    t8 = (t5 + t7);
    if (*((unsigned char *)t3) != *((unsigned char *)t8))
        goto LAB12;

LAB16:    t7 = (t7 + 1);
    goto LAB14;

LAB17:    t16 = 0;

LAB20:    if (t16 < 5U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t17 = (t13 + t16);
    t18 = (t9 + t16);
    if (*((unsigned char *)t17) != *((unsigned char *)t18))
        goto LAB18;

LAB22:    t16 = (t16 + 1);
    goto LAB20;

}


extern void work_a_3599674430_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3599674430_3212880686_p_0};
	xsi_register_didat("work_a_3599674430_3212880686", "isim/proc4_isim_beh.exe.sim/work/a_3599674430_3212880686.didat");
	xsi_register_executes(pe);
}
