const   fi      ='BALANCE.INP';
        fo      ='BALANCE.OUT';
        maxn    =100;
var     f       :array[0..maxn,0..5050] of int64;
        n,m     :longint;

Procedure Thuchien;
var     i,j,a:longint;
begin
        for i:= 0 to n do
                f[i,0]:=1;
        f[1,1]:=1;
        for i:= 2 to n do
                for j:= 1 to (i*(i+1)) div 2 do
                begin
                        //a:=f[i-1,abs(j-i)];
                        f[i,j]:=f[i-1,j]+f[i-1,j+i]+f[i-1,abs(j-i)];
                end;
        writeln(f[n,m]);
end;

BEGIN
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(n,m);
        if m>(n*(n+1)) div 2 then writeln(0) else
        Thuchien;
        close(input);
        close(output);
END.
