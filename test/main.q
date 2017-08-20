
args:.Q.def[`name`port!("test,q";12345);].Q.opt .z.x

/ remove this line when using in production
/ test,q:localhost:12345::
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
 Test timer triggering
 ::
 min `c`k`l in key `.

t) f3f68376-f54f-480a-88e2-4ee103729f82
 event f not executed, because d throws an error
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



/

\sleep 1



t) 8b69f334-b992-1221-393f-2eed92c3bdf8
 Functions f is not executed
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
 Function e throws an error
 ::
 min `e in exec sym from .b.flows where not null error

t) 367a4e39-0ce5-4375-abed-a3218ddb8e7a
 Function i throws an error
 ::
 min `i in exec sym from .b.flows where not null error

t) 1c8213e6-975d-415e-a440-fcd1fb29ac9a
 Function j executed
 ::
 `j in key `.

t) e7fd6f89-6dee-4781-a33a-c5a66a799e47
 Variables are set
 ::
 min 1 2 3 4 5~'get@'`a`b`c`d`e

t) b5640c8b-c181-4ab7-ae8b-a26344839b99
 Variables are set
 ::
 min `b`e`g in exec sym from .b.flows where trigger = `a

t) 998635ec-351b-469a-a629-5ed3ec888741
 Check data as argument
 ::
 (d0,((enlist`n)!enlist 100)) ~ ` _ data

/

.t.t

\


t) 3cab83e2-6bcb-4ede-b56c-4bcb96da94c7
 Testing .util.printf1
 {x~"msg"}
 .b.printf1 "msg"

t) 209eb7f1-b8b7-44f0-9fa5-c7165ea96137
 Testing .b.printf1
 {x~"msg 1"}
 .b.printf1 ("msg %0";1)

t) d2dfbde4-8ffa-4a52-8152-54436e68cd2e
 Testing .b.printf1
 {x~"fmsg"}
 .b.printf1 {"fmsg"}

t) f7a7b256-3d66-4695-8bcd-45fffb884f9f
 Testing .b.printf1
 {x~enlist"a"}
 .b.printf1 "a"

t) df930efe-798c-4309-afa2-61ca0ab26586
 Testing .b.printf2
 {x~"a=a b=b c=c"}
 .b.printf2 ("a=%a% b=%b% c=%c%";`a`b`c!"abc")

t) 55077385-f584-447c-a478-731231a9cc68
 Testing .b.print
 {x~"a=a b=b c=c"}
 .b.print["a=%a% b=%b% c=%c%"]`a`b`c!"abc"

t) bf021f4c-4564-4fb2-82ec-5c330afe7310
 Testing .b.print
 {x~"msg 1 2"}
 .b.print["msg %0 %1"]1 2

.b.l "test/loadme.q";

tmp:.loadme.me

t) fb757f0c-fd6c-4040-b1b2-0bed06eae4ca
   Testing l
   ::
   3 = count .b.lt

\sleep 1

.b.l "test/loadme.q";

t) 87ef6fdd-8afe-4b5a-803a-6d03dc1bfb0c
   Testing l
   ::
   tmp ~ .loadme.me


.b.upd[`.b.init]()!();

t) 069feb57-4c03-44ca-8082-ed7a5aa46398
 Check delay trigger
 ::
 min `k in key `.

.dotz.ts.add[00:00:04 + .b.p 0;.b.upd`.t.init]()!();

/
k
.t.t

select from .b.behaviors where sym=`k

select from .b.flows where sym=`a

select from .b.flows where not null error
 where sym=`k
key .t

.t.t
