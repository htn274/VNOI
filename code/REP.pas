const   fi='REP.inp';
        fo='REP.out';
        maxn=100000;
var     a,b,x:array[1..maxn] of longint;
        n,k:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n);
                        for i:= 1 to n do
                                readln(a[i],b[i]);
                        close(input);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; X:=y; y:=z;
                end;


        procedure sort(l,r:longint);
        var i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=b[i+random(j-i)];
                        repeat
                                while b[i]<x do inc(i);
                                while b[j]>x do dec(j);
                                if i<=j then
                                        begin
                                                swap(a[i],a[j]);
                                                swap(b[i],b[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        function tinh(i:longint):byte;
                begin
                       if x[k]<a[i] then exit(0) else
                       if x[k-1]<a[i] then exit(1) else exit(2);
                end;

        procedure xuli;
        var     d,i:longint;
                begin
                        sort(1,n);
                        x[1]:=b[1]-1;
                        x[2]:=b[1];
                        k:=2;
                        for i:= 2 to n do
                                begin
                                        d:=tinh(i);
                                        if d=0 then
                                                begin
                                                        inc(k,2);
                                                        x[k-1]:=b[i]-1;
                                                        x[k]:=b[i];
                                                end else
                                        if d=1 then
                                                begin
                                                        inc(k);
                                                        x[k]:=b[i];
                                                end;
                                end;
                end;

        procedure xuat;
        var i:longint;
                begin
                        assign(output,fo);
                        rewrite(output);
                        writeln(k);
                        for i:= 1 to k do write(x[i],' ');
                        close(output);
                end;

begin
docfile;
xuli;
xuat;
end.