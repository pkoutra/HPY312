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
static const char *ng0 = "C:/Users/user00000/Desktop/lab4.2/Register_File_RF/counterAdd1.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_4275931156_3212880686_p_0(char *t0)
{
    char t17[16];
    char t18[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3240);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t4 = (t0 + 1352U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)2);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 5328U);
    t5 = (t0 + 5364);
    t11 = (t18 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 4;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t19 = (4 - 0);
    t20 = (t19 * 1);
    t20 = (t20 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t20;
    t12 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t17, t4, t2, t5, t18);
    t13 = (t17 + 12U);
    t20 = *((unsigned int *)t13);
    t21 = (1U * t20);
    t1 = (5U != t21);
    if (t1 == 1)
        goto LAB11;

LAB12:    t14 = (t0 + 3336);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t12, 5U);
    xsi_driver_first_trans_fast(t14);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 5359);
    t12 = (t0 + 3336);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t4, 5U);
    xsi_driver_first_trans_fast(t12);
    goto LAB9;

LAB11:    xsi_size_not_matching(5U, t21, 0);
    goto LAB12;

}

static void work_a_4275931156_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(54, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 3400);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3256);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4275931156_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4275931156_3212880686_p_0,(void *)work_a_4275931156_3212880686_p_1};
	xsi_register_didat("work_a_4275931156_3212880686", "isim/proc4_isim_beh.exe.sim/work/a_4275931156_3212880686.didat");
	xsi_register_executes(pe);
}
