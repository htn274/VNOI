const   fi      ='AVG.inp';
        fo      ='AVG.out';
        maxn    =1000;
var     a,b,vt  :array[1..maxn] of longint;
        n,nTest :longint;

Procedure Enter;
var     i:longint;
begin
        readln(n);
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        fillchar(vt,sizeof(vt),0);
        for i:= 1 to n do
                begin
                        read(a[i]);
                        b[i]:=a[i];
                        vt[i]:=i;
                end;
end;

Procedure Swap(var x,y:longint);
var     z:longint;
begin
        z:=x; x:=y; y:=z;
end;

Procedure Sort(l,r:longint);
var i,j,x,y:longint;
begin
        i:=l;
        j:=r;
        x:=b[(i+j) div 2];
        y:=vt[(i+j) div 2];
        repeat
                while (b[i]<x) or ((b[i]=x) and (vt[i]<y)) do inc(i);
                while (x<b[j]) or ((b[j]=x) and (y<vt[j])) do dec(j);
                if i<=j then
                begin
                        swap(b[i],b[j]);
                        swap(vt[i],vt[j]);
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then sort(i,r);
        if l<j then sort(l,j);
end;

Function FindLeft(x,dau,cuoi:longint):longint;
var     l,r,mid,res:longint;
begin
        l:=1; r:=n;
        res:=0;
        while l<=r do
        begin
                mid:=(l+r) div 2;
                if (b[mid]>x) or ((b[mid]=x) and (vt[mid]>dau)) then
                begin
                        if (b[mid]=x) and (vt[mid]>dau) then res:=mid;
                        r:=mid-1;
                end else l:=mid+1;
        end;
        exit(res);
end;


Function FindRIght(x,dau,cuoi:longint):longint;
var l,r,mid,res:longint;
begin
        l:=1; r:=n;
        res:=0;
        while l<=r do
        begin
                mid:=(l+r) div 2;
                if (b[mid]<x) or ((b[mid]=x) and (vt[mid]<cuoi)) then
                begin
                        if (b[mid]=x) and (vt[mid]<cuoi) then res:=mid;
                        l:=mid+1;
                end else r:=mid-1;
        end;
        exit(res);
end;

Procedure Process;
var     i,j,ak,l,r:longint;res:int64;
begin
        Sort(1,n);
        res:=0;
       For i:= 1 to n-2 do
                for j:=i+2 to n do
                if (a[i]+a[j]) mod 2=0 then
                begin
                        ak:=(a[i]+a[j]) div 2;
                        l:=FindLeft(ak,i,j);
                        r:=FindRight(ak,i,j);
                        if (l<>0) and (r<>0) then res:=res+r-l+1;
                end;
        writeln(res);
end;

BEGIN
assign(input,fi); reset(input);
assign(output,fo); rewrite(output);
readln(nTest);
while nTest>0 do
begin
        Enter;
        Process;
        dec(nTest);
end;
close(input); close(output);
END.