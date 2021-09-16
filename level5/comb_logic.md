[Back](../README.md)

---

# Combination Logic

In this section, we will begin our exploration of the SystemVerilog language by starting with simpler combinational logic circuits.

This practical session is designed to be standalone. However, chapter 3 in [1] will compliment it as supplementary reading.

## Intended Learning Outcomes

By the end of this section, you should be able to:

* Create simple combinational logic components with SystemVerilog modules
* Use _continuous assignment_ to establish logical relationships between points in a circuit
* Build a circuit 'Netlist' from basic gates (convert schematics to text)
* Contrast and apply bit-wise logical operators for building logic functions
* Contrast and use the different supported signal states `1`, `0`, `X`, `?`, `Z`  
* Write components with appropriate commenting and structure
* Use ModelSim to interactively debug a component using modelled delay parameters
* Create a simple testbench to automate the testing of a combinational logic component

## Task 206 - Converting a schematic to a Hardware Definition Language (HDL)
It is interesting to see how Quartus schematics are converted to an HDL. Not only is it useful when performing simulations, but it also provides some insight.

> First, [watch this video](https://plymouth.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=7b6372d5-a7c2-418d-b3d7-ad9f00e714c4).
> 
> We will now work through each step and repeat what was shown in the video.

| Task | - |
|--- |---|
| 1 | Open the Quartus project `Task206-SchematicToHDL` and build the project|
| 2 | If not already visible, open the schematic `comb_logic` |
|  | You should see a schematic similar to the figure below |

<figure>
<img src="../img/circuit/xor_sop.png" width="600px">
<figcaption>XOR circuit built from Sum Of Projects (SOP)</figcaption>
</figure>

|  | |
| --- | --- |
| 3 | To convert the schematic to a hardware design language in Quartus, click `File->Create/Update->Create HDL Design File from Current File...` |
| | (See figure below) |

<figure>
<img src="../img/quartus_create_hdl.png" width="350px">
<figcaption>Converting a schematic to an HDL in Quartus</figcaption>
</figure>

| 4 | Select `Verilog HDL` (remember that SystemVerilog is backwards compatible with Verilog)|
| --- | --- |

<figure>
<img src="../img/quartus_choose_hdl.png" width="200px">
<figcaption>Converting a schematic to an HDL in Quartus</figcaption>
</figure>

| 5 | Identify the internal wires on the schematic |
| --- | --- |
| - | Open the generated file `comb_logic.v` |
| - | The output should be similar to the listing below (I have removed some whitespace) |

```verilog
// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Thu Sep 09 15:05:58 2021"

module comb_logic(
	KEY0,
	KEY1,
	LED0
);

input wire	KEY0;
input wire	KEY1;
output wire	LED0;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_0 & KEY1;
assign	SYNTHESIZED_WIRE_2 = KEY0 & SYNTHESIZED_WIRE_1;
assign	LED0 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;
assign	SYNTHESIZED_WIRE_0 =  ~KEY0;
assign	SYNTHESIZED_WIRE_1 =  ~KEY1;
endmodule
```

There are a number of internal wires declared in this code:

```verilog
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
```

| - | Can you identify the position of these wires in the schematic? |
| - | - |
| - | Note how there is one internal wire for each logic-gate output. |
| - | (write it down, then hover the mouse over the `?` to check your answer) |

| Node | Wire |
| - | - |
| A | <p title="SYNTHESIZED_WIRE_0">?</p> |
| B | <p title="SYNTHESIZED_WIRE_1">?</p> |
| C | <p title="SYNTHESIZED_WIRE_3">?</p> |
| D | <p title="SYNTHESIZED_WIRE_2">?</p> |

<figure>
<img src="../img/circuit/xor_sop_annotated.png" width="600px">
<figcaption>Internal wires labelled as A,B,C and D.</figcaption>
</figure>

Let's now look at how the module was declared:

```verilog
module comb_logic(
	KEY0,
	KEY1,
	LED0
);

input wire	KEY0;
input wire	KEY1;
output wire	LED0;
```

The wires `KEY0, KEY1` and `LED0` are the input and output signals to the `comb_logic` component, as presented to the outside world. The "type" is `wire` (other types exist in SystemVerilog as we will discover). Another way to write this is as follows:

```verilog
module comb_logic(input wire KEY0, input wire KEY1, output wire LED0);
```

As the first two are both inputs and type `wire`, you can write it more concisely as follows:

```verilog
module comb_logic(input wire KEY0, KEY1, output wire LED0);
```

Or even more concisely (not advised) the compiler can infer `wire`:

```verilog
module comb_logic(input KEY0, KEY1, output LED0);
```

Although all these styles are equivalent, being overly concise can become ambiguous to the reader (and thus can be frowned upon!). For this course, we will try and use the following **convention**:

```verilog
module comb_logic(output wire LED0, input wire KEY0, input wire KEY1);
```

In this convention, the outputs are listed first, and every input / output has a type. It is still more concise than the example above.

> **Note the following:**
>
> It is very helpful is HDL is written in a style that is unambiguous, but without being too verbose. Not only is it easier to understand, it is also easier to spot errors (bugs). As we will discover, SystemVerilog contains language constructs that help some of the common issues found in it's predecessor, Verilog.

The convention used in this course is as follows:

* The outputs are listed first
* All inputs and outputs are explicitly declared as an `input` or `output`
* All input and output **types** are explicitly declared (type `wire` in this case)
* For assessment purposes, you may be asked to confirm to this convention
* Third party components may deviate from this

| 6 | Add the verilog file to your project |
| - | - |
| - | Add `comb_logic.v` to your project (`Project->Add Current File To Project...`) |
| - | Remove the schematic from the project (`Project->Add/Remote Files from Project...`). This is to avoid the confusion of two entities with the same name |

| 7 | Experiment - Test it is logically identical |
| - | - |
| - | Make `comb_logic.v` your top level entity (instead of the schematic) |
| - | Build and simulate with ModelSim. Use a Wave window to change the inputs and visualise the output |

<figure>
<img src="../img/circuit/xor_sop_sim.png" width="600px">
<figcaption>Check your simulation matches this</figcaption>
</figure>

| 8 | Experiment - Use a more concise module declaration |
| - | - |
| - |  modify the `comb_logic.v` to use a more concise declaration (as above) |
| - |  Don't forget to recompile! |
| - | Build and simulate with ModelSim to check it is logically unchanged. |

The simulation output should confirm this as an XOR gate (as shown above and in the video).

The internal logic is defined in the lines shown below. Each assignment described a logic relationship that will ultimately be synthesised in hardware.

```verilog
assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_0 & KEY1;
assign	SYNTHESIZED_WIRE_2 = KEY0 & SYNTHESIZED_WIRE_1;
assign	LED0 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;
assign	SYNTHESIZED_WIRE_0 =  ~KEY0;
assign	SYNTHESIZED_WIRE_1 =  ~KEY1;
```

| 9 | Experiment - Reorder assignments in the HDL |
| - | - |
| - | Change the order of the lines and show that the logic of the component is unchanged. |
| - | Use ModelSim to confirm your result |  

## Task 207 - Schematics and gate-models

In the previous task, when we exported a schematic in Quartus, the tools chose to exclusively use *continuous assignment* (`assign`).  This would seem to make intuitive sense as all the logic in the schematic was limited to simple primitive operations (AND, OR, NOT). 

Such gates are pre-synthesised in the macro-cells of the FPGA, so it is not difficult to envisage how this might be synthesised in practise. However, I say *envisage* because we did not specify this - the decision was made by the development tools. The tools could equally implement the exact same logic using *gate models*.

> * *continuous assignment* is somewhat *abstracted* from the physical hardware. It describes logical relationships, but not the gates as such (although the relationship may be apparent). 
>
> * *gate models* are a literal description of which hardware to use and how it should be connected. It can be considered a one-to-one mapping of HDL onto hardware.

> All circuits could ultimately be built with either style, or a combination of the two. As we will see later however, there are other ways to specify behaviour of logic systems that are even more abstracted (and convenient!)

*Gate models* are important as they allow us to "place and connect" other components to wires in our design. This is illustrated in the next task.

| Task | - |
|--- |---|
| 1 | Open the Quartus project `Task207-SchematicToHDL` and build the project|
| 2 | If not already visible, open the schematic `comb_logic` |
|  | You should see a schematic similar to the figure below |


<figure>
<img src="../img/circuit/mux_component.png" width="600px">
<figcaption>Circuit that embeds another (multiplexer)</figcaption>
</figure>

| 3 | Right-click the mux21 component and choose "Open Design File" |
| - | - |
| - | You should observe the following Verilog file opens |

```verilog

module mux21( output wire Y, input wire [1:0] D, input wire sel);

	assign Y = D[sel];
	
endmodule
```

Make a note of the names of the inputs and outputs (you can also see them on the schematic). The top level schematic contains a single *instance* of the `mux21` component. The definition for this component is in `mux21.sv`.

> In the physical world, if we were to solder a component to a Printed Circuit Board, then it would an instance of that chip type.

| 4 | Export the top level schematic as a verilog file. |
| --- | --- |
| - | Look closely at the output. You should see something similar to the code below |

```verilog
module comb_logic(
	KEY0,
	KEY1,
	MODE,
	LED0
);

input wire	KEY0;
input wire	KEY1;
input wire	MODE;
output wire	LED0;

wire	[1:0] data;

mux21	b2v_inst(
	.sel(MODE),
	.D(data),
	.Y(LED0));

assign	data[1] = KEY1;
assign	data[0] = KEY0;

endmodule
```

We can see the verilog equivalent of component placement in this HDL script:

```verilog
mux21	b2v_inst(
	.sel(MODE),
	.D(data),
	.Y(LED0));
```

Note the following:

* The type of component is `mux21`, which is a 2-1 multiplexer
* The instance name is `b2v_inst`. 
* The labels `sel`, `D` and `Y` are the names of the multiplexer's input and output ports.
* The input and output ports are connected to the signals `MODE`, `D` and `LED0` (external to the multiplexer component).

You can have multiple instances of a component, but each must have a unique instance name.

## Reflection
From the exercises in the previous two tasks, there are some key points:

* A schematic can easily be converted to HDL. 
* This is typically continuous assignment or a netlist of gate models. 
* Components (usually written with a HDL ) can be instantiated and connected.

## References

1. Zwolonski M., Digital System Design with SystemVerilog., Prentice Hall, 2021
2. EDA Playground., https://www.edaplayground.com/, accessed 10 September 2021

 

