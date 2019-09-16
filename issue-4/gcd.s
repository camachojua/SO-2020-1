#Maximo comun divisor
gcd(unsigned int, unsigned int):
	        push    rbp
	        mov     rbp, rsp
	        sub     rsp, 16
	        mov     DWORD PTR [rbp-4], edi
	        mov     DWORD PTR [rbp-8], esi
	        cmp     DWORD PTR [rbp-8], 0
	        je      .L2
	        mov     eax, DWORD PTR [rbp-4]
	        mov     edx, 0
	        div     DWORD PTR [rbp-8]
	        mov     eax, DWORD PTR [rbp-8]
	        mov     esi, edx
	        mov     edi, eax
	        call    gcd(unsigned int, unsigned int)
	        jmp     .L4
	.L2:
	        mov     eax, DWORD PTR [rbp-4]
	.L4:
	        leave
	        ret


modexp(unsigned int, unsigned int, unsigned int):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-20], edi
        mov     DWORD PTR [rbp-24], esi
        mov     DWORD PTR [rbp-28], edx
        cmp     DWORD PTR [rbp-24], 0
        je      .L2
        cmp     DWORD PTR [rbp-24], 1
        je      .L3
        jmp     .L7
.L2:
        mov     eax, 1
        jmp     .L5
.L3:
        mov     eax, DWORD PTR [rbp-20]
        mov     edx, 0
        div     DWORD PTR [rbp-28]
        mov     eax, edx
        jmp     .L5
.L7:
        mov     eax, DWORD PTR [rbp-24]
        shr     eax
        mov     ecx, eax
        mov     edx, DWORD PTR [rbp-28]
        mov     eax, DWORD PTR [rbp-20]
        mov     esi, ecx
        mov     edi, eax
        call    modexp(unsigned int, unsigned int, unsigned int)
        mov     eax, eax
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        imul    rax, rax
        mov     ecx, DWORD PTR [rbp-28]
        mov     edx, 0
        div     rcx
        mov     QWORD PTR [rbp-8], rdx
        mov     eax, DWORD PTR [rbp-24]
        and     eax, 1
        test    eax, eax
        je      .L6
        mov     eax, DWORD PTR [rbp-20]
        imul    rax, QWORD PTR [rbp-8]
        mov     ecx, DWORD PTR [rbp-28]
        mov     edx, 0
        div     rcx
        mov     QWORD PTR [rbp-8], rdx
.L6:
        mov     rax, QWORD PTR [rbp-8]
.L5:
        leave
        ret
