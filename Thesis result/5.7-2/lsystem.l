
/*    ------------ C1A define ----------   */
#define C1Aang1 80
#define C1Aang2 11
#define C1Aang3 30
#define C1Aang4 5
#define CR 0.87

/*    ------------ C1B define ----------   */
#define C1BR1 0.9
#define C1BR2 0.9
#define C1BWid1 1
#define C1BWid2 2
#define C1Bang1 9.0
#define C1Bang2 0.05
#define C1Bang3 12

/*    ------------ C2 define ----------   */
#define C2R1 0.9
#define C2R2 0.92
#define C2Wid1 1
#define C2Wid2 1
#define C2ang1 14
#define C2ang2 0.5
#define C2ang3 6
#define C2ang4 0.5

/*    ------------ C3 define ----------   */
#define C3ang1 60
#define C3ang2 80
/*    ------------ C4 define ----------   */
#define C4ang1 58
#define C4ang2 5
#define C4ang3 80
#define C4ang4 11
/*    -------------- TAIL- -----------   */
#define WIDS  3
#define WIDE  0.01
#define WR 0.85
#define MAXNO 5 
/*    -------------- SYM ------------   */
#define ford 15
#define ford2 0.3
#define ori 0.07
#define ball_s 0.35
/*    ---------- System define ---------   */
#define STEPS 25
Lsystem: 1
derivation length: STEPS
Define: {array len[MAXNO] = {8,6,4,3,2};}

/*    --------------------------------- AXIOM --------------------------------------   */
Axiom: [Cloud1(2,3,2,1)][Cloud1(3,0,3,1)]

/*    ---------------------------- CLOUD1 & CLOUD2 ---------------------------------   */

Cloud1(str1,T,num,recr) --> SYM(str1,T,num,recr,str1)
Cloud2(str1,T,num,recr,str2): recr>0 --> SYM(str1,T,num,recr,str2)

/*    ---------------------------------- SYM ---------------------------------------   */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==1 --> [C(num,T)gSYM(type2,T,num,Cnt-1,type1)]                       /* 1 single cloud */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==2 --> [+(90)g(ford)[-(150)C(num,T)]SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[-(150)C(num,T)]SYM(type2,T,num,Cnt-1,type1)]    /* 2  180 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==3 --> [g(6)[C(num,T)]gSYM(type2,T,num,Cnt-1,t)]
							[+(120)g(6)[C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]
							[-(120)g(6)[C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]   /* 3  120 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==4 --> [-(5)g(ford)[|C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]
							[-(95)g(ford)[|C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]
							[+(85)g(ford)[|C(num,T)];(5)gSYM(type2,T,num,Cnt-1,type1)]
							[+(175)g(ford)[|C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]   /* 4  90 degree   */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==5 --> [C(num,T)]
							[+(130)g(ford)[-(130)C(num,T)]g(ford)[-(130)C(num,T)];(4)-(130)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(130)g(ford)[+(130)C(num,T)]g(ford)[+(130)C(num,T)];(5)+(130)g(-ford)SYM(type2,T,num,Cnt-1,type1)]  /* 5 mountain cloud  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==6 -->[C(num,T)]
							[+(90)g(ford)[-(90)C(num,T)];(4)-(90)g(1.5)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[+(90)C(num,T)];(5)+(90)g(3.2)SYM(type2,T,num,Cnt-1,type1)]  /*  6 line cloud  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==7 --> [g(0.2)[C(num,T)]]
							[&(45)g(ford)[^(45)C(num,T)];(4)g(ford)SYM(type2,T,num,Cnt-1,type1)]
							[/(45)[+(120)g(ford)[-(120)C(num,T)];(5)g(ford)SYM(type2,T,num,Cnt-1,type1)]]
							[\(45)[-(120)g(ford)[+(120)C(num,T)];(6)g(ford)SYM(type2,T,num,Cnt-1,type1)]]  /* 7 Tetrahedron  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==8 --> [g(0.5)C(num,T)]
							[&(45)[g(ford)[C(num,T)];(4)g(ford)SYM(type2,T,num,Cnt-1,type1)]]
							[/(45)[+(90)g(ford)[C(num,T)];(5)g(ford)SYM(type2,T,num,Cnt-1,type1)]]
							[^(45)[|g(ford)[C(num,T)];(6)g(ford)SYM(type2,T,num,Cnt-1,type1)]]
							[\(45)[-(90)g(ford)[C(num,T)];(7)g(ford)SYM(type2,T,num,Cnt-1,type1)]] /* 8 Square pyramid  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==9 --> [C(num,T)]
							[+(90)g(ford)[-(90)C(num,T)];(4)-(90)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[+(90)C(num,T)];(5)+(90)g(-ford)SYM(type2,T,num,Cnt-1,type1)]
							[&(60)+(30)g(ford)[^(60)-(30)C(num,T)]]
							[&(60)-(30)g(ford)[^(60)+(10)C(num,T)]]  /* 9  M-type  I  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==10 --> [C(num,T)]
							[+(90)g(ford)[-(90)C(num,T)];(4)-(90)g(ford)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[+(90)C(num,T)];(5)+(90)g(ford)SYM(type2,T,num,Cnt-1,type1)]
							[^(130)+(30)g(ford)[&(130)+(30)C(num,T)]]
							[^(130)-(30)g(ford)[&(130)-(30)C(num,T)]]  /*  10 W-cloud  */


/*    ---------------------------- CLOUD ---------------------------------   */

  C(num,T) : num==1 --> -(80)[C1A(2,2.5,5,T)]
  C(num,T) : num==2 --> C1B(T)
  C(num,T) : num==3 --> +(10)[C2(T)]
  C(num,T) : num==4 --> [^(70)[\(60)C3(1.5,2.5,9,T)]]
  C(num,T) : num==5 --> [+(90)g(3)[-(150)C41(2,2,5,0)]][g(1)O(2)][^(110)g(3)[&(110)g(-1.5)C4(1,1,6,T)]][-(90)g(3)[C42(2,2,5,0)]] 
  
/*    cloud 1 A   */
  C1A(d0,db,n,T): n==0 --> ^(65)g(1.1)+(90)\(3)g(0.6)[-(65)&(55)C1Aend(10)][milt-tail(T,T)]
  C1A(d0,db,n,T): n>0 --> -(C1Aang1)\(C1Aang2)g(d0)[O(db)]C1A(d0,ran(0.5)+db,n-1,T)
  C1Aend(c) : c>0 --> C1Aend_s(c)C1Aend_e(c,1.6)
  C1Aend_s(c) --> #(0.2)@Gt(1)@Gs
  C1Aend_e(c,w) : c>0 --> -(C1Aang3)/(C1Aang4)f(0.9)#(w*CR)@Gc(10)C1Aend_e(c-1,w*CR)
  

/*    cloud 1 B   */
  C1B(T) --> [+(55)g(4)[-(75)C1Bcurve1(1)]][-(40)g(4)[-(65)C1Bcurve1(1)]][+(145)g(4.5)[-(70)C1Bcurve1(1)]][-(130)g(4)[-(60)C1Bcurve1(1)]][-(115)g(5)[-(120)C1Bcurve3(1)]][+(155)g(5)milt-tail(T,T)]
  C1Bcurve1(s) --> @#(4)#(C1BWid1)@Gr(1)@Gt(1.0)@GsC1Bcurve2(s)
  C1Bcurve2(s) --> -(C1Bang1)/(C1Bang2)C1BLine1(s)C1Bcurve2(s*C1BR1)
  C1Bcurve3(s) --> @#(3)#(C1BWid2)@Gr(1)@Gt(1.0)@GsC1Bcurve4(s)
  C1Bcurve4(s) --> -(C1Bang3)\(C1Bang2)C1BLine2(s)C1Bcurve4(s*C1BR2)
  

/*    cloud 2   */
  C2(T) --> [+(55)g(3)[-(55)C2curve1(1)]][+(145)g(3)[-(45)C2curve1(1)]][-(50)g(3)[-(30)C2curve1(1)]][-(225)g(3)[+(30)C2curve3(1)]][+(135)g(2.5)milt-tail(T,T)] 
  C2curve1(s) --> @#(1)#(C2Wid1)@GsC2curve2(s)
  C2curve2(s) --> -(C2ang1)/(C2ang2)C2Line1(s)C2curve2(s*C2R1)
  C2curve3(s) --> @#(1)#(C2Wid2)@GsC2curve4(s)
  C2curve4(s) --> +(18)/(C2ang4)C2Line2(s)C2curve4(s*C2R2)
  

/*    cloud 3    */
  C3(d0,db,n,T): n==0 && T!=0 --> [-(C3ang1)\(C3ang2)g(d0)][milt-tail(T,T)]
  C3(d0,db,n,T) : n>0  --> \(C3ang1)+(C3ang2)g(d0)[O(db)]C3(d0,ran(0.2)+db,n-1,T)


/*    cloud 4    */
  C41(d0,db,n,T): n>0 --> -(C4ang3)\(C4ang4)g(d0)[O(db)]C41(d0,ran(0.7)+db,n-1,T)
  C4(d0,db,n,T): n==0 --> [-(20)/(30)][|milt-tail(T,T)]
  C4(d0,db,n,T): n>0 --> +(C4ang1)\(C4ang2)g(-d0)[dO(db)]C4(ran(0.3)+d0,ran(0.3)+db,n-1,T) 
  C42(d0,db,n,T): n>0 --> -(C4ang3)\(C4ang4)g(d0)[O(db)]C42(d0,ran(0.7)+db,n-1,T)





/*    ----------------------------    TAIL   ---------------------------------   */

  milt-tail(T,t) : T==1 && t>-2 --> [#(1.3)@Gt(1)@Gs#(0.1)-(50)\(10)f(8)@Gc(60)]milt-tail(T,t-1)    /* single tail */
  milt-tail(T,t) : T>1 && t>0 --> g[tail(t+6)]milt-tail(T,t-1)                             /* multi tail */
  tail(t): t>0 --> tail_s(t)tail_e(1.5*t,WIDS)
  tail_s(t) --> #(WIDS)@Gt(1)@Gs#(WIDE)  
  tail_e(n,w) : n>0 --> -(15)\(80)f(3)#(w*WR)@Gc(80)tail_e(n-1,w*WR)
 

/*    -----  SPHERE   -----  */
  O(o) : o>0 --> @O(o+ori)
 
homomorphism 
  tail_e(n,w) : n>0  --> -(5)f(0.3)@Ge(60)@O(w)
  C1Aend_e(c,w) --> -(20)/(15)@Ge(80)@O(w)
  
  C1BLine1(s) --> g(s)#(s*C1BWid1)@Gc(5)
  C1BLine2(s) --> g(s)#(s*C1BWid2)@Gc(5)

  C2Line1(s) --> g(s)#(s*C2Wid1)@Gc(5)
  C2Line2(s) --> g(s)#(s*C2Wid2)@Gc(5)

endlsystem

/* C2(ball, cnt2): ball==cnt2 { 
	if( (ball%interval)==(interval-1) ){
		cnt2=cnt2+1; }
} --> ;(1)-(80)^(20)g(ford2)[O(ball_s)]C2(ball+1,cnt2+1)
C2(ball,cnt2): ball>=cnt2 --> C2(ball,cnt2+1) */
