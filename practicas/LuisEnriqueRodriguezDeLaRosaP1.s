.global _start
.text
_start:
        mov $25134, %rdi         	#A
	mov $19185, %rsi		#B			
        call euclides
        call salir

euclides:
        mov  %rdi, %rax       	#rax se guarda el resultado
        mov  $0, %rdx		#rdx se guarda el reciduo 
	mov  %rsi, %rbx         
	div  %rbx               #div de rbx
	mov  %rsi, %rdi
	mov  %rdx, %rsi
	cmp  $0, %rdx
	jne  euclides
	ret 

salir:
	mov $60, %rax
	syscall
	
	
