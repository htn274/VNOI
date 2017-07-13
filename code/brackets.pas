const   fi='brackets.inp';
        fo='brackets.out';
        maxn=trunc(1e5);
var     a:array[1..maxn] of longint;
        s:ansistring;
        n:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do
                                read(a[i]);
                        close(input);
                end;

        procedure xuli;
        var     i,j,k:longint;
                x,y:ansistring;
                begin
                        i:=1;
                        while i<=n do
                                begin
                                        j:=i;
                                        x:='';
                                        y:='';
                                        while (a[j]<>0) and (j<=n) do
                                                begin
                                                        x:=x+'(';
                                                        y:=y+')';
                                                        inc(j);
                                                end;
                                        x:=x+'(';
                                        y:=y+')';
                                        s:=s+x+y;
                                        i:=j+1;
                                end;
                end;

begin
        docfile;
        xuli;
        assign(output,fo); rewrite(output);
        writeln(s);
        close(output);
end.
