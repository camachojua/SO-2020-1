#Main numeros de carmichael
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
        je      .L6
        cmp     DWORD PTR [rbp-24], 1
        je      .L7
        jmp     .L11
.L6:
        mov     eax, 1
        jmp     .L9
.L7:
        mov     eax, DWORD PTR [rbp-20]
        mov     edx, 0
        div     DWORD PTR [rbp-28]
        mov     eax, edx
        jmp     .L9
.L11:
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
        je      .L10
        mov     eax, DWORD PTR [rbp-20]
        imul    rax, QWORD PTR [rbp-8]
        mov     ecx, DWORD PTR [rbp-28]
        mov     edx, 0
        div     rcx
        mov     QWORD PTR [rbp-8], rdx
.L10:
        mov     rax, QWORD PTR [rbp-8]
.L9:
        leave
        ret
is_carmichael(unsigned int):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-20], edi
        mov     DWORD PTR [rbp-8], 0
        mov     eax, DWORD PTR [rbp-20]
        and     eax, 1
        test    eax, eax
        jne     .L13
        mov     eax, 0
        jmp     .L14
.L13:
        mov     eax, DWORD PTR [rbp-20]
        imul    eax, eax
        mov     DWORD PTR [rbp-12], eax
        mov     DWORD PTR [rbp-4], 2
.L19:
        mov     eax, DWORD PTR [rbp-4]
        cmp     DWORD PTR [rbp-20], eax
        jbe     .L15
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-12]
        jle     .L16
        cmp     DWORD PTR [rbp-8], 0
        jne     .L16
        mov     eax, 0
        jmp     .L14
.L16:
        mov     eax, DWORD PTR [rbp-4]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, edx
        mov     edi, eax
        call    gcd(unsigned int, unsigned int)
        cmp     eax, 1
        seta    al
        test    al, al
        je      .L17
        mov     DWORD PTR [rbp-8], 1
        jmp     .L18
.L17:
        mov     eax, DWORD PTR [rbp-20]
        lea     ecx, [rax-1]
        mov     eax, DWORD PTR [rbp-4]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, ecx
        mov     edi, eax
        call    modexp(unsigned int, unsigned int, unsigned int)
        cmp     eax, 1
        setne   al
        test    al, al
        je      .L18
        mov     eax, 0
        jmp     .L14
.L18:
        add     DWORD PTR [rbp-4], 1
        jmp     .L19
.L15:
        mov     eax, 1
.L14:
        leave
        ret
.LC0:
        .string "%u\n"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 2
.L23:
        cmp     DWORD PTR [rbp-4], 99999
        ja      .L21
        mov     eax, DWORD PTR [rbp-4]
        mov     edi, eax
        call    is_carmichael(unsigned int)
        test    eax, eax
        setne   al
        test    al, al
        je      .L22
        mov     eax, DWORD PTR [rbp-4]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
.L22:
        add     DWORD PTR [rbp-4], 1
        jmp     .L23
.L21:
        mov     eax, 0
        leave
        ret
