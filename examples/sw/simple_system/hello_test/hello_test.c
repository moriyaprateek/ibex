// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "simple_system_common.h"

int bloom_insert(int a, int b){
	int result;

	asm (".insn r CUSTOM_0, 0x7, 1, %0, %1, %2" : "=r" (result) : "r" (a), "r" (b));
	return result;
}
	

int bloom_reset(int a, int b){
	int result;

	
	asm (".insn r CUSTOM_0, 0x7, 3, %0, %1, %2" : "=r" (result) : "r" (a), "r" (b));
	return result;

}

int bloom_check(int a, int b){
	int result;
	asm (".insn r CUSTOM_0, 0x7, 4, %0, %1, %2" : "=r" (result) : "r" (a), "r" (b));

	return result;
}

int main(int argc, char **argv) {
  


int result = (bloom_insert(12, 4));

int result2 = (bloom_reset(1, 2) );


int result3 = (bloom_check(12,1));


  return result * result2 * result3;
}
