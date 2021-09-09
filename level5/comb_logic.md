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
* Simulate and visualise logic designs using modelled delay parameters
* Create a simple testbench to automate the testing of a combinational logic component

## Task 206 - Converting a schematic to a Hardware Definition Language (HDL)
To re-enforce the idea of a netlist.

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

Can you identify their position in the schematic? (write it down, then hover the mouse over the `?` to check your answer)

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

Another way to write this is as follows:

```verilog
module comb_logic(input wire KEY0, input wire KEY1, output wire LED0);
```

You can write it more concisely as follows:

```verilog
module comb_logic(input wire KEY0, KEY1, output wire LED0);
```

Or even more concisely (not advised) the compiler can infer `wire`:

```verilog
module comb_logic(input KEY0, KEY1, output LED0);
```

Although all these styles are equivalent, being overly concise can become ambiguous to the reader (and thus frowned upon!).

[ *TODO - ADD VIDEO* ]


> *Challenge*
> 
> Repeat what you saw in the video for yourself
> 
> * Add `comb_logic.v` to your project (`Project->Add Current File To Project...`)
> * Remove the schematic from the project (`Project->Add/Remote Files from Project...`)
>    * This is to avoid the confusion of two entities with the same name
> * Make `comb_logic.v` your top level entity (instead of the schematic)
> * Build and simulate with ModelSim
> 
> Now to check:
> * modify the `comb_logic.v` to use a more concise declaration (as above)
> * Build and simulate with ModelSim to check it is logically the same

The simulation output should confirm this as an XOR gate (as shown below):

<figure>
<img src="../img/circuit/xor_sop_sim.png" width="600px">
<figcaption>Check your simulation matches this</figcaption>
</figure>

## References

[1] Zwolonski M., Digital System Design with SystemVerilog., Prentice Hall, 2021

 

