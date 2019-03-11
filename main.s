.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	nop
	//give reg r0, r1, r2 value
	mov	r0,	#100
	mov	r1,	#101
	mov	r2,	#102
	
	//test with 3 trials
	push	{r2, r0, r1}
	pop	{r3, r4, r5}
	
	push	{r0, r1, r2}
	pop	{r3, r4, r5}
	
	push	{r0, r1, r2}
	pop	{r5, r3, r4}
	//
	//branch w/o link
	//
	b	label01

label01:
	nop

	//
	//branch w/ link
	//
	bl	sleep

sleep:
	nop
	b	.
