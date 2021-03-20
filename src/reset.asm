.include "constants.inc"

.segment "CODE"
.import main
.export reset_handler
.proc reset_handler
  SEI
  CLD
  LDX #$00
  STX $2000
  STX $2001
vblankwait:
  BIT $2002
  BPL vblankwait
  JMP main
.endproc
