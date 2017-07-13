Const   fi      ='ARRAY.inp';
        fo      ='ARRAY.out';
        maxn    =trunc(1e5);
var     a       :array[1..maxn] of longint;
        t       :array[0..maxn] of int64;
        n,nTest :longint;

Procedure Enter();
var     i:longint;
begin
        readln(n);
        for i:= 1 to n do read(a[i]);
        t[0]:=0;
        for i:= 1 to n do t[i]:=t[i-1]+a[i];
end;

Function Check():boolean;
var     l,r,mid:longint;
begin
        l:=1; r:=n;
        while l<=r do
        begin
                mid:=(l+r) div 2;
                if t[mid-1]=t[n]-t[mid] then exit(true);
                if t[mid-1]<t[n]-t[mid] then l:=mid+1 else r:=mid-1;
        end;
        exit(false);
end;

BEGIN
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(nTest);
        while nTest>0 do
        begin
                Enter;
                if Check then writeln('YES') else writeln('NO');
                dec(nTest);
        end;
        close(input); close(output);
END.