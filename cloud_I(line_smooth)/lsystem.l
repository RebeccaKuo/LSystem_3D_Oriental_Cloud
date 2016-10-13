#define ball_s 0.35
#define tail_s 0.35
#define ang1 80
#define ang2 15
#define dAng 5
#define Ct 0

#define interval 6
#define STEPS 100
#define ford 2
#define ford2 0.3
#define ori 0.02

#define WIDS  0.3
#define WIDE  0.001
#define WR 0.85
#define MAXNO 5 

Lsystem: 1
Define: {array len[MAXNO] = {0.8,0.6,0.4,0.3,0.2};}
derivation length: STEPS

Axiom: Cloud1(1,0,1,1)

Cloud1(str1,T,num,recr) --> SYM(str1,T,num,recr,str1)
Cloud2(str1,T,num,recr,str2): recr>0 --> SYM(str1,T,num,recr,str2)
Cloud3(str1,T,num,recr,str2,str3): recr>0 --> SYM(str1,T,num,recr,str2)g;(9)SYM(str2,T,num,recr,str3)

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==1 --> [C(num,T)gSYM(type2,T,num,Cnt-1,type1)]                    /* 1 single cloud */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==2 --> [+(90)g(ford)[C(num,T)];(6)SYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[C(num,T)]SYM(type2,T,num,Cnt-1,type1)]    /* 2  180 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==3 --> [g(ford)[C(num,T)]gSYM(type2,T,num,Cnt-1,t)]
							[+(120)g(ford)[C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]
							[-(120)g(ford)[C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]  /* 3  120 degree  */

SYM(type1,T,num,Cnt,type2) : Cnt>0 && type1==4 --> [g(ford)[C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]
							[+(90)g(ford)[C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]
							[|g(ford)[C(num,T)];(5)gSYM(type2,T,num,Cnt-1,type1)]
							[-(90)g(ford)[C(num,T)]gSYM(type2,T,num,Cnt-1,type1)]   /* 4  90 degree   */

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


/*    cloud 1    */
  C(num,T) : num==1 --> C1(0.2,0.1,60,T)
  C(num,T) : num==2 --> [^(60)[\(60)C2(0.2,0.05,80,T)]]
/*  C(num,T) : num==3 --> C3(5,0.2,0.2,15,T)  */
  C(num,T) : num==3 --> [+(90)g(3)[-(150)C1(0.2,0.05,50,0)]][F(0.1)][^(110)g[&(110)g(-0.15)C3(0.1,0.1,60,T)]][-(90)g(3)[C1(0.2,0.05,50,0)]] 
  

/* C2(ball, cnt2): ball==cnt2 { 
	if( (ball%interval)==(interval-1) ){
		cnt2=cnt2+1; }
} --> ;(1)-(80)^(20)g(ford2)[O(ball_s)]C2(ball+1,cnt2+1)
C2(ball,cnt2): ball>=cnt2 --> C2(ball,cnt2+1) */

C1(d0,db,n,T): n==0 --> ^(60)g(0.1)[milt-tail(T,T)]
C1(d0,db,n,T): n>0 --> ;(1)-(10)\(2)#F(db)C1(d0,ran(0.03)+db,n-1,T)

C2(d0,db,n,T): n==0 && T!=0 --> [-(ang1)\(ang2)g(d0)[O(db)]][milt-tail(T,T)]
C2(d0,db,n,T) : n>0  --> ;(1);(1)\(7.5)+(10)#F(db)C2(d0,ran(0.01)+db,n-1,T)

/* C3(ang,d0,db,n,T): n>0 --> -(ang1-ang)\(ang2)g(d0)[O(db)]C3(ang,d0,ran(0.06)+db,n-1,T) */

C3(d0,db,n,T): n==0 --> [-(20)/(30)g(d0)][milt-tail(T,T)]
C3(d0,db,n,T): n>0 --> ;(5)+(7.25)\(0.66)#F(-db)C3(ran(0.03)+d0,ran(0.01)+db,n-1,T) 

/*    tail       */
 milt-tail(T,t) : T==1 && t>-2 --> [#(0.3)@Gt(1)@Gs#(0.01)+(30)/(20)f(-3)@Gc(60)]milt-tail(T,t-1)      /* single tail */
 milt-tail(T,t) : T>1 && t>0 --> g(0.1)[tail(t+6)]milt-tail(T,t-1)       /* multi tail */
 
 tail(t): t>0 --> tail_s(t)tail_e(4*t,WIDS)
 tail_s(t) --> #(WIDS)@Gt(1)@Gs#(WIDE)  
 tail_e(n,w) : n>0 --> +(7)/(5)f(len[n])#(w*WR)@Gc(80)tail_e(n-1,w*WR)
 

/*     sphere     */
 O(o) : o>0 --> @O(o+ori)
 dO(o) : o>0 --> @O(o-ori)
 iO(o) : o>0 --> @O(o)
 
 rotate(ang) --> +(ang+dAng)
 
homomorphism 
  tail_e(n,w) : n>0  --> +(5)f(0.3)@Ge(60)@O(w) 

endlsystem

