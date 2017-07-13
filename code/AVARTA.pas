const   fi              ='AVARTA.inp';
        fo              ='AVARTA.out';
        maxn            =5*trunc(1e4);
type    arr             =array[1..maxn] of longint;

var     d,p,resD,resP   :arr;
        vtd,vtp         :arr;
        n,m,b,k,np,nd   :longint;

Procedure Docfile;
var     i:longint;
begin
        assign(input,fi); reset(input);
        readln(b,k,n,m);
        for i:= 1 to n do
        begin
                vtD[i]:=i;
                read(d[i]);
        end;
        for i:= 1 to m do
        begin
                vtP[i]:=i;
                read(p[i]);
        end;
        close(input);
end;

Procedure Swap(var x,y:longint);
var z:longint;
begin
        z:=x; x:=y; y:=z;
end;

Procedure Sort(var a,vt:arr;l,r:longint);
var i,j,x:longint;
begin
        i:=l;
        j:=r;
        x:=a[i+random(j-i+1)];
        repeat
                while a[i]>x do inc(i);
                while x>a[j] do dec(j);
                if i<=j then
                begin
                        swap(a[i],a[j]);
                        swap(vt[i],vt[j]);
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then sort(a,vt,i,r);
        if l<j then sort(a,vt,l,j);
end;

Procedure Thuchien;
var     i,j,h:longint;
        sumd,sump:int64;
begin
        Sort(d,vtD,1,n);
        Sort(p,vtP,1,m);
        sumd:=b;
        sump:=100;
        i:=1;
        j:=1;
        for h:= 1 to k do
        if (i<=n) and ((sumd+d[i])*sump/100>(sump+p[j])*sumd/100) then
                begin
                        inc(nD);
                        resD[nD]:=vtd[i];
                        sumd:=sumd+d[i];
                        inc(i);
                end else
        if (j<=m) and ((sump+p[j])*sumd/100>(sumd+d[i])*sump/100) then
                begin
                        inc(nP);
                        resP[nP]:=vtP[j];
                        sumP:=sumP+p[j];
                        inc(j);
                end;
end;

Procedure Print;
var     i:longint;
begin
        assign(output,fo); rewrite(output);
        writeln(nD,' ',nP);
        for i:= 1 to nD do
                write(resD[i],' ');
        writeln;
        for i:= 1 to nP do
                write(resP[i],' ');
        close(output);
end;

BEGIN
Docfile;
Thuchien;
Print;
END.