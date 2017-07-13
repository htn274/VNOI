const   fi='doanroi.inp';
        fo='doanroi.out';
        maxn=1000;
var     a,b,trace,vt,res:array[1..maxn] of longint;
        n,max:longint;
        procedure swap(var a,b:longint);
        var c:longint;
                begin
                        c:=a; a:=b; b:=c;
                end;

        procedure sort(l,r:longint);
        var i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=a[(i+j) div 2];
                        repeat
                                while a[i]<x do inc(i);
                                while a[j]>x do dec(j);
                                if i<=j then
                                        begin
                                                swap(a[i],a[j]);
                                                swap(b[i],b[j]);
                                                swap(vt[i],vt[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n);
                        for i:= 1 to n do
                                begin
                                        readln(a[i],b[i]);
                                        vt[i]:=i;
                                end;
                        close(input);
                end;

        procedure xuli;
        var     i,j,luu:longint;
                begin
                        sort(1,n);
                        for i:= 1 to n do
                                begin
                                        res[i]:=1;
                                        trace[i]:=0;
                                end;
                        for i:= n-1 downto 1 do
                        for j:= i+1 to n do
                                if (a[j]>b[i]) and (res[i]<res[j]+1) then
                                        begin
                                                res[i]:=res[j]+1;
                                                trace[i]:=j;
                                        end;
                        max:=0;
                        for i:= 1 to n do  if res[i]>max then
                                begin
                                        max:=res[i];
                                        luu:=i;
                                end;
                         writeln(max);
                        while luu<>0 do
                                begin
                                        writeln(vt[luu]);
                                        luu:=trace[luu];
                                end;
                end;

        begin
                docfile;
                assign(output,fo);
                rewrite(output);
                xuli;
                close(output);
        end.