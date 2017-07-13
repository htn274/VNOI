const   fi='HARVEST.inp';
        fo='HARVEST.out';
        maxn=trunc(1e5);
var     a,t:array[1..maxn+2] of longint;
        n,max:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do
                                read(a[i]);
                        a[n+1]:=a[1];
                        a[n+2]:=a[2];
                        close(input);
                end;

        procedure xuli;
        var     i:longint;
                begin
                        for i:= 1 to n do
                                t[i]:=a[i]+a[i+1]+a[i+2];
                        max:=t[1];
                        for i:= 2 to n do
                                if max<t[i] then max:=t[i];
                end;

begin
        docfile;
        xuli;
        assign(output,fo); rewrite(output);
        writeln(max);
        close(output);
end.
