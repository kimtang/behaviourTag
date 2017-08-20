
args:.Q.def[`name`port!("name";8888);].Q.opt .z.x

/ remove this line when using in production
/ name:localhost:8888::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 8888"; } @[hopen;`:localhost:8888;0];

\l bt.q


.bt.add[`;`a]{[a] `a set a; enlist[`at]!enlist 5}
.bt.add[`a;`b]{[b] `b set b; enlist[`bt]!enlist 5.1}
.bt.add[`a;`c]{[c] '`c;`c set c; }
.bt.add[`b;`d]{[d] `d set d; enlist[`dt]!enlist 5.3}
.bt.add[`d;`e]{[e] `e set e; enlist[`et]!enlist 5.4}
.bt.add[`d;`f]{[f] `f set f; enlist[`ft]!enlist 5.5}
.bt.add[`c;`g]{[g] `g set g; enlist[`gt]!enlist 5.6}



.bt.addIff[`a]{[a] a = 1}
.bt.addIff[`b]{[b] b = 2}
.bt.addIff[`c]{[c] c = 3}
.bt.addIff[`d]{[d] d = 4}
.bt.addIff[`e]{[e] e = 5}
.bt.addIff[`f]{[f] f = 10}
.bt.addIff[`g]{[g] g = 7}


.bt.addDelay[`b]{ `tipe`time!(`in;00:00:03) }

.bt.behaviours
.bt.repository

obj:`a`b`c`d`e`f`g!1+til 7

(::)r:.bt.action[`a]obj

.bt.history
