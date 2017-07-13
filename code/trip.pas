const   fi='trip.inp';
        fo='trip.out';
        maxn=trunc(1e5);
var      s,w,a:array[1..maxn] of int64;
        delta,n,m:longint;
        res:int64;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,delta);
                        for i:= 1 to n do
                                read(a[i]);
                        close(input);
                end;

        procedure swap(var x,y:int64);
        var z:int64;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var     i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=a[(i+j) div 2];
                        repeat
                                while x>a[i] do inc(i);
                                while x<a[j] do dec(j);
                                if i<=j then
                                        begin
                                                swap(a[i],a[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure thuchien;
        var i,j,k:longint;
                begin
                        sort(1,n);
                        m:=1;
                        s[m]:=a[1];
                        while s[m]<a[n] do
                                begin
                                        inc(m);
                                        s[m]:=s[m-1]+delta;
                                end;
                        i:=1;k:=1;
                        while (i<=n) or (k<=m) do
                                begin
                                        j:=i;
                                        while (a[j]<=s[k]) and (j<=n) do
                                                begin
                                                        w[j]:=s[k]-a[j];
                                                        inc(j);
                                                end;
                                        i:=j;
                                        inc(k);
                                end;
                        for i:= 1 to n do
                                res:=res+w[i];
                end;

begin
        docfile;
        thuchien;
        assign(output,fo); rewrite(output); writeln(res); closE(output);
end.
