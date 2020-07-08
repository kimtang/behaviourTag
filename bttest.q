\d .bt

noTesting:1b; / we dont do test per default

tesTbl:enlist`trigger`action`mode!(enlist`;`;`)


addTest:{[testEvent;testname;testFnc]
 if[noTesting;:();];
 add[testEvent;testname;testFnc];
 `.bt.tesTbl insert  `trigger`action`mode!((),testEvent;testname;`action);
 }
addTestCatchError:{[testEvent;testname;testFnc]
 if[noTesting;:();];	
 add[testEvent;testname;testFnc];
 `.bt.tesTbl insert `trigger`action`mode!((),testEvent;testname;`catch);	
 }

addTestNoAction:{[testEvent;testname;testFnc]
 if[noTesting;:();];	
 add[testEvent;testname;testFnc];
 `.bt.tesTbl insert `trigger`action`mode!((),testEvent;testname;`no_action);	
 }  


testReport:{
	lj/[(
		  select from ungroup[.bt.tesTbl] where not null action
		 ;`trigger xkey select trigger:action,time,etime,error,result from .bt.history where  mode=`catch
		 ;`action xkey select action,time,etime,error,result from .bt.history where  mode=`behaviour 
		 )
	   ]
 }

testAction:{[sym;allData]
 if[noTesting;:();];	
 action[sym;allData];
 counter:20; / we just do 20 iteration
 while[min enlist[counter-:1;]count select from`.bt.tme where scheduleAt<=.z.P ,null runAt ;.z.ts[]];
 `testresult set testReport[];
 `errors set errors:raze(
	update mode:`action_with_error  from select from  `testresult where mode=`action,not null error
	;update mode:`action_with_wrong_result  from select from  `testresult where mode=`action,not result[;`testresult]~\:1b
	;update mode:`no_action_with_action  from select from  `testresult where mode=`no_action,not null time
	;update mode:`catch_null_error  from select from  `testresult where mode=`catch,null error);
 .bt.stdOut0[`info;`test] $[cnt:count errors;.bt.print["There are %0 errors"] cnt ;"There are no errors"];
 }



