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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//Mac/Home/Documents/Xilinx/FlappyBird/bg_day_160_120_test.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Initial_39_0(char *t0)
{
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t12;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);

LAB4:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(41, ng0);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB5:    t2 = ((char*)((ng2)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t7 != 0);
    if (t8 > 0)
        goto LAB6;

LAB7:
LAB1:    return;
LAB6:    xsi_set_current_line(41, ng0);

LAB8:    xsi_set_current_line(42, ng0);
    t9 = (t0 + 2336);
    xsi_process_wait(t9, 1000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1448);
    t3 = (t2 + 56U);
    t9 = *((char **)t3);
    t10 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t9, 15, t10, 32);
    t12 = (t0 + 1448);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 15);
    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t9 = *((char **)t3);
    t10 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_signed_add(t11, 32, t9, 32, t10, 32);
    t12 = (t0 + 1608);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    goto LAB5;

}


extern void work_m_00000000002838061187_3807917016_init()
{
	static char *pe[] = {(void *)Initial_39_0};
	xsi_register_didat("work_m_00000000002838061187_3807917016", "isim/bg_day_160_120_test_isim_beh.exe.sim/work/m_00000000002838061187_3807917016.didat");
	xsi_register_executes(pe);
}
