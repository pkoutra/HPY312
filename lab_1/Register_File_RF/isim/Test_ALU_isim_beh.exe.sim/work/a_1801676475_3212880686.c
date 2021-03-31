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
static const char *ng0 = "C:/Users/user00000/Desktop/LAB1_ORGANWSH/Register_File_RF/ALU_operation.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3798478767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1801676475_3212880686_p_0(char *t0)
{
    char t32[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned char t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5164);
    t4 = xsi_mem_cmp(t1, t2, 4U);
    if (t4 == 1)
        goto LAB3;

LAB14:    t5 = (t0 + 5168);
    t7 = xsi_mem_cmp(t5, t2, 4U);
    if (t7 == 1)
        goto LAB4;

LAB15:    t8 = (t0 + 5172);
    t10 = xsi_mem_cmp(t8, t2, 4U);
    if (t10 == 1)
        goto LAB5;

LAB16:    t11 = (t0 + 5176);
    t13 = xsi_mem_cmp(t11, t2, 4U);
    if (t13 == 1)
        goto LAB6;

LAB17:    t14 = (t0 + 5180);
    t16 = xsi_mem_cmp(t14, t2, 4U);
    if (t16 == 1)
        goto LAB7;

LAB18:    t17 = (t0 + 5184);
    t19 = xsi_mem_cmp(t17, t2, 4U);
    if (t19 == 1)
        goto LAB8;

LAB19:    t20 = (t0 + 5188);
    t22 = xsi_mem_cmp(t20, t2, 4U);
    if (t22 == 1)
        goto LAB9;

LAB20:    t23 = (t0 + 5192);
    t25 = xsi_mem_cmp(t23, t2, 4U);
    if (t25 == 1)
        goto LAB10;

LAB21:    t26 = (t0 + 5196);
    t28 = xsi_mem_cmp(t26, t2, 4U);
    if (t28 == 1)
        goto LAB11;

LAB22:    t29 = (t0 + 5200);
    t31 = xsi_mem_cmp(t29, t2, 4U);
    if (t31 == 1)
        goto LAB12;

LAB23:
LAB13:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 5244);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(47, ng0);
    t33 = (t0 + 1032U);
    t34 = *((char **)t33);
    t33 = (t0 + 5024U);
    t35 = (t0 + 1192U);
    t36 = *((char **)t35);
    t35 = (t0 + 5040U);
    t37 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t32, t34, t33, t36, t35);
    t38 = (t32 + 12U);
    t39 = *((unsigned int *)t38);
    t40 = (1U * t39);
    t41 = (32U != t40);
    if (t41 == 1)
        goto LAB25;

LAB26:    t42 = (t0 + 3072);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    memcpy(t46, t37, 32U);
    xsi_driver_first_trans_fast_port(t42);
    goto LAB2;

LAB4:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5024U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5040U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t32, t2, t1, t5, t3);
    t8 = (t32 + 12U);
    t39 = *((unsigned int *)t8);
    t40 = (1U * t39);
    t41 = (32U != t40);
    if (t41 == 1)
        goto LAB27;

LAB28:    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB5:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5024U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5040U);
    t6 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t32, t2, t1, t5, t3);
    t8 = (t32 + 12U);
    t39 = *((unsigned int *)t8);
    t40 = (1U * t39);
    t41 = (32U != t40);
    if (t41 == 1)
        goto LAB29;

LAB30:    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB6:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5024U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5040U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t32, t2, t1, t5, t3);
    t8 = (t32 + 12U);
    t39 = *((unsigned int *)t8);
    t40 = (1U * t39);
    t41 = (32U != t40);
    if (t41 == 1)
        goto LAB31;

LAB32:    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB7:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5024U);
    t3 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t32, t2, t1);
    t5 = (t32 + 12U);
    t39 = *((unsigned int *)t5);
    t40 = (1U * t39);
    t41 = (32U != t40);
    if (t41 == 1)
        goto LAB33;

LAB34:    t6 = (t0 + 3072);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB2;

LAB8:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t39 = (t4 * -1);
    t40 = (1U * t39);
    t47 = (0 + t40);
    t1 = (t2 + t47);
    t41 = *((unsigned char *)t1);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t41;
    xsi_driver_first_trans_delta(t3, 0U, 1, 0LL);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 5204);
    *((int *)t1) = 30;
    t2 = (t0 + 5208);
    *((int *)t2) = 0;
    t4 = 30;
    t7 = 0;

LAB35:    if (t4 >= t7)
        goto LAB36;

LAB38:    goto LAB2;

LAB9:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3072);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 5212);
    *((int *)t1) = 30;
    t2 = (t0 + 5216);
    *((int *)t2) = 0;
    t4 = 30;
    t7 = 0;

LAB40:    if (t4 >= t7)
        goto LAB41;

LAB43:    goto LAB2;

LAB10:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 3072);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 31U, 1, 0LL);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 5220);
    *((int *)t1) = 31;
    t2 = (t0 + 5224);
    *((int *)t2) = 1;
    t4 = 31;
    t7 = 1;

LAB45:    if (t4 >= t7)
        goto LAB46;

LAB48:    goto LAB2;

LAB11:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (31 - 31);
    t39 = (t4 * -1);
    t40 = (1U * t39);
    t47 = (0 + t40);
    t1 = (t2 + t47);
    t41 = *((unsigned char *)t1);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t41;
    xsi_driver_first_trans_delta(t3, 31U, 1, 0LL);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 5228);
    *((int *)t1) = 0;
    t2 = (t0 + 5232);
    *((int *)t2) = 30;
    t4 = 0;
    t7 = 30;

LAB50:    if (t4 <= t7)
        goto LAB51;

LAB53:    goto LAB2;

LAB12:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (0 - 31);
    t39 = (t4 * -1);
    t40 = (1U * t39);
    t47 = (0 + t40);
    t1 = (t2 + t47);
    t41 = *((unsigned char *)t1);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t41;
    xsi_driver_first_trans_delta(t3, 0U, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 5236);
    *((int *)t1) = 31;
    t2 = (t0 + 5240);
    *((int *)t2) = 1;
    t4 = 31;
    t7 = 1;

LAB55:    if (t4 >= t7)
        goto LAB56;

LAB58:    goto LAB2;

LAB24:;
LAB25:    xsi_size_not_matching(32U, t40, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(32U, t40, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(32U, t40, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(32U, t40, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(32U, t40, 0);
    goto LAB34;

LAB36:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 5204);
    t10 = *((int *)t3);
    t13 = (t10 + 1);
    t16 = (t13 - 31);
    t39 = (t16 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t13);
    t40 = (1U * t39);
    t47 = (0 + t40);
    t6 = (t5 + t47);
    t41 = *((unsigned char *)t6);
    t8 = (t0 + 5204);
    t19 = *((int *)t8);
    t22 = (t19 - 31);
    t48 = (t22 * -1);
    t49 = (1 * t48);
    t50 = (0U + t49);
    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t41;
    xsi_driver_first_trans_delta(t9, t50, 1, 0LL);

LAB37:    t1 = (t0 + 5204);
    t4 = *((int *)t1);
    t2 = (t0 + 5208);
    t7 = *((int *)t2);
    if (t4 == t7)
        goto LAB38;

LAB39:    t10 = (t4 + -1);
    t4 = t10;
    t3 = (t0 + 5204);
    *((int *)t3) = t4;
    goto LAB35;

LAB41:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 5212);
    t10 = *((int *)t3);
    t13 = (t10 + 1);
    t16 = (t13 - 31);
    t39 = (t16 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t13);
    t40 = (1U * t39);
    t47 = (0 + t40);
    t6 = (t5 + t47);
    t41 = *((unsigned char *)t6);
    t8 = (t0 + 5212);
    t19 = *((int *)t8);
    t22 = (t19 - 31);
    t48 = (t22 * -1);
    t49 = (1 * t48);
    t50 = (0U + t49);
    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t41;
    xsi_driver_first_trans_delta(t9, t50, 1, 0LL);

LAB42:    t1 = (t0 + 5212);
    t4 = *((int *)t1);
    t2 = (t0 + 5216);
    t7 = *((int *)t2);
    if (t4 == t7)
        goto LAB43;

LAB44:    t10 = (t4 + -1);
    t4 = t10;
    t3 = (t0 + 5212);
    *((int *)t3) = t4;
    goto LAB40;

LAB46:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 5220);
    t10 = *((int *)t3);
    t13 = (t10 - 1);
    t16 = (t13 - 31);
    t39 = (t16 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t13);
    t40 = (1U * t39);
    t47 = (0 + t40);
    t6 = (t5 + t47);
    t41 = *((unsigned char *)t6);
    t8 = (t0 + 5220);
    t19 = *((int *)t8);
    t22 = (t19 - 31);
    t48 = (t22 * -1);
    t49 = (1 * t48);
    t50 = (0U + t49);
    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t41;
    xsi_driver_first_trans_delta(t9, t50, 1, 0LL);

LAB47:    t1 = (t0 + 5220);
    t4 = *((int *)t1);
    t2 = (t0 + 5224);
    t7 = *((int *)t2);
    if (t4 == t7)
        goto LAB48;

LAB49:    t10 = (t4 + -1);
    t4 = t10;
    t3 = (t0 + 5220);
    *((int *)t3) = t4;
    goto LAB45;

LAB51:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 5228);
    t10 = *((int *)t3);
    t13 = (t10 - 31);
    t39 = (t13 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, *((int *)t3));
    t40 = (1U * t39);
    t47 = (0 + t40);
    t6 = (t5 + t47);
    t41 = *((unsigned char *)t6);
    t8 = (t0 + 5228);
    t16 = *((int *)t8);
    t19 = (t16 + 1);
    t22 = (t19 - 31);
    t48 = (t22 * -1);
    t49 = (1 * t48);
    t50 = (0U + t49);
    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t41;
    xsi_driver_first_trans_delta(t9, t50, 1, 0LL);

LAB52:    t1 = (t0 + 5228);
    t4 = *((int *)t1);
    t2 = (t0 + 5232);
    t7 = *((int *)t2);
    if (t4 == t7)
        goto LAB53;

LAB54:    t10 = (t4 + 1);
    t4 = t10;
    t3 = (t0 + 5228);
    *((int *)t3) = t4;
    goto LAB50;

LAB56:    xsi_set_current_line(70, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 5236);
    t10 = *((int *)t3);
    t13 = (t10 - 31);
    t39 = (t13 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, *((int *)t3));
    t40 = (1U * t39);
    t47 = (0 + t40);
    t6 = (t5 + t47);
    t41 = *((unsigned char *)t6);
    t8 = (t0 + 5236);
    t16 = *((int *)t8);
    t19 = (t16 - 1);
    t22 = (t19 - 31);
    t48 = (t22 * -1);
    t49 = (1 * t48);
    t50 = (0U + t49);
    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t41;
    xsi_driver_first_trans_delta(t9, t50, 1, 0LL);

LAB57:    t1 = (t0 + 5236);
    t4 = *((int *)t1);
    t2 = (t0 + 5240);
    t7 = *((int *)t2);
    if (t4 == t7)
        goto LAB58;

LAB59:    t10 = (t4 + -1);
    t4 = t10;
    t3 = (t0 + 5236);
    *((int *)t3) = t4;
    goto LAB55;

}


extern void work_a_1801676475_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1801676475_3212880686_p_0};
	xsi_register_didat("work_a_1801676475_3212880686", "isim/Test_ALU_isim_beh.exe.sim/work/a_1801676475_3212880686.didat");
	xsi_register_executes(pe);
}
