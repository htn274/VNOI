const   fi='bottles.inp';
        fo='bottles.out';
        maxn=trunc(1e6);
var     n,k,dem:longint;
        t:int64;
        queue,a:array[0..maxn] of longint;
        f:array[0..maxn+1] of int64;
        chose:array[0..maxn+1] of boolean;

Procedure docfile;
var i:longint;
begin
    assign(input,fi); reset(input);
    readln(n,k);
    t:=0;
    for i:= 1 to n do
    begin
        read(a[i]);
        t:=t+a[i];
    end;
    close(input);
end;

Procedure DP;
var   i,lq,rq,tmp:longint;
begin
    a[n+1]:=0;
    f[0]:=0;
    lq:=1;
    rq:=0;
    for i:= 0 to n do
    begin
        while (lq<=rq) and (f[i]<f[rq]) do dec(rq);
        inc(rq);
        queue[rq]:=i;
        while (lq<=rq) and (lq<i+1-k) do inc(lq);
        f[i+1]:=f[lq]+a[i+1];
    end;

    i:=n+1;
    fillchar(chose,sizeof(chose),true);
    dem:=0;
    while f[i]-a[i]>0 do
    begin
        chose[i]:=false;
        inc(dem);
        tmp:=f[i]-a[i];
        dec(i);
        while (i>0) and (f[i]<>tmp) do dec(i);
    end;
    chose[i]:=false;
end;

Procedure Xuat;
var i:longint;
begin
    assign(output,fo); rewrite(output);
    writeln(n-dem,' ',t-f[n+1]);
    for i:= 1 to n do
        if chose[i] then write(i,' ');
    close(output);
end;

BEGIN
docfile;
DP;
Xuat;
END.
