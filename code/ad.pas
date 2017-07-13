uses math;
const   fi='ad.inp';
        fo='ad.out';
        maxn=1000000;
var     f,p:array['a'..'z'] of longint;
        n,m,res:longint;
        a,b:ansistring;
        procedure xauchung;
        var     i:longint;j:char;
                begin
                        n:=length(a);
                        m:=length(b);
                        for i:= 1 to n do
                                inc(f[a[i]]);
                        for i:= 1 to m do
                                inc(p[b[i]]);
                        for j:='a' to 'z' do
                            res:=res+max(f[j],p[j])-min(f[j],p[j])

                end;

begin
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(a);
        readln(b);
        xauchung;
        writeln(res);
        close(input);
        close(output);
end.
