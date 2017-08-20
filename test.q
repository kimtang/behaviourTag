


\d .t

e:{[x] r:"\n"vs x; .bt.action[`.test.add]`uid`message`comp`arg!("G"$;::;parse;get)@'r; }
t:1!enlist`uid`message`comp`arg`result`btime`etime!(0ng;"  ";::;0b;0b;0np;0np)

\d .


.bt.add[`;`.test.add]{[uid;message;comp;arg]
  .t.t:.t.t,1!enlist`uid`message`comp`arg`result`btime`etime!(uid;message;comp;arg;0b;0np;0np);
  (enlist`uid)!(enlist uid) 
 }

.bt.add[`.test.add;`.test.execute]{[uid] u:`.t.t uid;u0:uid; bt:.z.P;r:u[`comp] u`arg; et:.z.P; update result:r,btime:bt,etime:et from `.t.t where uid=u0; }

.bt.add[`;`.test.printresult]{n:count select from .t.t where not result,not null uid;t:`int$`second$sum exec etime - btime from .t.t where not null uid;show .bt.printf1 $[n=0;("No Errors after %1 tests and %0 seconds without error";t;-1 + count .t.t);("Errors after %2 tests and %0 seconds with %1 errors";t;n;-1 + count .t.t)];}