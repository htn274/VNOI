const   fi='delnum.inp';
        fo='delnum.out';
        maxn=trunc(1e5);
var     a,stack:array[1..maxn+1] of longint;
        n,top:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do read(a[i]);
                        close(input);
                end;

        procedure xuli;
        var     i:longint;
                begin
                        top:=1;
                        stack[top]:=a[1];
                        for i:=2 to n do
                                if (a[i]>=stack[top]) or (a[i]>=a[i+1]) then
                                        begin
                                                inc(top);
                                                stack[top]:=a[i];
                                        end;
                end;

begin
        docfile;
        xuli;
        assign(output,fo); rewrite(output);
        writeln(top);
        close(output);
end.
