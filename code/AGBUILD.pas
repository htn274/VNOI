 uses math;
 const  fi              ='';
        fo              ='';
        maxn            =1000;
        maxm            =1000;
        maxC            =high(int64);
 type   edge            =record
        u,v,c           :longint;
        end;
 var    e               :array[1..maxm] of edge;
        deg             :array[1..maxn] of longint;
        a,c             :array[1..2*maxn] of longint;
        head            :array[1..maxn] of longint;
        x,y             :array[1..maxn] of longint;
        d               :array[1..maxn] of int64;
        queue           :array[1..maxn*4] of longint;
        free            :array[1..maxn] of boolean;
        //ans             :array[1..maxn+1,1..maxn+1] of int64;
        n,q             :longint;

Procedure BFS(s:longint);
var    front,rear,u,v,i:longint;
begin
        fillchar(free,sizeof(free),false);
        for i:= 1 to n do
                d[i]:=maxC;
        d[s]:=0;
        queue[1]:=s;
        front:=1;
        rear:=1;
        while front<=rear do
        begin
                u:=queue[front];
                free[u]:=true;
                inc(front);
                for i:=head[u] to head[u+1]-1 do
                if not free[a[i]] then
                begin
                        v:=a[i];
                        d[v]:=min(d[v],d[u]+c[i]);
                        inc(rear);
                        queue[rear]:=v;
                end;
        end;

 end;

 Procedure Docfile;
 var    i,s,f:longint;
 begin
        assign(input,fi); reset(input);
        readln(n,q);
        for i:= 1 to n-1 do
        with e[i] do
        begin
                readln(u,v,c);
                inc(deg[u]);
                inc(deg[v]);
        end;

        head[1]:=1;
        for i:= 2 to n do head[i]:=head[i-1]+deg[i-1];

        for i:= 1 to n-1 do
        begin
                a[head[e[i].u]]:=e[i].v;
                a[head[e[i].v]]:=e[i].u;
                c[head[e[i].u]]:=e[i].c;
                c[head[e[i].v]]:=e[i].c;
                inc(head[e[i].v]);
                inc(head[e[i].u]);
        end;

        for i:= n downto 1 do
                head[i+1]:=head[i];
        head[1]:=1;

        for i:= 1 to q do
                begin
                        readln(s,f);
                        bfs(s);
                        writeln(D[f]);
                end;

        close(input);
 end;

BEGIN
 Docfile;
END.
