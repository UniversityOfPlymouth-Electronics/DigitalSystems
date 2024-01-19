#include "elec241.h"

uint16_t fpgaWord(INSTR u, uint16_t payload) {
	return ((uint16_t)u << 12) | (payload & 0x0FFF);
}