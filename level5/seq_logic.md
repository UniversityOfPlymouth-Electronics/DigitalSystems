[Back](../README.md)

---

<figure>
<img src="../img/hdl.png" width="300px">
</figure>

# Sequential Logic

In this section, we will begin to look at sequential logic circuits.

This practical session is designed to be standalone. However, chapter 5 in [1] will compliment it as supplementary reading.

| TABLE OF CONTENTS |
| - |
[Intended Leaning Outcomes](#Intended-Learning-Outcomes)
[Sequential Logic](#)
[Task 230: Implicit Latches](#Task-230-Implicit Latches)

[Challenges](#Challenges)
[Reflection](#Reflection)
[References](#References)

## Intended Learning Outcomes

By the end of this section, you should be able to:

* Create a component with latched outputs
* Contrast and correctly apply non-blocking and blocking assignments
* Contrast and correctly apply `always`, `always_comb`, `always_latch` and `always_ff` in a behavioural model
* Use an `excitation list` as part of a behavioural model
* Create a component that qualifies as a flip flop
* Simulate a clock signal for the purpose of testing
* Create common sequential building blocks, including a D-Latch, SR-Latch, D-FlipFlop and JK-FlipFlop 
* Use asynchronous inputs to define the startup state of a component
* Explain the role of propagation delay when cascading flip-flop devices

## Sequential Logic
In the previous section, we looked at creating combinational logic component in SystemVerilog. All digital systems contain combinational logic. 

You may recall that when the inputs of combinational logic change, the outputs need time to settle to a steady state. During this short period, outputs can be spurious and in some cases, even dangerous. 

Furthermore, combinational logic has no memory of the past. The output is simply a function of it's current inputs. The internal logic and outputs retain no means to remember previous values.

Sequential logic is so named because it is the sequence of events that are taken into account. Sequential logic outputs are function of the current and past inputs. To achieve this, some form of memory is needed, which is synthesised by way of logic circuits with feedback. This is described in section 5.1 of [1].

## Task-230 Latching Outputs
In this task, we will look closely at a device known as an S-R Latch. 

| Task-230 | Latching Outputs |
| - | - |
| 1 | [watch this video](https://plymouth.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=3e2b3c6e-1a58-45d0-b735-ae2f00c85511) and replicate |
| 2 | Write a testbench `srgate_tb.sv` to automate the tests used in this video |
| - | A solution `srgate_tb-solution.sv` is provided | 

Some key points:

* When first used, the output was undefined `x`
* The output `Q` was set HIGH when input `S` was HIGH
* The output `Q` was set LOW when input `S` was LOW
* When `S` and `R` are both LOW, the output **latches** (holds it's value)
* When `S` and `R` are both HIGH, this is considered an illegal condition
* There is more than one type of `always` block. This has an impact on behaviour.

Let's now review the code below:

```verilog
module srgate (output logic Q, Qbar, input logic S, R);
always @(S,R) 
begin
	if ( (S==1) && (R==0) )
		{Q, Qbar} <= 2'b10;
	else if ( (S == 0) && (R == 1) )
		{Q, Qbar} <= 2'b01;
	else if ( (S == 1) && (R == 1) )
		{Q, Qbar} <= 2'bzz;
    // No coverage of the input combination 0,0!!!
end
endmodule
```

A critical point to observe is that the input combination `{S,R} = {0,0}` is not covered by the if-statement. By default, this creates an **implicit latch**. This behaviour was overridden when we changed `always` to `always_comb`, and forced the compiler to only use combinational logic (which cannot latch outputs).

Some other points to note:

* This component used something referred to as a **non-blocking assignment operator** `<=`
* The `always` statement is followed by `@(S,R)`. This is known as an *event list* (also known as an excitation list)

S-R Latches are just one type of latch.

### Excitation Lists
The excitation list (or event list) is a very important concept in both Verilog and SystemVerilog.

| Task-230 | continued |
| - | - |
| 3 | Compile and edit the solution `srgate_tb-solution.sv` | 
| 4 | Run the simulation. Note the output |
| 5 | Now watch [the following video](https://plymouth.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=61f7d931-6535-4ec9-a155-ae2f0120e8c9) |
| 6 | Replicate what you saw in the video. Use the debugger in ModelSim to step through to better understand the behaviour being modelled |

An extract from the testbench is shown below. For this block, we can see the excitation list contains both `S` and `R`, so if either changes, so the block is updated and the values of `S` and `R` are written to the console. 

```verilog
//This block only runs when S or R **change**
always @(S,R)
begin
	$display("{S,R}={%b,%b}", S, R);
end
```

If `Q` changes as a result of `S` and `R` changing, then the following block detects this and displays the value of `Q`.

```verilog
//This block only runs when Q changes
always @(Q)
begin
	$display("Q => %b", Q);
end
```

Now we see how the excitation list is used to detect change events, let's return to the S-R Latch and look again at the excitation list:

```verilog
module srgate (output logic Q, Qbar, input logic S, R);
always @(S,R) 
begin
	if ( (S==1) && (R==0) )
		{Q, Qbar} <= 2'b10;
	else if ( (S == 0) && (R == 1) )
		{Q, Qbar} <= 2'b01;
	else if ( (S == 1) && (R == 1) )
		{Q, Qbar} <= 2'bzz;
    // No coverage of the input combination 0,0!!!
end
endmodule
```

The `always` block asserts `Q` and `Bbar`, but only update if `S` or `R` change. Updates to `Q` and `Bbar` are therefore synchronised with changes in either `S` or `R`. It should be stressed that unlike the testbench, this component can be synthesised.

| Task-230 | continued |
| - | - |
| 7 | What happens if you remove `R` from the excitation list? | 
| - | Also look at the wave output. Double click and error message to jump to the position in the wave |
| 8 | Now remove the excitation list entirely. Recompile and start the simulation. Do NOT click the Run -All button. This time step line by line through the simulation. |

Now how `always` without a excitation list performs an infinite loop?

| Task-230 | continued |
| - | - |
| 9 | Change `always` to `always_latch` |
| - | Note this is only supported in SystemVerilog. Excitation lists are not permitted |
| 10 | Simulate - does the component behave correctly and pass all tests? | 

`always_latch` is usually preferred to `always` as it is safer. It will infer the correct excitation list (so you don't forget - an easy mistake to make!). Another way to do this is to use `always @*` (supported in Verilog) although they are not entirely equivalent.

Note that Simulation tools may behave differently.

### Variation
The example so far has used the familiar `if else`. You can also use a `case` statement.

```verilog
module srgate (output logic Q, Qbar, input logic S, R);
always_latch
begin
	case ({S,R})
		2'b10 : {Q, Qbar} <= 2'b10;
		2'b01 : {Q, Qbar} <= 2'b01;
		2'b11 : {Q, Qbar} <= 2'bzz;		
	endcase
	// Again, no coverage of the input combination 0 0
end
endmodule
```

| Task-230 | continued |
| - | - |
| 11 | Change `always` to `always_comb` and re-simulate |
| -  | Does the latching behaviour remain? |
| 12 | Open the Quartus project. Try and build. What happens? |

It is interesting that ModelSim did not issue a warning or error, and the latching behaviour was still modelled. Quartus however considered this an error.

### Assignment Operators
You may have noticed that the so-called *non-blocking* assignment operator `<=` was used instead of the *blocking* operator `=`. More will be said about this later (it needs careful explanation!). For now, note the following guideline: for combinational logic, use `=`. For sequential logic, use `<=`.

### `@always` blocks
In verilog, the `@always` block is used for behavioural HDL. The stimulus list and the code within needs to be written carefully to avoid *unintended* (e.g. unintended latching). The compiler does not necessarily warn you either.

To help you be more prescriptive, SystemVerilog introduces three more:

* `always_comb` for combinational logic
* `always_latch` for latching behaviour
* `always_ff` for flip-flop behaviour (see below)

## Task-232 Asynchronous Inputs
In simulation, it is possible to initialise signals at the start of simulation. When you synthesise however, this will have no effect. The initial state of logic gates will be dependant on the hardware, and not on your HDL. Therefore, it is considered good practise to always initialise hardware to a known state when power is first applied. This is typically with a reset signal. 

| Task-232 | Asynchronous Inputs |
| - | - |
| 1 | In the folder Task-232, open the Quartus Project. Build and program. |
| 2 | Press key0 to SET, then press key1 to RESET |
| 3 | Can you explain why no LEDs are on when you first program the FPGA? |

This component now has an **asynchronous reset** added.

```verilog
module srgate (output logic Q, Qbar, input logic S, R, n_reset);

always @(S,R,n_reset)
begin
	if (n_reset == 0) begin
		Q    <= 0;
		Qbar <= 0;
	end
	else if ( (S==1) && (R==0) )
		{Q, Qbar} <= 2'b10;
	else if ( (S == 0) && (R == 1) )
		{Q, Qbar} <= 2'b01;
	else if ( (S == 1'b1) && (R == 1'b1) )
		{Q, Qbar} <= 2'bzz;
	// No coverage of the input combination 0 0 !!!!
end

endmodule
```

Note how the `n_reset` (active low) was added. This input signal takes precedence over the other two, so as long as `n_reset` is held low, `Q` and `Qbar` are both held low.

| Task-232 | continued |
| - | - |
| 4 | Write a testbench for this version of the SR-latch. Include the asynchronous input. Check that `S` and `R` are ignored as long as `n_reset` is low |
| - | A solution `srgate_tb-solution.sv` is provided |

## Task-232 D-Latch
The SR Latch is the most basic sequential building block, but is rarely used. Much more common is the D-Latch (see section 5.1.2 in [1]).

A SystemVerilog model for a D-Latch is shown below:

```verilog
module dlatch (output logic Q, input logic D, EN, n_Reset);

always_latch
	if (n_Reset == 1'b0) 
		Q <= 0;
	else if (EN == 1'b1)
		Q <= D;

endmodule
```

> **Note** that although all states of `n_Reset` are covered, the condition for `EN=0` is not covered. This is the latching condition.

In some ways, this HDL defines a D-Latch clearer than words. First of all, an asynchronous reset has been added. This overrides all other behaviour as before.
What is of most interest is the behaviour when `n_Reset = 1`.

* When the **level** of `EN` is HIGH, then the output `Q` will simply follow the value of input `D`
* When the **level** of `EN` is LOW, the output `Q` will latch it's current value

Note the stress of the word *level*. As long as `EN` is held HIGH, so `Q` will follow `D`. A truth table can be written as follows:

| n_Reset | EN | D | Q |
| - | -  | - | - |
| 0 | x | x | 0 |
| 1 | 0  | x | Q |
| 1 | 1  | 0 | 0 |
| 1 | 1  | 1 | 1 |

where `x` represents a don't care. Another way to look at it is that the device ignores the input `D` when `EN` is LOW.

| Task-234 | D-Latch |
| - | - |
| 1 | Compile the modules `dlatch.sv` and `dlatch_tb.sv` |  
| 2 | Simulate the testbench - produce a waveform showing the simulation output |
| 3 | Read the comments in the test bench. Complete the test bench |

Note how the following sequences are used for testing:

* With `EN` LOW, set `D` to a specific value
* Pull `EN` HIGH for a short period of time - the output should follow `D`
* Pull `EN` LOW again - the output should remain the same (latched)

Imagine that the pulse width of `EN` is made to be very short. We might refer to such a signal as a *strobe*. Such a technique could be used as a way to capture (and latch) the valid of `D` at an specific point in time. This the basis of a D-Flip Flop.

## Task-234 D-Type flip-flop
The D Flip Flop is *similar* to the D Latch, except it is not level triggered. Instead it is **edge triggered**.

> Consider adding some additional circuitry that connects to the `EN` input of a D Latch. This circuitry produces a *very* narrow `EN` pulse when it's clock input changes in a prescribed direction.

For the D Flip Flop, the convention is that the output `Q` latches the input value `D` *when its clock input rises*. Let's now look at the HDL.



## J-K Flip-Flop

## Testing Sequential Logic

## Modelling Delays

## Testing


## References

See [References](references.md) for a list of numbered references in this course.