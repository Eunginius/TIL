_TEXT SEGMENT

PUBLIC fun1
PUBLIC fun2
PUBLIC fun3

fun1 PROC
	push rbp
	mov rbp, rsp
	mov r10, 0	; 배열 인덱스와 동시에 배열에 저장할 값을 나타내는 변수
next:
	mov QWORD PTR [rcx], r10
	add r10, 1
	cmp r10, rdx	; 인덱스와 파라미터2(배열 사이즈)를 비교
	je ex	; 같을 경우 배열을 다 채운 것으로, ex로 이동하여 함수 종료
	add rcx, 8	; 다음 인덱스로 이동
	jmp next	; 루프
ex:
	mov rsp, rbp
	pop rbp
	ret 
fun1 ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fun2 PROC
	push rbp
	mov rbp, rsp

	cmp rcx, rdx	; 파라미터1과 2를 비교
		je equal
		jge bigger
		jle smaller

	; 같을 경우 0
	equal:	
		mov rcx, 0
		jmp cmp_end
	; 파라미터 1이 클 경우 1
	bigger:
		mov rcx, 1
		jmp cmp_end
	; 파라미터 2가 클 경우 2
	smaller:
		mov rcx, 2
		jmp cmp_end
	; 리턴값을 저장하는 rax에 저장
	cmp_end:
		mov rax, rcx

	mov rsp, rbp
	pop rbp
	ret 
fun2 ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fun3 PROC
	push rbp
	mov rbp, rsp
	mov r10, 0	; 배열 인덱스
	mov r11, 1	; 연산 결과를 저장할 변수(1로 초기화)
	mov r12, 1	; 단수를 나타내는 변수 

first:
	mov QWORD PTR [rcx], r11	; 연산 결과 저장
	
	add r10, 1	; 배열 인덱스 증가
	cmp r10, rdx	; 인덱스와 파라미터2(배열 사이즈)를 비교
	je ex	; 같을 경우 배열을 다 채운 것으로, ex로 이동하여 함수 종료
	
	add rcx, 8	; 다음 인덱스로 이동
	cmp r10, 9	; 9번 수행했다면 1단이 종료된 것으로 판단
	je second
	add r11, r12	; 현재 단수에 맞는 수를 더하는 방식으로 곱셈 연산 수행
	jmp first	; 루프
second:
	add r12, 1	; 단수 증가
	cmp r12, 3	; 2단까지만 수행하기 위해 비교 연산 수행
	je ex
	mov r11, r12	; 현재 단의 첫 번째 연산 결과는 단수 값과 동일
	jmp first
ex:
	mov rsp, rbp
	pop rbp
	ret 
fun3 ENDP

_TEXT ENDS
END
