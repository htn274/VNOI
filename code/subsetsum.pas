const   fi='subsetsum.inp';
        fo='subsetsum.out';
        maxn=100;
        maxm=trunc(1e5);
var     l:array[0..maxn,0..maxm] of boolean;
        a,res:array[0..maxn] of longint;
        m,n,dem:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m);
                        for i:= 1 to n do
                                read(a[i]);
                        close(input);
                end;

        procedure truyhoi;
        var     i,j:longint;
                begin
                        fillchar(l,sizeof(l),false);
                        for i:= 0 to n do
                                l[i,0]:=true;
                        for i:= 1 to n do
                        for j:= 1 to m do
                                l[i,j]:=l[i-1,j] or l[i-1,j-a[i]];
                end;

        procedure truyvet;
        var i:longint;
                begin
                        assign(output,fo); rewrite(output);
                        if not l[n,m] then writeln('NO') else
                        begin
                                writeln('YES');
                                while (n>0) do
                                        begin
                                                if l[n,m]=l[n-1,m] then dec(n) else
                                                begin
                                                        inc(dem);
                                                        res[dem]:=n;
                                                        m:=m-a[n];
                                                        n:=n-1;
                                                end;
                                        end;
                                for i:= dem  downto 1 do write(res[i],' ');
                        end;
                        close(output);
                end;

begin
        docfile;
        truyhoi;
        truyvet;
end.
