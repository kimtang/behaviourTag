args:.Q.def[`name`port!("newTest.q";12345);].Q.opt .z.x

/ remove this line when using in production
/ newTest.q:localhost:12345::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 12345"; } @[hopen;`:localhost:12345;0];

\l ../bt.q

.bt.noTesting:0b;

"Testing bt"

obj:(`$/: .Q.a)!1+til count .Q.a

.bt.add[`;`a]{[a] `a set a;}
.bt.addTest[`a;`testa]{a = obj`a}

.bt.add[`a;`b]{[b] `b set b;}
.bt.addTest[`b;`testb]{b = obj`b}


.bt.addDelay[`c]{`tipe`time!(`in;00:00:00)}
.bt.add[`a;`c]{[c] `c set c;}
.bt.addTest[`c;`testc]{c = obj`c}

.bt.add[`b;`d]{[d] '`d;`d set d;}
.bt.addTestCatchError[`d;`testd]{0b}


.bt.addIff[`e]{0b}
.bt.add[`b;`e]{[e] `e set e;}
.bt.addTestNoAction[`e;`teste]{0b}

.bt.add[`d;`f]{[f] `f set f;}
.bt.addTestNoAction[`f;`testf]{f = obj`f}

.bt.add[`f;`g]{[g] `g set g;}
.bt.addTestNoAction[`g;`testg]{g = obj`g}

.bt.add[`f;`h]{[h] `h set h;}
.bt.addTestNoAction[`h;`testh]{h = obj`h}

.bt.add[`f;`i]{[i] `i set i;}
.bt.addTestNoAction[`i;`testi]{i = obj`i}

.bt.add[`e;`j]{[j] `j set j;}
.bt.addTestNoAction[`j;`testj]{j = obj`j}

.bt.add[`c;`k]{[k] `k set k;}
.bt.addTest[`k;`testk]{k = obj`k}

.bt.add[`c;`l]{[l] `l set l;}
.bt.addTest[`l;`testl]{l = obj`l}

.bt.addCatch[`m]`.bt.omit_error
.bt.add[`a;`m]{[m] '`m;`m set m;}
.bt.addTestCatchError[`d;`catchm]{()~key `m}
.bt.addTest[`m;`testm]{()~key `m }


.bt.add[`m;`n]{[n] `n set n;}
.bt.addTest[`n;`testn]{n = obj`n }

.bt.testAction[`a]obj;