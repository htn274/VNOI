uses math;
const   fi='dayso.inp';
        fo='dayso.out';
        maxn=500;
        oo=501;
var     a,res:array[1..maxn] of longint;
        f:array[0..maxn,0..10] of longint;
        n,dem,s,k:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,k);
                        i:=1;
                        while (i<=n) and (not eof(input)) do
                                begin
                                        while not eoln(input) do
                                                begin
                                                        read(a[i]);
                                                        a[i]:=a[i] mod k;
                                                        s:=s+a[i];
                                                        inc(i);
                                                end;
                                        readln;
                                end;
                        close(input);
                end;

        function modul(a,b:longint):longint;
        var     tmp:longint;
        begin
                tmp:=(a-b) mod k;
                if tmp>0 then exit(tmp) else exit(tmp+k);
        end;

        procedure thuchien;
        var     i,t:longint;
                begin
                        for i:= 1 to k-1 do
                                f[0,i]:=oo;
                        f[0,0]:=0;
                        for i:=1 to n do
                        for t:=0 to k-1 do
                                f[i,t]:=min(f[i-1,t],f[i-1,modul(t,a[i])]+1);

                        writeln(n-f[n,s mod k]);
                        i:=n;
                        t:=s mod k;
                        while (i>0) do
                                begin
                                        if f[i,t]=f[i-1,t] then
                                                begin
                                                        inc(dem);
                                                        res[dem]:=i;
                                                end else t:=modul(t,a[i]);
                                        dec(i);
                                end;
                        for i:= dem downto 1 do write(res[i],' ');
                end;
begin
        docfile;
        assign(output,fo); rewrite(output);
        thuchien;
        close(output);
end.
