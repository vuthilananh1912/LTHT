#include <stdio.h>
#include <conio.h>
extern CN1();
extern CN2();
extern CN3();
//extern VeDOS();
void main()
{
    char tl;
    int cn; /*chuc nang*/
    clrscr();
    printf("\n          Truong Dai hoc Mo Ha Noi");
    printf("\n          KHOA CONG NGHE THONG TIN");
    printf("\n          -----------o0o----------");
    printf("\n\n\n           BAI TAP LON MON LAP TRINH HE THONG");
    printf("\n\n\n     Cac SV thuc hien:");
    printf("\n      1. Vu Thi Lan Anh          Lop: 2010A05");
    printf("\n      2. Phan Cong Long          Lop: 2010A05");
    printf("\n      3. Hoang Viet Trung        Lop: 2110A01");
    printf("\n\n\n     Co tiep tuc CT (c/k)?");
    tl = getch();
    if (tl == 'c')
    {
        L1:
        clrscr();
        printf("\n            CAC CHUC NANG CUA BTL");
        printf("\n            ---------***----------");
        printf("\n\n   1. Tao thu muc");
        printf("\n     2. Tinh tong cac thanh phan le cua day so nguyen");
        printf("\n     3. Kiem tra xem may tinh co cong COM khong");
        printf("\n     4. Thoat khoi chuong trinh.");
        printf("\n\n     Hay chon: ");
        scanf("%d", &cn);
        switch (cn)
        {
       case 1:  CN1(); break;
       case 2:  CN2(); break;
        case 3: CN3(); break;
        //case 4: VeDOS(); break;
        default:
            printf("\n     Vao sai roi!");
        }
        printf("\n   Co thuc hien CN khac(c/k): ");
        tl = getch();
        if (tl == 'c')
        {
            goto L1;
        }
    }
}
