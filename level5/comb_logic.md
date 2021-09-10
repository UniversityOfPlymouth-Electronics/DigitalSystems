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

| | |
| --- | --- |
| 4 | Select `Verilog HDL` (remember that SystemVerilog is backwards compatible with Verilog)|

<figure>
<img src="../img/quartus_choose_hdl.png" width="200px">
<figcaption>Converting a schematic to an HDL in Quartus</figcaption>
</figure>

| | |
| --- | --- |
| 5 | Open the generated file `comb_logic.v` |

The output should be similar to the listing below (I have removed some whitespace).

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

> **Challenge:** Can you identify their position in the schematic? (write it down, then hover the mouse over the `?` to check your answer)

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

> Note how there is one internal wire for each logic-gate output.

Let's look at different sections of this code in turn.

### Module Declaration
Note how the module was declared:

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


> **TASK** - watch the following video
> [ **TODO - ADD VIDEO** ]
>

Now complete the following challenge. 

> **Challenge**
> 
> Using ModelSim, see if you can repeat what you saw in the video for yourself
> * Concert the schematic to verilog
>    * Add `comb_logic.v` to your project (`Project->Add Current File To Project...`)
> * Remove the schematic from the project (`Project->Add/Remote Files from Project...`)
>    * This is to avoid the confusion of two entities with the same name
> * Make `comb_logic.v` your top level entity (instead of the schematic)
> * Build and simulate with ModelSim
>    * Use a Wave window to change the inputs and visualise the output 

<figure>
<img src="../img/circuit/xor_sop_sim.png" width="600px">
<figcaption>Check your simulation matches this</figcaption>
</figure>


> Now to check:
> * modify the `comb_logic.v` to use a more concise declaration (as above)
>    * Don't forget to recompile!
> * Build and simulate with ModelSim to check it is logically unchanged.

The simulation output should confirm this as an XOR gate (as shown below):

> **Challenge** The internal logic is defined in the lines shown below. Each assignment described a logic relationship that will ultimately be synthesised in hardware. 
>
> Change the order of the lines and show that the logic of the component is unchanged.  

```verilog
assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_0 & KEY1;
assign	SYNTHESIZED_WIRE_2 = KEY0 & SYNTHESIZED_WIRE_1;
assign	LED0 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;
assign	SYNTHESIZED_WIRE_0 =  ~KEY0;
assign	SYNTHESIZED_WIRE_1 =  ~KEY1;
```

### HDL Style
In this example, when we exported a schematic in Quartus, the tools chose to use *continuous assignment*. This would seem to make intuitive sense as the logic in the schematic was limited to simple primitive operations (AND, OR, NOT). Such gates are pre-synthesised in the macro-cells of the FPGA, so it is not difficult to envisage how this might be synthesised in practise. However, I say *envisage* for a reason.

> The exact same synthesis could be produced using *gate models*. 

Using gate models may be preferred when a design is build from more complex components, and not simply made from primitive gates (although as everything is built from primitive gates, it would be possible, albeit messy).

| Task | - |
|--- |---|
| 1 | Open the Quartus project `Task207-SchematicToHDL` and build the project|
| 2 | If not already visible, open the schematic `comb_logic` |
|  | You should see a schematic similar to the figure below |

**TODO** - finish this

<figure>
<img src="../img/circuit/mux_component.png" width="600px">
<figcaption>Circuit that embeds another (multiplexer)</figcaption>
</figure>



## References

1. Zwolonski M., Digital System Design with SystemVerilog., Prentice Hall, 2021
2. EDA Playground., https://www.edaplayground.com/, accessed 10 September 2021

 

