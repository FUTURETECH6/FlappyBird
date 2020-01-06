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
static const char *ng0 = "//Mac/Home/Documents/Xilinx/FlappyBird/Pipe_Generator.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {639, 0};
static int ng4[] = {24, 0};
static int ng5[] = {2, 0};
static int ng6[] = {3, 0};
static int ng7[] = {4, 0};
static int ng8[] = {5, 0};
static int ng9[] = {6, 0};
static int ng10[] = {7, 0};
static int ng11[] = {8, 0};
static int ng12[] = {9, 0};
static int ng13[] = {10, 0};
static int ng14[] = {11, 0};
static int ng15[] = {12, 0};
static int ng16[] = {13, 0};
static int ng17[] = {14, 0};
static int ng18[] = {15, 0};



static void Always_54_0(char *t0)
{
    char t11[8];
    char t12[8];
    char t37[8];
    char t39[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t38;

LAB0:    t1 = (t0 + 5728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 6048);
    *((int *)t2) = 1;
    t3 = (t0 + 5760);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(54, ng0);

LAB5:    xsi_set_current_line(55, ng0);
    t4 = (t0 + 3928U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:
LAB12:
LAB11:    xsi_set_current_line(90, ng0);

LAB84:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 10, 0LL);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4488);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 9, 0LL);

LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(56, ng0);

LAB14:    xsi_set_current_line(57, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 10, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB13;

LAB9:    xsi_set_current_line(60, ng0);

LAB15:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 4328);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t0 + 744);
    t9 = *((char **)t8);
    t8 = (t0 + 880);
    t10 = *((char **)t8);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_minus(t11, 32, t9, 32, t10, 32);
    memset(t12, 0, 8);
    t8 = (t7 + 4);
    t13 = (t11 + 4);
    t14 = *((unsigned int *)t7);
    t15 = *((unsigned int *)t11);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t8);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB19;

LAB16:    if (t23 != 0)
        goto LAB18;

LAB17:    *((unsigned int *)t12) = 1;

LAB19:    t27 = (t12 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t12);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB20;

LAB21:
LAB22:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = ((char*)((ng1)));
    memset(t11, 0, 8);
    t8 = (t4 + 4);
    t9 = (t7 + 4);
    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t7);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t8);
    t22 = *((unsigned int *)t9);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB26;

LAB23:    if (t23 != 0)
        goto LAB25;

LAB24:    *((unsigned int *)t11) = 1;

LAB26:    t13 = (t11 + 4);
    t28 = *((unsigned int *)t13);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_minus(t11, 32, t7, 10, t8, 32);
    t9 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 10, 0LL);

LAB29:    goto LAB13;

LAB18:    t26 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB19;

LAB20:    xsi_set_current_line(62, ng0);
    t33 = (t0 + 4648);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    t36 = ((char*)((ng2)));
    memset(t37, 0, 8);
    xsi_vlog_unsigned_add(t37, 32, t35, 8, t36, 32);
    t38 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 8, 0LL);
    goto LAB22;

LAB25:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(63, ng0);

LAB30:    xsi_set_current_line(64, ng0);
    t26 = ((char*)((ng3)));
    t27 = (t0 + 472);
    t33 = *((char **)t27);
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t26, 32, t33, 32);
    t27 = ((char*)((ng4)));
    memset(t37, 0, 8);
    xsi_vlog_signed_add(t37, 32, t12, 32, t27, 32);
    t34 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t34, t37, 0, 0, 10, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 4808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB31:    t7 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t7, 32);
    if (t6 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB52;

LAB53:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB54;

LAB55:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB58;

LAB59:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB60;

LAB61:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t6 == 1)
        goto LAB62;

LAB63:
LAB65:
LAB64:
LAB66:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 4808);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    memset(t37, 0, 8);
    t8 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    if (t16 != 15U)
        goto LAB68;

LAB67:    if (*((unsigned int *)t8) == 0)
        goto LAB69;

LAB70:    t9 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t9) = 1;

LAB68:    memset(t12, 0, 8);
    t10 = (t37 + 4);
    t17 = *((unsigned int *)t10);
    t18 = (~(t17));
    t19 = *((unsigned int *)t37);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB71;

LAB72:    if (*((unsigned int *)t10) != 0)
        goto LAB73;

LAB74:    t26 = (t12 + 4);
    t22 = *((unsigned int *)t12);
    t23 = *((unsigned int *)t26);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB75;

LAB76:    t25 = *((unsigned int *)t12);
    t28 = (~(t25));
    t29 = *((unsigned int *)t26);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB77;

LAB78:    if (*((unsigned int *)t26) > 0)
        goto LAB79;

LAB80:    if (*((unsigned int *)t12) > 0)
        goto LAB81;

LAB82:    memcpy(t11, t39, 8);

LAB83:    t38 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t38, t11, 0, 0, 4, 0LL);
    goto LAB29;

LAB32:    xsi_set_current_line(66, ng0);
    t8 = (t0 + 1016);
    t9 = *((char **)t8);
    t8 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t8, t9, 0, 0, 9, 0LL);
    goto LAB66;

LAB34:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1152);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB36:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 1288);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB38:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1424);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB40:    xsi_set_current_line(70, ng0);
    t3 = (t0 + 1560);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB42:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1696);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB44:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 1832);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB46:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 1968);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB48:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 2104);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB50:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 2240);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB52:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 2376);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB54:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 2512);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB56:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 2648);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB58:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 2784);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB60:    xsi_set_current_line(80, ng0);
    t3 = (t0 + 2920);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB62:    xsi_set_current_line(81, ng0);
    t3 = (t0 + 3056);
    t7 = *((char **)t3);
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 9, 0LL);
    goto LAB66;

LAB69:    *((unsigned int *)t37) = 1;
    goto LAB68;

LAB71:    *((unsigned int *)t12) = 1;
    goto LAB74;

LAB73:    t13 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB74;

LAB75:    t27 = ((char*)((ng1)));
    goto LAB76;

LAB77:    t33 = (t0 + 4808);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    t36 = ((char*)((ng2)));
    memset(t39, 0, 8);
    xsi_vlog_unsigned_add(t39, 32, t35, 4, t36, 32);
    goto LAB78;

LAB79:    xsi_vlog_unsigned_bit_combine(t11, 32, t27, 32, t39, 32);
    goto LAB83;

LAB81:    memcpy(t11, t27, 8);
    goto LAB83;

}


extern void work_m_00000000001735989793_2255930781_init()
{
	static char *pe[] = {(void *)Always_54_0};
	xsi_register_didat("work_m_00000000001735989793_2255930781", "isim/Display_isim_beh.exe.sim/work/m_00000000001735989793_2255930781.didat");
	xsi_register_executes(pe);
}
