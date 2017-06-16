
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                               syscall.asm
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                                                     Forrest Yu, 2005
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%include "sconst.inc"


INT_VECTOR_SYS_CALL equ 0x90
_NR_get_ticks       equ 0 ; 要跟 global.c 中 sys_call_table 的定义相对应！
_NR_color_show	    equ 1
_NR_sleep	    equ 2
_NR_sem_p	    equ 3 ;p操作
_NR_sem_v	    equ 4 ;v操作

; 导出符号
global	get_ticks
global  print
global  sleep
global  sem_p  
global  sem_v

bits 32
[section .text]

; ====================================================================
;                              get_ticks
; ====================================================================
get_ticks:
	mov	eax, _NR_get_ticks
	int	INT_VECTOR_SYS_CALL
	ret

; ====================================================================================
;                          void color_show(char* buf,int color);
; ====================================================================================
print:
        mov     eax, _NR_color_show
	mov     ecx, [esp + 8]
        mov     ebx, [esp + 4]
        int     INT_VECTOR_SYS_CALL
        ret

;====================================================================================
;                          void sleep(int milli_sec);
; ====================================================================================
sleep:
        mov     eax, _NR_sleep
        mov     ebx, [esp + 4]
        int     INT_VECTOR_SYS_CALL
        ret

;====================================================================================
;                          void sem_p(SEMAPHORE* sem,int index);//?
; ====================================================================================
sem_p:
        mov     eax, _NR_sem_p
	mov     ecx, [esp + 8]
        mov     ebx, [esp + 4]
        int     INT_VECTOR_SYS_CALL
        ret

;====================================================================================
;                          void sem_v(SEMAPHORE* sem);
; ====================================================================================
sem_v:
        mov     eax, _NR_sem_v
        mov     ebx, [esp + 4]
        int     INT_VECTOR_SYS_CALL
        ret
