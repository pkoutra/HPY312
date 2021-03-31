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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *STD_STANDARD;
char *STD_TEXTIO;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_a_0109786735_3212880686_init();
    work_a_1507033918_3212880686_init();
    work_a_1680816323_3212880686_init();
    work_a_2540214590_3212880686_init();
    work_a_1913148318_3212880686_init();
    work_a_3830602496_0000452272_init();
    work_a_3493533027_3212880686_init();
    work_a_2517482608_3212880686_init();
    work_a_0250526316_3212880686_init();
    work_a_1910966900_3212880686_init();
    work_a_2905351972_3212880686_init();
    work_a_3599674430_3212880686_init();
    work_a_3685690019_3212880686_init();
    work_a_3660223633_3212880686_init();
    work_a_0397542920_3212880686_init();
    work_a_3967920148_3212880686_init();
    work_a_1205434527_3212880686_init();
    work_a_1801676475_3212880686_init();
    work_a_1280396548_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_2128221623_3212880686_init();
    work_a_4200723274_3212880686_init();
    work_a_3127106614_3212880686_init();
    work_a_3906868777_3212880686_init();
    work_a_3222946569_3212880686_init();
    work_a_1640669797_3212880686_init();
    work_a_2894000879_2372691052_init();


    xsi_register_tops("work_a_2894000879_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
