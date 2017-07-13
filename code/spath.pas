const   fi='Spath.inp';
        fo='Spath.out';
        maxn=1000;
var     a:array[0..maxn+1,0..maxn+1] of longint;
        d:array[1..maxn] of int64;
        m,n,count:longint;
        sum:int64;
        am:boolean;
        procedure docfile;
        var     i,u,v,w,j:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m);
                        for i:= 1 to n do
                        for j:= 1 to n do
                                if i=j then a[i,j]:=0 else
                                a[i,j]:=trunc(1e9)+1;
                        for i:= 1 to m do
                        begin
                                readln(u,v,a[u,v]);
                                if a[u,v]<0 then sum:=sum+a[u,v];
                        end;
                        for i:= 1 to n do
                                d[i]:=trunc(1e15)+1;
                        close(input);
                end;

        procedure FordBellman;
        var     u,v:longint;stop:boolean;
                begin
                        count:=0;
                        am:=false;
                        d[1]:=0;
                      repeat
                        stop:=true;
                        inc(count);
                        if count=n+1 then
                                begin
                                        am:=true;
                                        exit;
                                end;
                        for u:= 1 to n do
                        for v:= 1 to n do
                                if a[u,v]<>trunc(1e9)+1 then
                                        if d[v]>d[u]+a[u,v] then
                                                begin
                                                        d[v]:=d[u]+a[u,v];
                                                        if d[v]<sum then
                                                                begin
                                                                        am:=true;
                                                                        exit;
                                                                end;
                                                        stop:=false;
                                                end;
                        until stop;
                end;

        procedure xuat;
                begin
                        assign(output,fo); rewrite(output);
                        thuchien;
                        if am=true then writeln('NC') else
                        if d[n]=trunc(1e15)+1 then writeln('NP') else
                        writeln(d[n]);
                        close(output);
                end;



begin
        docfile;
        xuat;
end.
