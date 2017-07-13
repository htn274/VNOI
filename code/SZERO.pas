const   fi='SZERO.inp';
        fo='SZERO.out';
        maxn=100000;
var     a,t,vt:array[0..maxn] of longint;
        n,res1,res2:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n);
                        for i:= 1 to n do
                        begin
                                read(a[i]);
                                vt[i]:=i;
                        end;
                        close(input);
                end;

        procedure swap(var x,y:longint);
        var     z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=t[(i+j) div 2];
                        repeat
                                while t[i]<x do inc(i);
                                while t[j]>x do dec(j);
                                if i<=j then
                                        begin
                                                swap(t[i],t[j]);
                                                swap(vt[i],vt[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure xuli;
        var     i,j,k,max,min,res:longint;
                begin
                        t[0]:=0;
                        vt[0]:=0;
                        for i:=1 to n do t[i]:=t[i-1]+a[i];
                        sort(0,n);
                        i:=0;res:=0;
                        while i<=n do
                             begin
                                        j:=i+1;
                                        min:=vt[i];
                                        max:=vt[i];
                                        while (j<=n) and (t[i]=t[j]) do
                                        begin
                                             if min>vt[j] then min:=vt[j];
                                             if max<vt[j] then max:=vt[j];
                                             if max-min>res then
                                                begin
                                                        res:=max-min;
                                                        res1:=min;
                                                        res2:=max;
                                                end;
                                             inc(j);
                                        end;
                                        i:=j;
                             end;
                end;
begin
        docfile;
        xuli;
        assign(output,fo);
        rewrite(output);
        writeln(res1+1,' ',res2);
        close(output);
end.
