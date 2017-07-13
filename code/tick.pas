uses math;
const   fi='tick.inp';
        fo='tick.out';
        maxn=2000;
var     t,r:array[1..maxn] of longint;
        f:array[0..maxn] of int64;
        n,dem:longint;
        leave:array[1..maxn] of boolean;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do read(t[i]);
                        for i:= 1 to n do read(r[i]);
                        close(input);
                end;
        procedure truyhoi;
        var i:longint;
                begin
                        fillchar(leave,sizeof(leave),false);
                        f[0]:=0;
                        f[1]:=t[1];
                        for i:= 2 to n do
                                begin
                                        f[i]:=min(f[i-2]+r[i-1],f[i-1]+t[i]);
                                        if (f[i]=f[i-2]+r[i-1]) and (not leave[i-1]) then
                                                begin
                                                        inc(dem);
                                                        leave[i]:=true;
                                                end;
                                end;
                end;
        procedure xuat;
        var     i:longint;
                begin
                        assign(output,fo); rewrite(output);
                        writeln(f[n]);
                        if dem=0 then writeln(dem) else
                        for i:= 1 to n do
                                if leave[i] then write(i,' ');
                        close(output);
                end;

begin
        docfile;
        truyhoi;
        xuat;
end.