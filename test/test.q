
args:.Q.def[`name`port!("test,q";12345);].Q.opt .z.x

/ remove this line when using in production
/ test.q:localhost:12345::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 12345"; } @[hopen;`:localhost:12345;0];

\l ../bt.q
\l ../test.q

"Testing bt"

/ 
 The bt library is a library in kdb+ for implementing finite tree machine.
 TODO: add more description
\ 


obj:(`$/: .Q.a)!1+til count .Q.a

.bt.add[`;`a]{[a] `a set a;}
.bt.add[`a;`b]{[b] `b set b;}

.bt.add[`a;`c]{[c] `c set c;}
.bt.add[`b;`d]{[d] '`d;`d set d;}
.bt.add[`b;`e]{[e] `e set e;}
.bt.add[`d;`f]{[f] `f set f;}
.bt.add[`f;`g]{[g] `g set g;}
.bt.add[`f;`h]{[h] `h set h;}
.bt.add[`f;`i]{[i] `i set i;}
.bt.add[`e;`j]{[j] `j set j;}
.bt.add[`c;`k]{[k] `k set k;}
.bt.add[`c;`l]{[l] `l set l;}
.bt.add[`a;`m]{[m] '`m;`m set m;}
.bt.add[`m;`n]{[n] `n set n;}

.bt.addIff[`e]{0b}
.bt.addDelay[`c]{`tipe`time!(`in;00:00:00)}

.bt.addCatch[`m]`.bt.omit_error

.bt.action[`a]obj;


t) 8dcac889-2271-9bbb-e875-b2c03b90b367
 Check behaviors
 ::
 min `a`b`c`d`e`f`g`h`i`j`k`l in distinct raze value exec trigger,sym from .bt.behaviours

t) 9ba21867-fb6c-3eb9-5933-02d0d9af0517
 Functions are executed
 ::
 min `a`b`n in key `.

t) 995fb324-3aec-442a-9a95-4b6b5c19591f
 Test timer triggering 1
 ::
 not min `c`k`l in key `.

.z.ts[]

t) 08231c25-71bb-4aa5-a79f-3eaa01b17fd0
 Test timer triggering 2
 ::
 min `c`k`l in key `.

t) f3f68376-f54f-480a-88e2-4ee103729f82
 Event f will not be executed, because d throws an error
 ::
 not `f in key `.


t) 8eac3bbf-d8bc-4780-9885-dbf09cfa78d4
 Functions g is not executed
 ::
 not `g in key `.


t) bdbe1a9c-9f5d-48da-8b1e-99211d9f0e34
 Functions h is not executed
 ::
 not `h in key `.


t) ebe38afa-407f-cfdf-ae7a-2c2ff77542a6
 Function d throws an error
 ::
 min `d in exec action from .bt.history where not null error

.bt.action[`.test.printresult]()!();

exit $[min 1_(0!.t.t)`result;0;1]

/


getenv `mode



