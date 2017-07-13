const   fi='intervals.inp';
        fo='intervals.out';
        maxn=trunc(1e5);
var     a,b:array[1..maxn] of longint;
        n,res:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do
                                readln(a[i],b[i]);
                        close(input);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var     i,j,x:longint;
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
                        if j<l then sort(j,l);
                end;

       procedure thuchien;
       var
                begin



begin
        docfile;
        thuchien;
        assign(output,fo); rewrite(output); writeln(res); close(output);
end.
