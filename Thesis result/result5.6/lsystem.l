#define ball_s 0.35
#define tail_s 0.35
#define ang1 80
#define ang2 15
#define Ct 0

#define interval 6
#define STEPS 40
#define ford 1.2
#define ford2 0.3
#define ori 0.02


#define WIDS  0.3
#define WIDE  0.05
#define WR 1.45
#define MAXNO 5

Lsystem: 1
Define: {array len[MAXNO] = {1.2,1,0.8,0.6,0.5};}
derivation length: STEPS

Axiom:Cloud1(3,3,1,1)

Cloud1(str1,T,num,recr) --> SYM(str1,T,num,recr,str1)
Cloud2(str1,T,num,recr,str2): recr>0 --> SYM(str1,T,num,recr,str2)
Cloud3(str1,T,num,recr,str2,str3): recr>0 --> SYM(str1,T,num,recr,str2)g;(9)SYM(str2,T,num,recr,str3)

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==1 --> [milt-tail(T)gSYM(type2,T,num,Cnt-1,type1)]                    /* 1 single cloud */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==2 --> [+(90)g(ford)[milt-tail(T)];(4)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)SYM(type2,T,num,Cnt-1,type1)]    /* 2  180 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==3 --> [g(ford)[milt-tail(T)];(4)SYM(type2,T,num,Cnt-1,t)]
							[+(120)g(ford)[milt-tail(T)];(5)SYM(type2,T,num,Cnt-1,type1)]
							[-(120)g(ford)[milt-tail(T)];(6)SYM(type2,T,num,Cnt-1,type1)]  /* 3  120 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==4 --> [g(ford)[milt-tail(T)]gSYM(type2,T,num,Cnt-1,type1)]
							[+(90)g(ford)[milt-tail(T)];(4)gSYM(type2,T,num,Cnt-1,type1)]
							[|g(ford)[milt-tail(T)];(5)gSYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(6)gSYM(type2,T,num,Cnt-1,type1)]   /* 4  90 degree   */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==5 --> [g(0.2)[C(num,T)]]
							[&(45)g(ford)[^(45)milt-tail(T)];(4)gSYM(type2,T,num,Cnt-1,type1)]
							[/(45)[+(120)g(ford)[-(120)milt-tail(T)];(5)gSYM(type2,T,num,Cnt-1,type1)]]
							[\(45)[-(120)g(ford)[+(120)milt-tail(T)];(6)gSYM(type2,T,num,Cnt-1,type1)]]  /* 5 Tetrahedron  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==6 --> [g(0.5)C(num,T)]
							[&(45)[g(ford)[milt-tail(T)];(4)gSYM(type2,T,num,Cnt-1,type1)]]
							[/(45)[+(90)g(ford)[milt-tail(T)];(5)gSYM(type2,T,num,Cnt-1,type1)]]
							[^(45)[|g(ford)[milt-tail(T)];(6)gSYM(type2,T,num,Cnt-1,type1)]]
							[\(45)[-(90)g(ford)[milt-tail(T)];(7)gSYM(type2,T,num,Cnt-1,type1)]] /* 6 Square pyramid  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==7 --> [C(num,T)]
							[+(90)g(ford)[milt-tail(T)];(4)-(90)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)+(90)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[&(60)+(30)g(ford)[milt-tail(T)]]
							[&(60)-(30)g(ford)[milt-tail(T)]]  /* 7  M-type  I  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==8 --> [C(num,T)]
							[+(90)g(ford)[milt-tail(T)];(4)-(90)g(ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)+(90)g(ford)SYM(type2,T,num,Cnt-1,type1)]
							[^(130)+(30)g(ford)[milt-tail(T)]]
							[^(130)-(30)g(ford)[milt-tail(T)]]  /*  8 W-cloud  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==9 --> [C(num,T)]
							[+(130)g(ford)[milt-tail(T)]g(ford)[milt-tail(T)];(4)-(130)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(130)g(ford)[milt-tail(T)]g(ford)[milt-tail(T)];(5)+(130)g(-ford)SYM(type2,T,num,Cnt-1,type1)]  /* 9 mountain cloud  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==10 -->[C(num,T)]
							[+(90)g(ford)[milt-tail(T)];(4)-(90)gSYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)+(90)gSYM(type2,T,num,Cnt-1,type1)]  /*  10 line cloud  */


/*    cloud 1    */
  C(num,T) : num==1 --> C1(0.2,0.2,3,T)
  C(num,T) : num==2 --> C2(0.3,0.2,8,T)
  C(num,T) : num==3 --> C3(0.5,0.1,13,T)

/* C2(ball, cnt2): ball==cnt2 { 
	if( (ball%interval)==(interval-1) ){
		cnt2=cnt2+1; }
} --> ;(1)-(80)^(20)g(ford2)[O(ball_s)]C2(ball+1,cnt2+1)
C2(ball,cnt2): ball>=cnt2 --> C2(ball,cnt2+1)  */

/* C1(d0,db,n,T): n==0 --> -(ang1)\(ang2)g(d0)[O(db)] */
C1(d0,db,n,T): n>0 --> -(ang1)\(ang2)g(d0)[O(db)]C1(ori+d0,ran(0.1)+db,n-1,T)

C2(d0,db,n,T) : n>0  --> ;(2)[+(140)g(d0)C1(ran(0.1)+d0,ran(0.05)+db,n-1,0)][-(90)g(d0)C1(ran(0.1)+d0,ran(0.05)+db,n-1,T)]

C3(d0,db,n,T) : n>0  --> ;(3)[+(140)g(0.3)g(d0)C1(ran(0.1)+d0,ran(0.1)+db,n-1,T)][C1(ran(0.1)+d0,ran(0.1)+db,n-1,0)][-(90)g(0.6)g(d0)C1(ran(0.1)+d0,ran(0.1)+db,n-1,0)] 


/*    tail       */
 /* tail(t) : t==1 --> #(0.5)@Gt(1)@Gs#(0.01)+(30)f(2)@Gc(60)  */

 milt-tail(t) : t>0 --> +(5)\(2)[tail(t+3)]milt-tail(t-1)
 milt-tail(t) : t==0 --> g(0.01)
 tail(t) --> tail_s(t)tail_e(t,WIDE) 
 tail_s(t) --> #(WIDE)@Gt(1)@Gs#(WIDS)  
 tail_e(n,w) : n>0 --> -(35)&(10)f(len[n])#(w*WR)@Gc(60)tail_e(n-1,w*WR) 
 tail_e(n,w) : n==0 --> C(1,T)

/*     sphere     */
 iO(o) --> @O(o)
 O(o) : o>0 --> @O(o+ori)
 
homomorphism 
 tail_e(n,w) : n>0  --> +(10)f(0.2)@Ge(60)@O(w)

endlsystem

