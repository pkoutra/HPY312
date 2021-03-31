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
static const char *ng0 = "C:/Users/user00000/Desktop/lab5org -fwd - stall/FORWARD_UNIT.vhd";



static void work_a_3946787226_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB16;

LAB17:    t1 = (unsigned char)0;

LAB18:    if (t1 != 0)
        goto LAB14;

LAB15:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 6244);
    t6 = (t0 + 3872);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast_port(t6);

LAB3:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB28;

LAB29:    t1 = (unsigned char)0;

LAB30:    if (t1 != 0)
        goto LAB25;

LAB27:    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB39;

LAB40:    t1 = (unsigned char)0;

LAB41:    if (t1 != 0)
        goto LAB37;

LAB38:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 6250);
    t6 = (t0 + 3936);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast_port(t6);

LAB26:    t2 = (t0 + 3792);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(70, ng0);
    t11 = (t0 + 6240);
    t13 = (t0 + 3872);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 2U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB3;

LAB5:    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = (t0 + 1192U);
    t7 = *((char **)t2);
    t8 = 1;
    if (5U == 5U)
        goto LAB8;

LAB9:    t8 = 0;

LAB10:    t1 = t8;
    goto LAB7;

LAB8:    t9 = 0;

LAB11:    if (t9 < 5U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t2 = (t6 + t9);
    t10 = (t7 + t9);
    if (*((unsigned char *)t2) != *((unsigned char *)t10))
        goto LAB9;

LAB13:    t9 = (t9 + 1);
    goto LAB11;

LAB14:    xsi_set_current_line(72, ng0);
    t11 = (t0 + 6242);
    t13 = (t0 + 3872);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 2U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB3;

LAB16:    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t2 = (t0 + 1192U);
    t7 = *((char **)t2);
    t8 = 1;
    if (5U == 5U)
        goto LAB19;

LAB20:    t8 = 0;

LAB21:    t1 = t8;
    goto LAB18;

LAB19:    t9 = 0;

LAB22:    if (t9 < 5U)
        goto LAB23;
    else
        goto LAB21;

LAB23:    t2 = (t6 + t9);
    t10 = (t7 + t9);
    if (*((unsigned char *)t2) != *((unsigned char *)t10))
        goto LAB20;

LAB24:    t9 = (t9 + 1);
    goto LAB22;

LAB25:    xsi_set_current_line(80, ng0);
    t11 = (t0 + 6246);
    t13 = (t0 + 3936);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 2U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB26;

LAB28:    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t8 = 1;
    if (5U == 5U)
        goto LAB31;

LAB32:    t8 = 0;

LAB33:    t1 = t8;
    goto LAB30;

LAB31:    t9 = 0;

LAB34:    if (t9 < 5U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t2 = (t6 + t9);
    t10 = (t7 + t9);
    if (*((unsigned char *)t2) != *((unsigned char *)t10))
        goto LAB32;

LAB36:    t9 = (t9 + 1);
    goto LAB34;

LAB37:    xsi_set_current_line(82, ng0);
    t11 = (t0 + 6248);
    t13 = (t0 + 3936);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 2U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB26;

LAB39:    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t8 = 1;
    if (5U == 5U)
        goto LAB42;

LAB43:    t8 = 0;

LAB44:    t1 = t8;
    goto LAB41;

LAB42:    t9 = 0;

LAB45:    if (t9 < 5U)
        goto LAB46;
    else
        goto LAB44;

LAB46:    t2 = (t6 + t9);
    t10 = (t7 + t9);
    if (*((unsigned char *)t2) != *((unsigned char *)t10))
        goto LAB43;

LAB47:    t9 = (t9 + 1);
    goto LAB45;

}


extern void work_a_3946787226_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3946787226_3212880686_p_0};
	xsi_register_didat("work_a_3946787226_3212880686", "isim/lab5_isim_beh.exe.sim/work/a_3946787226_3212880686.didat");
	xsi_register_executes(pe);
}
