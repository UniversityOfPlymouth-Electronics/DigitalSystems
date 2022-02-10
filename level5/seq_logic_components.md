[Back](../README.md)

---

<figure>
<img src="../img/hdl.png" width="300px">
</figure>

# Sequential Logic

In this section, we will begin to look at sequential logic circuits.

This practical session is designed to be standalone. However, chapter 5 in [1] will compliment it as supplementary reading.

| TABLE OF CONTENTS (TO BE DONE) |
| - |
[Intended Leaning Outcomes](#Intended-Learning-Outcomes)
[Sequential Logic Components](#Sequential-Logic-Components)
[Shift Registers](#task-242-shift-registers)
[Multiple Bit Registers](#multiple-bit-registers)
[Counters](#counters)
[Memory](#memory)
[Challenges](#Challenges)
[Reflection](#reflection)
[References](#References)

## Intended Learning Outcomes

By the end of this section, you should be able to:

* Cascade Flips Flops to build shift registers
* Compare, contrast and explain the terms set-up-time and hold-time
* Demonstrate the role of propagation delay in shift registers
* Design and test a multi-bit registers to store values
* Design and test sequential counters
* Read and write to memory storage
* Employ test strategies for sequential logic

## Sequential Logic Components
This sections makes use of the components developed in the [previous section](seq_logic.md) to build further reusable sequential components. It is very important to have a good understanding of latches and flip-flops before attempting this section.

There are many sequential logic devices we could build, but we will focus on a small subset. The practise and techniques learned will hopefully put you in a good position to develop your own.

A very important aspect of this is understanding the intrinsic (and sometimes engineered) timing properties of sequential logic, in particular flip-flops. We will therefore discuss propagation delay, setup-time and hold-time.

In future section, you will find that the components discussed in this section and the previous will be reused multiple times.

## Task-242 Shift Registers
It is recommended you read the accompanying text for this section: Section 5.4.2 in [1].

For this task, we will first look as a simple shift register using Quartus. The clock signal has been significantly slowed down (0.5Hz) so that you can interface meaningfully.

| Task-242 | Shift Registers |
| - | - |
| 1 | Open and build the Quartus project in Task242 | 
| 2 | Study the top level schematic. Double click the `cascaded_dff` component to see the internals (another schematic). Double click one of the `d_ff` components to see the HDL. |
| 3 | Now program your FPGA |
| 4 | Press and release KEY0 to reset the circuit |
| 5 | Press and hold KEY1 until the first and second LEDs light |
| 6 | Release KEY1 and observe |
| - | Experiment trying to create different LED patterns |
| 7 | Try to press and release KEY1 *between* clock edges - you should see it KEY1 is ignored |

Note how a symbol was created from another schematic? The shift register is shown below:

<figure>
<img src="../img/circuit/cascaded_dff.png" width="600px">
<figcaption>Building a shift-register with cascaded D-Flip Flops</figcaption>
</figure>

Key points:

* The output of each D-Type Flip Flop (DFF) is connected to the input of the next
* All flip-flops share the same clock, so all outputs change simultaneously
   * We say there is no skew
* With each clock edge, the output of a DFF is shifted to the next

> **Question: ** Starting from reset, if you set `D` to 1 (hold down KEY1 for one clock cycle), why is it that only the first DFF has a 1 in the output? As all DFFs share the same clock, why does the signal not propagate throughout all DFF devices in one go? 

They key to this is propagation delay, set-up time and hold-time. This is best observed using simulation.

### Set-up and hold time
Below is the SystemVerilog for a DFF. This version is modelled with a fixed output delay of 10ps. This is the delay between the clock rising and the output changing.

From a simulation perspective:

* When the clock rises, the `always_ff` loop unblocks
* `q_int` is updated immediately (with zero delay)
* T<sub>d</sub>=`10ps` later, `Q` is updated

```verilog
module d_ff (output logic Q, input logic D, CLK, n_Reset);

logic q_int;
assign #(10ps) Q = q_int;

always_ff @(posedge CLK, negedge n_Reset) begin
	//Reset takes precedence
	if (n_Reset == 1'b0) begin
		q_int <= 0;
	end
	else begin
		//Otherwise Q = D (and latches)
		q_int <= D;
	end
end
endmodule
```

Now let us look at that happens when these devices are cascaded as we saw in Quartus

| Task-242 | Continued |
| - | - |
| 7 | Open the schematic `cascaded_dff` and convert to HDL  | 
| - | File -> Create/Update -> Create HDL Design File from Current File |
| - | Choose Verilog HDL. This will create a file `cascaded_dff.v` |
| - | Close Quartus, and move the created file `cascaded_dff.v` from the Quartus folder up to the parent task folder (up one folder) | 
| 8 | Start ModelSim, and compile all HDL files in the Task242 folder |
| 9 | Edit `cascaded_dff.v` and examine the HDL. See if you can understand how it works |
| 10 | Simulate `cascaded_dff_tb.sv` and show the output in a wave window |

If we take a close look at the output, you can see some important details:

<figure>
<img src="../img/circuit/cascaded_dff_timing.png" width="600px">
<figcaption>Shift-register output: showing the delay between the clock edge and the output </figcaption>
</figure>

Remember that for a flip-flop, inputs are only read on the clock edge (a **very** narrow time window!).

The numbers on the figure relate to the following points:

1. All DFF outputs are 0. The input D is a stable 1. Then the clock rises. *There is no immediate change in any of the DFF outputs due to intrinsic delays*. The delay for each output is T<sub>d</sub>.
2. After a delay of T<sub>d</sub>=`10ps`, `LED[7]` has now risen to a `1`. *At this point, no DFF devices are monitoring their inputs*, so this is currently ignored by the other DFF devices.
3. The input `D` is now a stable 0 and `LED[7]` is a stable `1`. `D` is connected to the input of the first DFF. `LED[7]` is connected to the input of the second DFF. The clock rises. Again, inputs are sampled there is no immediate change in any DFF output due to intrinsic delay.
4. After a delay of T<sub>d</sub>, `LED[7]` changes to `0` and `LED[6]`  changes to a `1`.

What I hope is becoming clear is that this circuit *only works because of the intrinsic delay in the flip-flops T<sub>d</sub>*. There are a couple more important parameters to be aware of:

**If you want to guarantee that the output of flip-flop will settle on the correct value, the input MUST be stable for a time T<sub>setup</sub> before the clocked edge and T<sub>hold</sub> after the clock edge**

* T<sub>setup</sub> is known as the set-up time
* T<sub>hold</sub> is known as the hold time

Usually, for a DFF, T<sub>hold</sub>=0. In words, once the clock has risen, any changes in the input `D` will be both ignored and tolerated.

A zero hold time is traded for a large setup time. T<sub>setup</sub> > 0. In words, the input `D` **must** be set and stable T<sub>setup</sub> in advance of the clock edge. *Failure to observe this can result in unpredictable outputs*.

In this circuit, the outputs of each DFF is an input to another. If T<sub>clk</sub> is the time between clock edges, then the inputs are stable (T<sub>clk</sub>-T<sub>d</sub>) in advance of the next clock edge. But we also have to allow for set-up time, so for this to work, the following much be observed:

T<sub>clk</sub> > T<sub>d</sub> + T<sub>setup</sub>

This limits how fast we can drive the clock before set-up violation occurs (so overclockers, beware!). We will revisit this topic later in the course. However, you can read more in section 13.5 in [1].

## Multiple Bit Registers
It is recommended you read the accompanying text for this section: Section 5.4.1 in [1].




## Counters

## Memory

## Challenges

1. In Task-242, a file `cascaded_dff` was created by Quartus. Can you shorten this file by using the `generate` statement?



## Reflection

## References

See [References](references.md) for a list of numbered references in this course.

---

[Next - Sequential Logic Components](seq_logic_components.md)