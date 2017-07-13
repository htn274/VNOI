uses math;
const   fi      ='BRO.inp';
        fo      ='BRO.out';
        maxn    =10000;
        oo      =high(int64);
var     a       :array[1..maxn] of longint;
        b       :array[1..maxn] of longint;
        t       :array[0..maxn*2] of longint;
        res     :int64;
        n       :longint;

Procedure Docfile;
var     i:longint;
begin
        assign(input,fi); reset(input);
        readln(n);
        t[0]:=0;
        for i:= 1 to n do
        begin
                readln(a[i],b[i]);
                t[i]:=t[i-1]+b[i];
        end;
        for i:=n+1 to 2*n do t[i]:=t[i-1]+b[i-n];
        close(input);
end;

Function Dis(i,j:longint):int64;
var     tmp:longint;
begin
        if i>j then
                begin
                        tmp:=i;
                        i:=j;
                        j:=tmp;
                end;
        Dis:=Min(t[j-1]-t[i-1],t[i+n-1]-t[j-1]);
end;

Procedure Thuchien;
var     cal:int64;
        i,j:longint;
begin
        res:=oo;
        for i:= 1 to n do //Chon i lam nha may
        begin
                cal:=0;
                for j:= 1 to n do
                if i<>j then
                        cal:=cal+dis(i,j)*a[j];
                if cal<res then res:=cal;
        end;
end;

BEGIN
Docfile;
Thuchien;
assign(output,fo); rewrite(output);
writeln(res);
close(output);
END.
