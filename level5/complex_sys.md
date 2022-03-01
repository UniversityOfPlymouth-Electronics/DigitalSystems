[Back](../README.md)

---

<figure>
<img src="../img/hdl.png" width="300px">
</figure>




# Complex Systems
A pre-requisite of this practical is that you have watched and understood the lecture on controller-datapath, and have a basic grasp of the concepts contained within. 

Referring back to the lectures, you may recall special symbol for a **register assignment**, as depicted in the figure below:

<figure>
<img src="../img/asm-reg-assign.png" width=250>
<figcaption>ASM chart showing the register Y being assigned the value 1. For a register assignment, Y will update in state B</figcaption>
</figure>

Note the arrow ← that is used to indicate a **register assignment**.
`Y` is NOT a Moore output. In state `A`, the control signals will be set up so that on the **next** clock edge (state `B`), the register `Y` will hold the value 1 on its output.

In this task you are going to build, modify and test a register. A register is similar to a variable in a C or C++ program, in that you can set it to a value (on one clock edge) and it will remember (latch) that value. We sometimes say you can “set and forget”.

We have met a basic parallel in parallel out registers before. There are many variants on the specifics of registers. Let's look at one here that is more complex.

## Task-260 Generic Registers
Our aim to design a synchronous N-bit storage device that meets the following requirements:

It shall be possible to..

1. Write `N`-bit data to be stored without interfering with the current output
1. Read `N`-bit stored data when required
1. Control when the device ignores any input data
1. Reset the device asynchronously, with the output being set to `N'd0`

The requirements 1 and 2 demand that we have separate input and output ports as opposed to a single bi-directional port. This uses more signal connections, but also keeps the device simpler.

Requirement 3 suggests a control line used to determine when input data is read and when it is ignored.

Requirement 4 indicates we need an additional input for power-on reset.



## Task-262 Pipelined adder

<figure>
<img src="../img/circuit/controller-datapath-adder.png">
<figcaption>Top Level Design of the Pipelined Adder</figcaption>
</figure>

<figure>
<img src="../img/circuit/pipelined-adder-dataflow.png">
<figcaption>Dataflow components for the Pipelined Adder</figcaption>
</figure>

<figure>
<img src="../img/piplined_adder_timing.png">
<figcaption>Timing Diagram for the Pipelined Add</figcaption>
</figure>

## Task-264 Pipelined Arithmetic Task

## Task-266 Contrasting pipelined and parallel circuits




COMING SOON