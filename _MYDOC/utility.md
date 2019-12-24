## LOG

加一个switch调节背景 鸟颜色的功能

## 自己的说明

管的XY是缝的**右上角**

鸟的XY是鸟的**右下角**

## 各模块功能说明

### Keypad

P: `module Keypad( input clk, inout [3:0] keyX, inout [4:0] keyY, output reg [4:0] keyCode, output ready, output [8:0] dbg_keyLine );`

* Keycode [4:2]存列，[1:0]存行
* ready是表明已经去抖动？
* KeyLineX/Y就是keyX/Y，所以有什么用？
* dbg_keyLine = ~{keyLineY, keyLineX}


`Keypad k0 (.clk(clkdiv[15]), .keyX(BTN_Y), .keyY(BTN_X), .keyCode(keyCode), .ready(keyReady));`顶层模块这个XY反接是什么操作？

### AntiJitter

除了Keypad要用，顶层的SW的获取也需要

### Seg7Device

P: `module Seg7Device(input clkIO, input [1:0] clkScan, input clkBlink, input [31:0] data, input [7:0] point, input [7:0] LES, output [3:0] sout, output reg [7:0] segment, output reg [3:0] anode);`

\* Seg7Decode、Seg7Remap与SegmentDecoder均为子模块

* .clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]
* data就是待显示数据
* .point(8'h0), .LES(8'h0)
* sout
  ```verilog
  assign SEGLED_CLK = sout[3];
  assign SEGLED_DO  = sout[2];
  assign SEGLED_PEN = sout[1];
  assign SEGLED_CLR = sout[0];
  ```

### ShiftReg

给LED用的

调用：`ShiftReg #(.WIDTH(16)) ledDevice (.clk(clkdiv[3]), .pdata(~ledData), .sout({LED_CLK,LED_DO,LED_PEN,LED_CLR}));`

### vgac

调用：`vgac v0 (.vga_clk(clkdiv[1]), .clrn(SW_OK[0]), .d_in(vga_data), /*前面input，后面output*/ .row_addr(row_addr), .col_addr(col_addr), .r(r), .g(g), .b(b), .hs(hs), .vs(vs));`

## 重要的变量

### vga_data

类型：reg [11:0]

用于存储当pixel的12位色信息，在VGADEMO根据距离决定赋值

```verilog
always@(*) begin
    if ((x_sqr + y_sqr < r_sqr))
        vga_data <= SW[12:1];
    else vga_data <= 12'hfff;
end
```

在PecMan中拆分成`reg[3:0] r,g,b;`，然后接到`pac_print m1`模块进行处理

在FlappyBird中需由

---

# 实现

state为0或1是否共用一个模块？

否，因为传参时作为总线可以避免命名冲突