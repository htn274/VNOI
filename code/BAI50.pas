const   fi      ='inp.inp';
        fo      ='out.out';
var     n       :longint;

Procedure Xuli;
var     first,last,n1:longint;
begin
        n1:=n;
        last:=round(sqrt(n*2));
        first:=last;
        while n>0 do
        begin
                n:=n-first;
                dec(first);
        end;
        inc(first);
        if n=0 then write(n1,'=',first,'+...+',last);
end;

BEGIN
assign(input,fi); reset(input);
assign(output,fo); rewrite(output);
readln(n);
Xuli;
close(input);
close(output);
END.
