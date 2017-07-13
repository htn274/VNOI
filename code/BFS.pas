const   FI='BFS.inp';
        fo='BFS.out';
        maxn=trunc(1e5);
        maxm=trunc(1e6);
var     a:array[1..2*maxm] of longint;
        pos,d,trace,res,queue:array[1..maxn+1] of longint;
        check:array[1..maxn] of boolean;
        n,m,s,t:longint;
        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=a[i+random(j-i)];
                        repeat
                                while a[i]<x do inc(i);
                                while a[j]>x do dec(j);
                                if i<=j then
                                        begin
                                                swap(a[i],a[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;
        procedure docfile;
        var     i,u,v:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m,s,t);
                        for i:= 1 to m do
                                begin
                                        readln(u,v);
                                        inc(d[u]);
                                end;
                        pos[n+1]:=m+1;
                        pos[1]:=1;
                        for i:= 2 to n+1 do
                                pos[i]:=pos[i-1]+d[i-1];
                        reset(input);
                        readln;
                        for i:= 1 to m do
                                begin
                                        readln(u,v);
                                        a[pos[u]]:=v;
                                        inc(pos[u]);
                                end;
                         for i:= n downto 1 do
                                pos[i+1]:=pos[i];
                        pos[1]:=1;
                        for i:= 1 to n do
                                sort(pos[i],pos[i+1]-1);
                        close(input);
                end;

        procedure bFS(s:longint);
        var     v,front,rear,u:longint;
                begin
                       front:=1;
                       rear:=1;
                       trace[s]:=-1;
                       queue[rear]:=s;
                       while front<=rear do
                        begin
                             u:=queue[front];
                             inc(front);
                             for v:=pos[u] to pos[u+1]-1 do
                                 if check[a[v]] then
                                        begin
                                                inc(rear);
                                                queue[rear]:=a[v];
                                                check[a[v]]:=false;
                                                trace[a[v]]:=u;
                                        end;
                        end;
                end;

        procedure xuli;
        var     i,count:longint;
                begin
                        fillchar(check,sizeof(check),true);
                        fillchar(trace,sizeof(trace),0);
                        bfs(s);
                        assign(output,fo);
                        rewrite(output);
                        count:=1;
                        res[count]:=t;
                        while t<>s do
                                begin
                                        t:=trace[t];
                                        inc(count);
                                        res[count]:=t;
                                end;
                        for i:= count downto 1 do write(res[i],' ');
                        close(output);
                end;
begin
        docfile;
        xuli;
end.
