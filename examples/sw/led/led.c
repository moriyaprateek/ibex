// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>
// static void delay_loop_ibex(unsigned long loops) {



int main(int argc, char **argv) {
  // The lowest four bits of the highest byte written to the memory region named
  // "stack" are connected to the LEDs of the board.
  volatile uint8_t *var = (volatile uint8_t *) 0x0000c010;
  *var = 0x0a;

   asm volatile(".insn r CUSTOM_0, 0x7, 2, %0, %1, %2 ");

  return 0;

}
