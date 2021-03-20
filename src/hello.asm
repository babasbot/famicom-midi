.include "constants.inc"
.include "notes.inc"
.include "header.inc"

.segment "CODE"
.proc irq_handler
  RTI
.endproc

.proc nmi_handler
  RTI
.endproc

.import reset_handler

.export main
.proc main
  ; enables the square 1 channel
  LDA #%00000001
  STA APUFLAGS

  ; sets the square channel 1 duty cycle to 50% and max volume
  LDA #%10111111
  STA SQ1_ENV

  ; plays an A4 note on the square channel
  LDA #A4
  STA SQ1_LO
  LDA #$00
  STA SQ1_HI

forever:
  JMP forever
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "CHARS"
.res 8192
.segment "STARTUP"
