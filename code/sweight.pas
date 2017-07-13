uses math;
const   fi='Sweight.inp';
        fo='sweight.out';
        maxn=2*trunc(1e5);
var     a,f,g:array[1..maxn] of longint;
        n,res:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:=1 to n do read(a[i]);
                        close(input);
                end;


        procedure Xuli;
        var     i,j:longint;
                begin
                        f[1]:=1;
                        for i:= 2 to n do
                                if a[i]>a[i-1] then f[i]:=f[i-1]+1 else f[i]:=1;
                        g[n]:=1;
                        for i:= n-1 downto 1 do
                                if a[i]<a[i+1] then g[i]:=g[i+1]+1 else g[i]:=1;
                                res:=0;
                        for i:= n downto 1 do
                        for j:= i-1 downto 1 do
                                if a[j]<a[i] then
                                        res:=max(res,f[j]+g[i]);

                end;

begin
        docfile;
        Xuli;
        assign(output,fo); rewrite(output);
        writeln(res);
        close(output);
end.
