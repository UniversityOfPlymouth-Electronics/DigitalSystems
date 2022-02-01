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

## Latching Outputs

## Blocking and non-blocking assignment

## `@always` blocks

## Excitation Lists

## Asynchronous Inputs

## D-Latch

## Edge Triggered Outputs - the D-Type flip-flop

## Testing Sequential Logic

## J-K Flip-Flop

## Modelling Delays

## Testing


## References

See [References](references.md) for a list of numbered references in this course.