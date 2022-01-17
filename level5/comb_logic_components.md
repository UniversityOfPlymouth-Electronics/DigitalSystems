[Back](../README.md)

---

# Combinational Logic Components

In this section, we will further our exploration of the SystemVerilog language by building some common combinational logic circuits.

This practical session is designed to be standalone. However, chapter 4 in [1] will compliment it as supplementary reading.

| TABLE OF CONTENTS |
| - |
[Intended Leaning Outcomes](#Intended-Learning-Outcomes)
[Combinational Logic](#)
[Task 215: 2-1 Multiplexer](#Task-215:-Multiplexer)
[Challenges](#Challenges)
[Reflection](#Reflection)
[References](#References)

## Intended Learning Outcomes

By the end of this section, you should be able to:

* Create and test a generic N-to-1 multiplex using different styles of SystemVerilog
* Create and test components with tri-state outputs
* Use don't care inputs to simplify a HDL design
* Perform arithmetic operations in SystemVerilog
* Create and test generic encoders and decoder objects in SystemVerilog
* Evaluate the gate cost of synthesising combinational logic devices for an FPGA
* Write and test SystemVerilog tasks and functions to reduce repetition in HDL

## Combinational Logic
In the previous section, we looked at creating components in SystemVerilog. We specifically focused on combinational logic. All digital systems contain combinational logic.

The basic building blocks of digital electronics are fundamental gates, including AND, OR, NOT, XOR etc. However, as our designs scale up in complexity, it is usually to use other building blocks, including encoders, decoders, multiplexers, demultiplexers and arithmetic functions.

To build on and reinforce what we learned in the previous section, we will now look at examples of combinational building blocks. Some new concepts and techniques are also introduced, including the use of don't care inputs and high-impedance outputs.

## Task-215: Multiplexer

The figure below shows a simple 2-to-1 multiplexer:

<figure>
<center>
<img src="../img/mux_2_1.jpg">
<figcaption>2-to-1 multiplexer, with input signals A and B, select signal S and output OUT</figcaption>
</center>
</figure>

The output of the device is equal to the selected input. Only one input can be selected, and is selected with the select line `S`.

* When `S == 0`, then `OUT = A`
* When `S == 1`, then `OUT = B`

It is a fundamental yet simple device, which is easily created in SystemVerilog in a number of ways:

Using behavioural HDL, we might create a 2-to-1 multiplexer as follows:

```verilog
module mux2_behavioural_v1 (output logic out, input logic a, b, s);

always_comb
	if (s == 0)
	   out = a;	//Single line does not need begin
	else
	   out = b;

endmodule
```

Note there is no reference to `AND`, `OR` or `NOT` gates. There is no Boolean logic either. We use behavioural constructs to *describe* the behaviour.

As a reminder, you may with to first watch this video:

[VIDEO - Compiling and testing the mux in ModelSim](https://plymouth.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=2ebf2fe1-3f58-4ed1-bdd7-ae2000f11e08)

Now replicate by following the steps below:

| Task 215 | 2-to-1 Multiplexer |
| - | - |
| 1 | Run ModelSim, and change directory to `Task215-2-to-1-multiplexer` |
| 2 | Compile `mux2_behavioural_v1.sv` |
| 3 | Compile and simulate the testbench `mux2_behavioural_v1_tb.sv` |

Read through both files and check you can follow what is being performed. You may want to check back to the [previous lab](comb_logic.md) if you need to review.

Now to see this working in real hardware, watch the following video:

[VIDEO - Testing the mux with Quartus and an FPGA](https://plymouth.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=7b658b84-708e-44a1-a6e1-ae2000e32a60)

Now replicate by following the steps below:

| Task 215 | Continued |
| - | - |
| 4 | Open the Quartus Project in Task-215 |
| 5 | Add `mux2_behavioural_v1.sv`  to the project |
| 6 | Create a symbol file for this component |
| 7 | Add the component to the top-level schematic |
| 8 | Use `Key0` to route either `CK1` or `CK2` to `LED[0]` |
| - |

Check that you get the same result as in the video.

We can use other styles of SystemVerilog to achieve the same result. Some examples are given below:

### Variation 2
The same type, but using `begin` and `end` in our if-statement so that addition lines could be added.

```verilog
module mux2_behavioural_v2 (output logic y, input logic a, b, s);
always_comb
	if (s) begin
	   y = b;	//Single line does not need begin
	end
	else begin
	   y = a;
    end
endmodule
```

### Variation 3 - `switch-case`

The variation below uses a `switch-case` to choose the output.

```verilog
module mux2_behavioural_v3 (output logic y, input logic a, b, s);
always_comb
	case (s)
		0 : begin
		   y = a;
		end
	
		1 : begin
		   y = b;
		end
	
		default : begin
		   y = 1'b?;
		end
	endcase
endmodule
```

### Variation 4 - continuous assignment

Another option is to use the dataflow style and continuous assignment:

```verilog
module mux2_dataflow (output logic y, input logic a, b, s);

assign y = (s == 0) ? a : b;

endmodule
```

### Variation 5 - Gate Level

We can easily design and build a multiplexer from gates. The truth0table for a 2-1 mux is as follows (assuming A is the upper input):

| S | A | B | Y |
| - | - | - | - |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 1 |
| - | 

| Task 215 | Continued |
| - | - |
| 9 | Write the Boolean equation for `Y` in terms of `A`, `B` and `S` |
| 10 | Simplify where possible |
| 11 | Sketch the schematic |
| 12 | Edit the (incomplete) component `mux2_structural.sv` in ModelSim |
| 13 | Starting with the HDL provided (and shown below), complete the component using the **structural** style |
| - | A solution `mux2_structural-solution.sv` is provided in case you get stuck |


```verilog
module mux2_structural (output logic y, input logic a, b, s);

// Write HDL here

endmodule
```

You now have 5 variations of the 2-to-1 multiplexer. A testbench has been created to compare them all

| Task 215 | Continued |
| - | - |
| 14 | Read, compile and run the testbench `mux2_tb.sv` to check your gate level component works |
| - | If you get an error, it is likely you made an error in (13) |
| - | If you cannot get it working, take a look in `mux2_structural-solution.sv` |

We have spent some considerable time looking at different ways to implement a simple 2-to-1 multiplexer. The style you choose may depend on what you feel most confident with. A general principle is to write in the clearest form first (typically behavioural). Once tested, you might consider re-writing in a less abstracted form which can be optimised<sup>**</sup> in some sense (maybe for speed, or space). You can then compare the outputs as we did in (14).

<sup>**</sup>It is unlikely that something as simple as a 2-to-1 multiplexer can be further optimised.

## Task 216 - 4-to-1 Multiplexer

Let's now scale up our multiplexer design to have 4 inputs. To select which of the 4 inputs to route to the output, we need `log`<sub>2</sub>(4)=2 select lines.

> Another way to view this is that if we have 2 select lines, we can choose 2<sup>2</sup>=4 inputs.


## Task 217 - N-to-1 Multiplexer
So far we have considered a simple fixed sizes multiplexers. In general we would consider a N-to-1 multiplexer, where N &geq; 2.



## Challenges

## Reflection

## References

See [References](references.md) for a list of numbered references in this course.
