const   fi='LP.inp';
        fo='LP.out';
        maxn=trunc(1e5);
var     a,c:array[0..2*maxn] of longint;
        check:array[1..maxn] of boolean;
        vt,trace,res:array[0..maxn] of longint;
        d1,d:array[0..maxn] of int64;
        n,dem,m:longint;
        procedure docfile;
        var     u,v,cost,i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n);
                        for i:= 1 to n-1 do
                                begin
                                        readln(u,v);
                                        inc(d[u]);
                                        inc(d[v]);
                                end;
                        vt[1]:=1;
                        vt[n+1]:=2*n;
                        for i:= 2 to n do
                                vt[i]:=vt[i-1]+d[i-1];
                        reset(input);
                        readln;
                        for i:= 1 to n-1 do
                                begin
                                        readln(u,v,cost);
                                        a[vt[u]]:=v;
                                        a[vt[v]]:=u;
                                        c[vt[u]]:=cost;
                                        c[vt[v]]:=cost;
                                        inc(vt[u]);
                                        inc(vt[v]);
                                end;
                        for i:= n downto 1 do
                                vt[i+1]:=vt[i];
                        vt[1]:=1;
                        close(input);
                end;

        procedure dfs1(u:longint);
        var     v:longint;
                begin
                        check[u]:=false;
                        for v:=vt[u] to vt[u+1]-1 do
                                if check[a[v]] then
                                        begin
                                               if d1[a[v]]<d1[u]+c[v] then
                                               d1[a[v]]:=d1[u]+c[v];
                                                dfs1(a[v]);
                                        end;
                end;

        procedure dfs2(u:longint);
        var     v:longint;
                begin
                        check[u]:=false;
                        for v:= vt[u] to vt[u+1]-1 do
                                if check[a[v]] then
                                        begin
                                                if d1[a[v]]<d1[u]+c[v] then
                                                begin
                                                        d1[a[v]]:=d1[u]+c[v];
                                                        trace[a[v]]:=u;
                                                end;
                                                dfs2(a[v]);
                                        end;
                end;

        procedure thuchien;
        var     i,s,t:longint;
                max:int64;
                begin
                        fillchar(check,sizeof(check),true);
                        fillchar(trace,sizeof(trace),0);
                        fillchar(d1,sizeof(d1),$FF);
                        d1[1]:=0;
                        dfs1(1);
                        max:=-high(int64);
                        for i:= 1 to n do
                                if max<d1[i] then
                                        begin
                                                max:=d1[i];
                                                s:=i;
                                        end;
                        fillchar(d1,sizeof(d1),$FF);
                        fillchar(check,sizeof(check),true);
                        d1[s]:=0;
                        dfs2(s);
                        max:=-high(int64);
                        for i:= 1 to n do
                                if max<d1[i] then
                                        begin
                                                max:=d1[i];
                                                t:=i;
                                        end;
                        inc(dem);
                        res[dem]:=t;
                        while t<>s do
                                begin
                                        t:=trace[t];
                                        inc(dem);
                                        res[dem]:=t;
                                end;
                        assign(output,fo); rewrite(output);
                        writeln(max);
                        for i:= 1 to dem do write(res[i],' ');
                        close(output);
                end;

begin
        docfile;
        thuchien;
end.
