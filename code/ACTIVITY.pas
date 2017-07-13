const   fi='ACTIVITY.inp';
        fo='AVTIVITY.out';
        maxn=trunc(1E6);
var     s,f,vt,res:array[1..maxn] of longint;
        n,k,i:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n);
                        for i:= 1 to n do
                        begin
                                readln(s[i],f[i]);
                                vt[i]:=i;
                        end;
                        close(input);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=f[i+random(j-i)];
                        repeat
                                while f[i]<x do inc(i);
                                while f[j]>x do dec(j);
                                if i<=j then
                                        begin
                                                swap(s[i],s[j]);
                                                swap(f[i],f[j]);
                                                swap(vt[i],vt[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure xuli;
        var     i,r:longint;
                begin
                        sort(1,n);
                        k:=1;
                        res[1]:=vt[1];
                        r:=f[1];
                        for i:= 2 to n do
                                    if r<=s[i] then
                                        begin
                                                inc(k); res[k]:=vt[i];r:=f[i];
                                        end;
                end;

begin
        docfile;
        xuli;
        assign(output,fo);
        rewrite(output);
        writeln(k);
        for i:= 1 to k do writeln(res[i],' ');
        close(output);
end.



