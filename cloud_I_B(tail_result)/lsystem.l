#define ball_s 0.35
#define tail_s 0.35
#define ang1 80
#define ang2 15
#define Ct 0

#define interval 6
#define STEPS 40
#define ford 2
#define ford2 0.3
#define ori 0.02


#define WIDS  0.3
#define WIDE  0.05
#define WR 1.25
#define MAXNO 5

Lsystem: 1
/* Define: {array len[MAXNO] = {1.2,1,0.8,0.6,0.5};} */
Define: {array len[MAXNO] = {0.5,0.4,0.3,0.2,0.1};}
derivation length: STEPS

Axiom: milt-tail(3)

Cloud1(str1,T,num,recr) --> SYM(str1,T,num,recr,str1)
Cloud2(str1,T,num,recr,str2): recr>0 --> SYM(str1,T,num,recr,str2)
Cloud3(str1,T,num,recr,str2,str3): recr>0 --> SYM(str1,T,num,recr,str2)g;(9)SYM(str2,T,num,recr,str3)

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==1 --> [milt-tail(T)gSYM(type2,T,num,Cnt-1,type1)]                    /* 1 single cloud */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==2 --> [+(90)g(ford)[milt-tail(T)];(4)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)SYM(type2,T,num,Cnt-1,type1)]    /* 2  180 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==3 --> [g(ford)[milt-tail(T)];(4)SYM(type2,T,num,Cnt-1,type1)]
							[+(120)g(ford)[milt-tail(T)];(5)SYM(type2,T,num,Cnt-1,type1)]
							[-(120)g(ford)[milt-tail(T)];(6)SYM(type2,T,num,Cnt-1,type1)]  /* 3  120 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==4 --> [g(ford)[milt-tail(T)]gSYM(type2,T,num,Cnt-1,type1)]
							[+(90)g(ford)[milt-tail(T)];(4)gSYM(type2,T,num,Cnt-1,type1)]
							[|g(ford)[milt-tail(T)];(5)gSYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(6)gSYM(type2,T,num,Cnt-1,type1)]   /* 4  90 degree   */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==5 --> [C(num,T)]
							[+(130)g(ford)[milt-tail(T)]g(ford)[milt-tail(T)];(4)-(130)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(130)g(ford)[milt-tail(T)]g(ford)[milt-tail(T)];(5)+(130)g(-ford)SYM(type2,T,num,Cnt-1,type1)]  /* 5 mountain cloud  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==6 -->[C(num,T)]
							[+(90)g(ford)[milt-tail(T)];(4)-(90)gSYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)+(90)gSYM(type2,T,num,Cnt-1,type1)]  /*  6 line cloud  */


SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==7 --> [g(0.2)[C(num,T)]]
							[&(45)g(ford)[^(45)milt-tail(T)];(4)gSYM(type2,T,num,Cnt-1,type1)]
							[/(45)[+(120)g(ford)[-(120)milt-tail(T)];(5)gSYM(type2,T,num,Cnt-1,type1)]]
							[\(45)[-(120)g(ford)[+(120)milt-tail(T)];(6)gSYM(type2,T,num,Cnt-1,type1)]]  /* 7 Tetrahedron  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==8 --> [g(0.5)C(num,T)]
							[&(45)[g(ford)[milt-tail(T)];(4)gSYM(type2,T,num,Cnt-1,type1)]]
							[/(45)[+(90)g(ford)[milt-tail(T)];(5)gSYM(type2,T,num,Cnt-1,type1)]]
							[^(45)[|g(ford)[milt-tail(T)];(6)gSYM(type2,T,num,Cnt-1,type1)]]
							[\(45)[-(90)g(ford)[milt-tail(T)];(7)gSYM(type2,T,num,Cnt-1,type1)]] /* 8 Square pyramid  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==9 --> [C(num,T)]
							[+(90)g(ford)[milt-tail(T)];(4)-(90)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)+(90)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[&(60)+(30)g(ford)[milt-tail(T)]]
							[&(60)-(30)g(ford)[milt-tail(T)]]  /* 9  M-type  I  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==10 --> [C(num,T)]
							[+(90)g(ford)[milt-tail(T)];(4)-(90)g(ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[milt-tail(T)];(5)+(90)g(ford)SYM(type2,T,num,Cnt-1,type1)]
							[^(130)+(30)g(ford)[milt-tail(T)]]
							[^(130)-(30)g(ford)[milt-tail(T)]]  /*  10 W-cloud  */



/*    cloud 1    */
  C(num,T) : num==1 --> C1(0.2,0.2,5,T)
  C(num,T) : num==2 --> [+(90)C2(0.3,0.2,9,T)]
  C(num,T) : num==3 --> [+(90)g(0.3)[-(150)C1(0.2,0.2,5,0)]][g(0.1)O(0.2)][^(110)g(0.2)[&(110)g(-0.1)C3(0.1,0.05,8,T)]][-(90)g(0.3)[C1(0.2,0.2,5,0)]]


/* C2(ball, cnt2): ball==cnt2 { 
	if( (ball%interval)==(interval-1) ){
		cnt2=cnt2+1; }
} --> ;(1)-(80)^(20)g(ford2)[O(ball_s)]C2(ball+1,cnt2+1)
C2(ball,cnt2): ball>=cnt2 --> C2(ball,cnt2+1)  */

C1(d0,db,n,T): n==0 && T!=0 --> [-(ang1)\(ang2)g(d0)[O(db)]][milt-tail(T,T)]
C1(d0,db,n,T): n>0 --> -(ang1)\(ang2)g(d0)[O(db)]C1(d0,ran(0.05)+db,n-1,T)

C2(d0,db,n,T): n==0 && T!=0 --> [-(ang1)\(ang2)g(d0)[O(db)]][milt-tail(T,T)]
C2(d0,db,n,T) : n>0  --> \(60)+(80)g(d0)[O(db)]C2(d0,ran(0.03)+db,n-1,T)
 
C3(d0,db,n,T): n==0 --> /(10)[milt-tail(T,T)]
C3(d0,db,n,T): n>0 --> -(55)/(5)g(-d0)[dO(db)]C3(ran(0.03)+d0,ran(0.07)+db,n-1,T)

/*    tail       */
 /* tail(t) : t==1 --> #(0.5)@Gt(1)@Gs#(0.01)+(30)f(2)@Gc(60)  */

 milt-tail(T) : T==1 --> #(0.3)@Gt(1)@Gs#(0.01)+(30)f(2)@Gc(60)
 milt-tail(T) : T==2 --> g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]
 milt-tail(T) : T==3 --> -(5)g(0.05)[tail(6)]-(5)g(0.05)[tail(6)]-(5)g(0.05)[tail(6)]
 milt-tail(T) : T==4 --> +(3)g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]
 milt-tail(T) : T==5 --> +(3)g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]+(3)g(0.05)[tail(6)]



/* milt-tail(T,t) : T==1 && t>-2 --> #(0.3)@Gt(1)@Gs#(0.01)+(30)f(2)@Gc(60)milt-tail(T,t-1)
 milt-tail(T,t) : T>1 && t>0 --> +(3)g(0.05)[tail(6)]milt-tail(T,t-1) */
 tail(t) --> tail_s(t)tail_e(t,WIDE)
 tail_s(t) --> #(WIDE)@Gt(1)@Gs#(WIDS)
 tail_e(n,w) : n>0 --> -(10)\(30)g(0.3)#(w*WR)@Gc(60)tail_e(n-1,w*WR)  
 

/*     sphere     */
 iO(o) --> @O(o)
 O(o) : o>0 --> @O(o+ori)
 
homomorphism 
 tail_e(n,w) : n>0  --> f(0.2)@Ge(60)@O(w)

endlsystem

