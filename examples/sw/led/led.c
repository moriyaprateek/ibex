// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>
#define CLK_FIXED_FREQ_HZ (50ULL * 1000 * 1000)

/**
 * Delay loop executing within 8 cycles on ibex
 */
// static void delay_loop_ibex(unsigned long loops) {
//   int out; /* only to notify compiler of modifications to |loops| */
//   asm volatile(

//       ".insn r CUSTOM_0, 0x7, 0x1, %0, %1, %2 "

//   );
// }

void bloom_add(unsigned int *a1, unsigned int *a2){
  asm volatile(
   ".insn r CUSTOM_0, 0x7, 0x1, %0, %1, %2 "
    : "=r"(&a1[0])				 
    : "r"(&a1[0]), "r"(&a2[0])			

  );
  return;

}


int main(int argc, char **argv) {
  // The lowest four bits of the highest byte written to the memory region named
  // "stack" are connected to the LEDs of the board.
  volatile uint8_t *var = (volatile uint8_t *) 0x0000c010;
  *var = 0x0a;


  return 0;

}
