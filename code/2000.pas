uses math;
const   fi      ='TBIKE.inp';
        fo      ='TBIKE.out';
        maxn    =2000;
var     a       :array[1..maxn] of longint;
        count,n :longint;

Procedure Docfile;
var i:longint;
begin
        assign(input,fi); reset(input);
        readln(n);
        for i:= 1 to n do read(a[i]);
        close(input);
end;

Function GCD(a,b:longint):longint;
var r:longint;
begin
        r:=b mod a;
        while r<>0 do
        begin
                r:=a mod b;
                a:=b;
                b:=r;
        end;
        exit(a);
end;

Function Check(i,j:longint):boolean;
var     Amax,Amin,ucln,t,k:longint;
begin
        Amax:=a[j];
        Amin:=a[j];
        Ucln:=abs(a[i]-a[i+1]);
        for k:= i to j-1 do
        begin
                if a[k]>Amax then Amax:=a[k];
                if a[k]<Amin then Amin:=a[k];
                ucln:=GCD(ucln,abs(a[k]-a[k+1]));
        end;
        t:=int64(ucln*(j-i));
        if t=Amax-Amin then exit(true);
        exit(false);
end;

Procedure Thuchien1;
var     i,j,vt:longint;
begin
        j:=1;
        count:=0;
        while j<=n do
        begin
                for i:= j+1 to n do
                        if check(j,i) then vt:=i;
                j:=vt+1;
                inc(count);
        end;

        writeln(count);
end;

BEGIN
Docfile;
Thuchien1;
END.
