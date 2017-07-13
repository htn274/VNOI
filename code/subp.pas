const   fi='subp.inp';
        fo='subp.out';
var     s:ansistring;
        n,max:longint;
        a:array[1..trunc(1e5)] of longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(s);
                        n:=length(s);
                        for i:= 1 to length(s) do
                                if s[i]='(' then a[i]:=1 else a[i]:=-1;
                        close(input);
                end;

        procedure xuli;
        var     i,j,t:longint;
                begin
                        i:=1;
                        while i<=n do
                                begin
                                        j:=i+1;
                                        t:=a[i];
                                        if t>0 then
                                        while (t+a[j]>=0) and (j<=n) do
                                        begin
                                                t:=t+a[j];
                                                if t=0 then
                                                        if j-i+1>max then max:=j-i+1;
                                                inc(j);
                                        end;
                                        if t=0 then
                                                i:=j+1
                                        else inc(i);
                                end;
                        assign(output,fo); rewrite(output);
                        writeln(max);
                        close(output);
                end;
begin
        docfile;
        xuli;
end.
