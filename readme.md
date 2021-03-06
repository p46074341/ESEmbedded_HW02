HW02
===
This is the hw02 sample. Please follow the steps below.

# Build the Sample Program

1. Fork this repo to your own github account.

2. Clone the repo that you just forked.

3. Under the hw02 dir, use:

	* `make` to build.

	* `make clean` to clean the ouput files.

4. Extract `gnu-mcu-eclipse-qemu.zip` into hw02 dir. Under the path of hw02, start emulation with `make qemu`.

	See [Lecture 02 ─ Emulation with QEMU] for more details.

5. The sample is designed to help you to distinguish the main difference between the `b` and the `bl` instructions.  

	See [ESEmbedded_HW02_Example] for knowing how to do the observation and how to use markdown for taking notes.

# Build Your Own Program

1. Edit main.s.

2. Make and run like the steps above.

# HW02 Requirements

1. Please modify main.s to observe the `push` and the `pop` instructions:  

	Does the order of the registers in the `push` and the `pop` instructions affect the excution results?  

	For example, will `push {r0, r1, r2}` and `push {r2, r0, r1}` act in the same way?  

	Which register will be pushed into the stack first?

2. You have to state how you designed the observation (code), and how you performed it.  

	Just like how [ESEmbedded_HW02_Example] did.

3. If there are any official data that define the rules, you can also use them as references.

4. Push your repo to your github. (Use .gitignore to exclude the output files like object files or executable files and the qemu bin folder)

[Lecture 02 ─ Emulation with QEMU]: http://www.nc.es.ncku.edu.tw/course/embedded/02/#Emulation-with-QEMU
[ESEmbedded_HW02_Example]: https://github.com/vwxyzjimmy/ESEmbedded_HW02_Example

--------------------

- [8=D] **If you volunteer to give the presentation next week, check this.**

--------------------

Please take your note here.

1. Experiment Question
	
	write a simple assembly language to observe the instructions push and pop.
2. Experiment Procedures

	1. Copy the emu-mcu-eclipse-qemu die completely to ESEmbedded_HW02
	2. Accroding to the descriptions of PUSH and POP in ARM information center.
	3. Design test code main.s, from _strat to excute the instructions sequentially, observing the difference between each steps.
	![image 5](https://github.com/p46074341/ESEmbedded_HW02/blob/master/picture/5.png)
	4. Complier main.s and simulate by qemu,% make clean , % make , % make qemu , then open the other Terminal to connect % arm-none-eabi-gdb, then enter target remote 127.0.0.1:1234 and press ctrl+x and 2 twice, open the regester and instrcution, enter si to observe step by step.
		
	find out in qemu the order of PUSH and POP will automatically arrange sequentially from lower to higher reg and excute the part of mov instruction  
	![image 1](https://github.com/p46074341/ESEmbedded_HW02/blob/master/picture/1.png)
	
	  excute the first PUSH and observe the change in pc, sp and MSP
	![image 2](https://github.com/p46074341/ESEmbedded_HW02/blob/master/picture/2.png)
	
	  excute the first POP, the r3, r4 and r5 chnage the values which are from r0, r1, r2 
	![image 3](https://github.com/p46074341/ESEmbedded_HW02/blob/master/picture/3.png)
	
	  excute all the instructions, the result seems not to be affected by the difference of sequence  
	![image 4](https://github.com/p46074341/ESEmbedded_HW02/blob/master/picture/4.png)
		 
3. Result and Disscution

	From the observation, I can find out that the instrucions will automaticaly arrange the reg order from lower to higher, and whetehr change 
	the order of reg in PUSH and POP instrucion, the result are same, it means the different order won't affect the excution results.
	The lowest reg will be pushed into the stack first, in my tset, r0 is the lowest.
