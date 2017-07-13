const   fi      ='BASEH.inp';
        fo      ='BASEH.out';
var     k,h:longint; ans:int64;

Function Tinh(k:longint):int64;
var     t:int64;
begin
        if k=1 then exit(1);
        t:=Tinh(k div 2);
        if k mod 2=0 then t:=h*t else t:=h*t+1;
        exit(t);
end;

BEGIN
assign(input,fi); reset(input);
readln(k,h);
ans:=Tinh(k);
writeln(ans);
close(input);
END.