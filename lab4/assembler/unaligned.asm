main:
  LDR   R0,=usage_fault_handler
  LDR   R7,=0x2001c018
  STR   R0,[R7]

main_1:
  LDR   R0,= 0x20001001
@ Nästa instruktion orsakar felet
  LDR   R0,[R0]
  B     main_1      @utförs aldrig

@ Vi kan inte hantera felet så vi "låser" processorn
@ med en oavslutad slinga
  .thumb_func
usage_fault_handler:
  B     usage_fault_handler
