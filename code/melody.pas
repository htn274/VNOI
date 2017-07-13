const   fi='melody.inp';
        fo='melody.out';
        maxn=5*trunc(1e5);
var     n,m,l:longint;
        a,b:array[1..maxn] of longint;

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m,l);
                        for i:= 1 to n do
                                read(a[i]);
                        for i:= 1 to m do
                                read(b[i]);
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
                        x:=a[(i+j) div 2];
                        repeat
                                while x<a[i] do inc(i);
                                while x>a[j] do dec(j);
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


        procedure xuli;
        var     i,j:longint;
                begin
                        for i:= 1 to m do
                                begin
                                        sort(1,n);
                                        j:=1;
                                        while a[j]>b[i] do inc(j);
                                        if a[j]<=b[i] then
                                        begin
                                        l:=l-b[i]+a[j];
                                        if l<0 then break;
                                        a[j]:=b[i];
                                        end else break;
                                end;
                        if l<=0 then
                        writeln(i-1) else writeln(i);
                end;

begin
docfile;
xuli;
end.