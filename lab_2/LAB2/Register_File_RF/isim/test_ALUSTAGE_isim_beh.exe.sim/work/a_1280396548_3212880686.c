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
static const char *ng0 = "C:/Users/user00000/Desktop/LAB2/Register_File_RF/ALU_Outputs.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_1280396548_3212880686_p_0(char *t0)
{
    char t55[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    unsigned char t23;
    unsigned char t24;
    unsigned char t25;
    char *t26;
    char *t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned char t32;
    char *t33;
    char *t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned char t39;
    unsigned char t40;
    unsigned char t41;
    char *t42;
    char *t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned char t48;
    unsigned char t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 5984);
    t4 = xsi_mem_cmp(t1, t2, 4U);
    if (t4 == 1)
        goto LAB3;

LAB6:    t5 = (t0 + 5988);
    t7 = xsi_mem_cmp(t5, t2, 4U);
    if (t7 == 1)
        goto LAB4;

LAB7:
LAB5:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 3552);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 3680);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(53, ng0);
    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t11 = (31 - 31);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t9 = (t10 + t14);
    t15 = *((unsigned char *)t9);
    t16 = (t0 + 1352U);
    t17 = *((char **)t16);
    t18 = (31 - 31);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t16 = (t17 + t21);
    t22 = *((unsigned char *)t16);
    t23 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t15, t22);
    t24 = (t23 == (unsigned char)3);
    if (t24 == 1)
        goto LAB12;

LAB13:    t26 = (t0 + 1192U);
    t27 = *((char **)t26);
    t28 = (31 - 31);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t26 = (t27 + t31);
    t32 = *((unsigned char *)t26);
    t33 = (t0 + 1352U);
    t34 = *((char **)t33);
    t35 = (31 - 31);
    t36 = (t35 * -1);
    t37 = (1U * t36);
    t38 = (0 + t37);
    t33 = (t34 + t38);
    t39 = *((unsigned char *)t33);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t39);
    t41 = (t40 == (unsigned char)3);
    if (t41 == 1)
        goto LAB15;

LAB16:    t25 = (unsigned char)0;

LAB17:    t8 = t25;

LAB14:    if (t8 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3552);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB10:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t12 = (t4 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t2 + t14);
    t15 = *((unsigned char *)t1);
    t22 = (t15 == (unsigned char)3);
    if (t22 == 1)
        goto LAB21;

LAB22:    t8 = (unsigned char)0;

LAB23:    if (t8 != 0)
        goto LAB18;

LAB20:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t12 = (t4 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t2 + t14);
    t15 = *((unsigned char *)t1);
    t22 = (t15 == (unsigned char)2);
    if (t22 == 1)
        goto LAB29;

LAB30:    t8 = (unsigned char)0;

LAB31:    if (t8 != 0)
        goto LAB27;

LAB28:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB19:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5812U);
    t3 = (t0 + 5992);
    t6 = (t55 + 0U);
    t9 = (t6 + 0U);
    *((int *)t9) = 0;
    t9 = (t6 + 4U);
    *((int *)t9) = 31;
    t9 = (t6 + 8U);
    *((int *)t9) = 1;
    t4 = (31 - 0);
    t12 = (t4 * 1);
    t12 = (t12 + 1);
    t9 = (t6 + 12U);
    *((unsigned int *)t9) = t12;
    t8 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t55);
    if (t8 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 3680);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB36:    goto LAB2;

LAB4:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t12 = (t4 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t2 + t14);
    t8 = *((unsigned char *)t1);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t7 = (31 - 31);
    t19 = (t7 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t15 = *((unsigned char *)t3);
    t22 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t8, t15);
    t23 = (t22 == (unsigned char)2);
    if (t23 != 0)
        goto LAB38;

LAB40:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t12 = (t4 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t2 + t14);
    t8 = *((unsigned char *)t1);
    t15 = (t8 == (unsigned char)3);
    if (t15 != 0)
        goto LAB41;

LAB43:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 3552);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB42:
LAB39:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t12 = (t4 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t2 + t14);
    t15 = *((unsigned char *)t1);
    t22 = (t15 == (unsigned char)3);
    if (t22 == 1)
        goto LAB47;

LAB48:    t8 = (unsigned char)0;

LAB49:    if (t8 != 0)
        goto LAB44;

LAB46:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t12 = (t4 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t2 + t14);
    t15 = *((unsigned char *)t1);
    t22 = (t15 == (unsigned char)2);
    if (t22 == 1)
        goto LAB55;

LAB56:    t8 = (unsigned char)0;

LAB57:    if (t8 != 0)
        goto LAB53;

LAB54:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB45:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5812U);
    t3 = (t0 + 6024);
    t6 = (t55 + 0U);
    t9 = (t6 + 0U);
    *((int *)t9) = 0;
    t9 = (t6 + 4U);
    *((int *)t9) = 31;
    t9 = (t6 + 8U);
    *((int *)t9) = 1;
    t4 = (31 - 0);
    t12 = (t4 * 1);
    t12 = (t12 + 1);
    t9 = (t6 + 12U);
    *((unsigned int *)t9) = t12;
    t8 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t55);
    if (t8 != 0)
        goto LAB61;

LAB63:    xsi_set_current_line(111, ng0);
    t1 = (t0 + 3680);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB62:    goto LAB2;

LAB8:;
LAB9:    xsi_set_current_line(54, ng0);
    t50 = (t0 + 3552);
    t51 = (t50 + 56U);
    t52 = *((char **)t51);
    t53 = (t52 + 56U);
    t54 = *((char **)t53);
    *((unsigned char *)t54) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t50);
    goto LAB10;

LAB12:    t8 = (unsigned char)1;
    goto LAB14;

LAB15:    t42 = (t0 + 1032U);
    t43 = *((char **)t42);
    t44 = (31 - 31);
    t45 = (t44 * -1);
    t46 = (1U * t45);
    t47 = (0 + t46);
    t42 = (t43 + t47);
    t48 = *((unsigned char *)t42);
    t49 = (t48 == (unsigned char)2);
    t25 = t49;
    goto LAB17;

LAB18:    xsi_set_current_line(60, ng0);
    t6 = (t0 + 1032U);
    t9 = *((char **)t6);
    t11 = (31 - 31);
    t29 = (t11 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t6 = (t9 + t31);
    t25 = *((unsigned char *)t6);
    t32 = (t25 == (unsigned char)2);
    if (t32 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB25:    goto LAB19;

LAB21:    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t7 = (31 - 31);
    t19 = (t7 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t23 = *((unsigned char *)t3);
    t24 = (t23 == (unsigned char)3);
    t8 = t24;
    goto LAB23;

LAB24:    xsi_set_current_line(61, ng0);
    t10 = (t0 + 3616);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    t26 = (t17 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t10);
    goto LAB25;

LAB27:    xsi_set_current_line(66, ng0);
    t6 = (t0 + 1032U);
    t9 = *((char **)t6);
    t11 = (31 - 31);
    t29 = (t11 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t6 = (t9 + t31);
    t25 = *((unsigned char *)t6);
    t32 = (t25 == (unsigned char)3);
    if (t32 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB33:    goto LAB19;

LAB29:    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t7 = (31 - 31);
    t19 = (t7 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t23 = *((unsigned char *)t3);
    t24 = (t23 == (unsigned char)2);
    t8 = t24;
    goto LAB31;

LAB32:    xsi_set_current_line(67, ng0);
    t10 = (t0 + 3616);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    t26 = (t17 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t10);
    goto LAB33;

LAB35:    xsi_set_current_line(76, ng0);
    t9 = (t0 + 3680);
    t10 = (t9 + 56U);
    t16 = *((char **)t10);
    t17 = (t16 + 56U);
    t26 = *((char **)t17);
    *((unsigned char *)t26) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB36;

LAB38:    xsi_set_current_line(84, ng0);
    t6 = (t0 + 1032U);
    t9 = *((char **)t6);
    t11 = (31 - 31);
    t29 = (t11 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t6 = (t9 + t31);
    t24 = *((unsigned char *)t6);
    t10 = (t0 + 3552);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    t26 = (t17 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = t24;
    xsi_driver_first_trans_fast_port(t10);
    goto LAB39;

LAB41:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 3552);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t3);
    goto LAB42;

LAB44:    xsi_set_current_line(94, ng0);
    t6 = (t0 + 1032U);
    t9 = *((char **)t6);
    t11 = (31 - 31);
    t29 = (t11 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t6 = (t9 + t31);
    t25 = *((unsigned char *)t6);
    t32 = (t25 == (unsigned char)2);
    if (t32 != 0)
        goto LAB50;

LAB52:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB51:    goto LAB45;

LAB47:    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t7 = (31 - 31);
    t19 = (t7 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t23 = *((unsigned char *)t3);
    t24 = (t23 == (unsigned char)3);
    t8 = t24;
    goto LAB49;

LAB50:    xsi_set_current_line(95, ng0);
    t10 = (t0 + 3616);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    t26 = (t17 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t10);
    goto LAB51;

LAB53:    xsi_set_current_line(100, ng0);
    t6 = (t0 + 1032U);
    t9 = *((char **)t6);
    t11 = (31 - 31);
    t29 = (t11 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t6 = (t9 + t31);
    t25 = *((unsigned char *)t6);
    t32 = (t25 == (unsigned char)3);
    if (t32 != 0)
        goto LAB58;

LAB60:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB59:    goto LAB45;

LAB55:    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t7 = (31 - 31);
    t19 = (t7 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t23 = *((unsigned char *)t3);
    t24 = (t23 == (unsigned char)2);
    t8 = t24;
    goto LAB57;

LAB58:    xsi_set_current_line(101, ng0);
    t10 = (t0 + 3616);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    t26 = (t17 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t10);
    goto LAB59;

LAB61:    xsi_set_current_line(109, ng0);
    t9 = (t0 + 3680);
    t10 = (t9 + 56U);
    t16 = *((char **)t10);
    t17 = (t16 + 56U);
    t26 = *((char **)t17);
    *((unsigned char *)t26) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB62;

}


extern void work_a_1280396548_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1280396548_3212880686_p_0};
	xsi_register_didat("work_a_1280396548_3212880686", "isim/test_ALUSTAGE_isim_beh.exe.sim/work/a_1280396548_3212880686.didat");
	xsi_register_executes(pe);
}
