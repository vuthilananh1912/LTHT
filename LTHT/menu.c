/* 
#include <conio.h>
#include <stdio.h>

extern void CN1();
extern void CN2();
//extern void kRAM();
//extern void VeDOS();

void main() {
    char tl;
    int cn;

    clrscr();

    printf ("\n          Truong Dai hoc Mo Ha Noi");
    printf  ("\n          KHOA CONG NGHE THONG TIN");
    printf  ("\n          -----------o0o----------");
    printf  ("\n\n\n           BAI TAP LON MON LTHT");
    printf  ("\n\n\n     Cac SV thuc hien:");
    printf("\n      1. Vu Thi Lan Anh          Lop: 2010A05");
    printf("\n      2. Phan Công Long          Lop: 2010A05");
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
        // scanf ("%d",&cn);

        switch (cn) {
            case 1:
              CN1();
                break;
            case 2:
              CN2();
                break;
            case 3:
               // kRAM();
                break;
            case 4:
               // VeDOS();
                break;
            default:
                printf ("\n     Vao sai roi!");
        }

        printf  ("\n   Co thuc hien CN khac(c/k): ");
        tl = getch();

        if (tl == 'c') {
            goto L1;
        }
    }
}
// */
// // test chuong trinh
// #include <stdio.h>
// #include <conio.h>
// extern CN1();
// extern CN2();
// extern CN3();
// //extern kRAM();
// //extern VeDOS();
// void main()
// {
//       char tl;
//       int cn; /*chuc nang*/
//       clrscr();
//       printf("\n          Truong Dai hoc Mo Ha Noi");
//       printf("\n          KHOA CONG NGHE THONG TIN");
//       printf("\n          -----------o0o----------");
//       printf("\n\n\n           BAI TAP LON MON LAP TRINH HE THONG");
//       printf("\n\n\n     Cac SV thuc hien:");
//       printf("\n      1. Ha Thi Van Anh          Lop: 2010A04");
//       printf("\n      2. Dinh Dieu Thuy    Lop: 2010A05");
//       printf("\n      3. Nguyen Thi Tinh       Lop: 2010A04");
//       printf("\n\n\n     Co tiep tuc CT (c/k)?");
//       tl=getch();
//       if(tl=='c')
//                {
//                  L1:
//                  clrscr();
//                  printf("\n            CAC CHUC NANG CUA BTL");
//                  printf("\n            ---------***----------");
//                  printf("\n\n     1. Copy tep.");
//                  printf("\n     2. Tinh cap so cong khi biet n, d va u1.");
//                  printf("\n     3. Sp luong o mem");
//                  printf("\n     4. Thoat khoi chuong trinh.");
//                  printf("\n\n     Hay chon: ");
//                  scanf("%d",&cn);
//                  switch(cn)
//                  {
//                  case 1: CN1(); break;
//                  case 2: CN2(); break;
//                  case 3: CN3(); break;
//                 // case 4: VeDOS(); break;
//                  default: printf("\n     Vao sai roi!");
//                  }
//      printf("\n   Co thuc hien CN khac(c/k): ");
//      tl=getch();
//      if(tl=='c'){
//       goto L1;
//       }
//       }
//       }

      // test tu day
#include <stdio.h>
#include <conio.h>
extern CN1();
//extern CN2();
//extern CN3(); 
void main()
{
      char tl;
      int cn; /*chuc nang*/
      clrscr();
      printf("\n          Truong Dai hoc Mo Ha Noi");
      printf("\n          KHOA CONG NGHE THONG TIN");
      printf("\n          -----------o0o----------");
      printf("\n\n\n           BAI TAP LON MON LTHT");
      printf("\n\n\n     Cac SV thuc hien:");
      printf("\n      1. Nguyen Van Anh      Lop: 20A1");
      printf("\n      2. Do Thi Hoa          Lop 20A1");
      printf("\n      3. Hoang Thi Oanh      Lop: 20A4");
      printf("\n\n\n     Co tiep tuc CT (c/k)?");
      tl=getch();
      if(tl=='c')
               {
                 L1:
                 clrscr();
                 printf("\n            CAC CHUC NANG CUA BTL");
                 printf("\n            ---------***----------");
                  printf("\n\n     1. Chuc nang dat lai ngay thang nam cho tep");
             printf("\n     2. Chuc nang tinh tong cac so tu 1 den n");
             printf("\n     3. Dia chi Cong Com1");
                 printf("\n\n     Hay chon: ");
                 scanf("%d",&cn);
                 switch(cn)
                 {
                 case 1: CN1(); break;
                // case 2: CN2(); break;
                 //case 3: CN3(); break;
                 default: printf("\n     Vao sai roi, cao to oi!");
                 }
     printf("\n     Co thuc hien CN khac(c/k): ");
     tl=getch();
     if(tl=='c'){
      goto L1;
      }
      }
      }



        

        
   