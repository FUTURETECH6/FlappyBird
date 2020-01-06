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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000005369514_1122431814_init();
    work_m_00000000001735989793_2255930781_init();
    xilinxcorelib_ver_m_00000000001067635404_2563653022_init();
    work_m_00000000003452451064_2500927281_init();
    xilinxcorelib_ver_m_00000000001067635404_2464297757_init();
    work_m_00000000003452451064_0728142157_init();
    xilinxcorelib_ver_m_00000000001067635404_0287919106_init();
    work_m_00000000003452451064_0662608311_init();
    xilinxcorelib_ver_m_00000000001067635404_1022880377_init();
    work_m_00000000003452451064_0145683634_init();
    xilinxcorelib_ver_m_00000000001067635404_2558164292_init();
    work_m_00000000003452451064_2609152006_init();
    xilinxcorelib_ver_m_00000000001067635404_3766817634_init();
    work_m_00000000003452451064_4273109644_init();
    xilinxcorelib_ver_m_00000000001067635404_1876769905_init();
    work_m_00000000003452451064_2310359578_init();
    xilinxcorelib_ver_m_00000000001067635404_0625232645_init();
    work_m_00000000003452451064_0280763296_init();
    xilinxcorelib_ver_m_00000000001067635404_0716955889_init();
    work_m_00000000003452451064_4285534395_init();
    xilinxcorelib_ver_m_00000000001067635404_2783170530_init();
    work_m_00000000003452451064_2289508397_init();
    xilinxcorelib_ver_m_00000000001067635404_4017797270_init();
    work_m_00000000003452451064_0293499287_init();
    xilinxcorelib_ver_m_00000000001067635404_1921104051_init();
    work_m_00000000003452451064_2469045351_init();
    xilinxcorelib_ver_m_00000000001067635404_1146952216_init();
    work_m_00000000003452451064_0632079465_init();
    xilinxcorelib_ver_m_00000000001067635404_0472376044_init();
    work_m_00000000003452451064_2285466978_init();
    work_m_00000000004208176333_0619962294_init();
    work_m_00000000000835661742_2611456719_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000835661742_2611456719");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
