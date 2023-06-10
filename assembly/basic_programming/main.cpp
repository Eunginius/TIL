#include <stdio.h>

extern "C"
{
    void fun1(__int64 *fill, int size);
    __int64 fun2(__int64 num1, __int64 num2);
    __int64 fun3(__int64 *fill, int size);
};


int main()
{
    printf("fun1:\n");
    /*
        실습 1. 배열에 값 저장하기
        - 배열 변수 선언
        - 어셈블리 함수 호출
            함수를 통해 변수에 값 작성
        - 반복문을 통해 작성된 값 확인
    */
    __int64 a[10];  

    fun1(a, 10);   

    for (int i = 0; i < 10; i++)
        printf("%I64d   ", a[i]);

    printf("\n");   


    printf("\nfun2:\n");
    /*
        실습 2. 입력 받은 2개의 값 비교하기
        - 변수 선언
        - 어셈블리 함수 호출 후 리턴 값을 변수에 저장
    */
    __int64 b;
    b = fun2(4, 2);
    printf("%I64d\n", b);


    printf("\nfun3:\n");
    /*
        실습 3. 구구단 출력 (2중 루프 프로그래밍)
        - 배열 변수 선언
        - 어셈블리 함수 호출
            함수를 통해 변수에 값 작성
        - 반복문을 통해 작성된 값 확인
    */
    __int64 c[18];
    fun3(c, 18);
    for (int i = 0; i < 18; i++) {
        if (i == 9)
            printf("\n");
        printf("%I64d   ", c[i]);
    }

    return 0;
}
