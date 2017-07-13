const   fi='dijkstra.inp';
        fo='dijkstra.out';
        maxn=trunc(1e5);
        maxm=2*maxn;
var     a,w:array[1..maxm+1] of longint;
        pos,deg,trace,heap,posh:array[1..maxn] of longint;
        free:array[1..maxn] of boolean;
        d:array[1..maxn] of int64;
        n,m,nheap:longint;
        procedure docfile;
        var     i,u,v,wi:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m);
                        for i:= 1 to m do
                                begin
                                        readln(u,v,wi);
                                        inc(deg[u]);
                                end;
                        pos[n]:=m+1;
                        pos[1]:=1;
                        for i:= 2 to n do
                                pos[i]:=pos[i-1]+deg[i-1];
                        reset(input);
                        readln;
                        for i:= 1 to m do
                                begin
                                        readln(u,v,wi);
                                        a[pos[u]]:=v;
                                        w[pos[u]]:=wi;
                                        inc(pos[u]);
                                end;
                        for i:= n downto 1 do
                                pos[i+1]:=pos[i];
                        pos[1]:=1;
                        close(input);
                        nheap:=0;
                end;

        procedure update(v:longint);
        var     con,cha:longint;
                begin
                        con:=posh[v];
                        if con=0 then
                                begin
                                        inc(nheap);
                                        con:=nheap;
                                end;
                        cha:=con div 2;
                        while (cha>0) and (d[heap[cha]]>d[v]) do
                                begin
                                        heap[con]:=heap[cha];
                                        posh[heap[con]]:=con;
                                        con:=cha;
                                        cha:=con div 2;
                                end;
                        heap[con]:=v;
                        posh[v]:=con;
                end;

        function pop:longint;
        var     r,c,v:longint;
                begin
                        pop:=heap[1];
                        v:=heap[nheap];
                        dec(nheap);
                        r:=1;
                        while 2*r<=nheap do
                                begin
                                        c:=r*2;
                                        if (c<nheap) and (d[heap[c+1]]<d[heap[c]]) then inc(c);
                                        if d[v]<=d[heap[c]] then break;
                                        heap[r]:=heap[c];
                                        posh[heap[r]]:=r;
                                        r:=c;
                                end;
                        heap[r]:=v;
                        posh[v]:=r;
                end;

        procedure dijkstra;
        var     i,u,v,k:longint;min:int64;
                begin
                        for i:= 1 to n do
                                begin
                                        d[i]:=trunc(1e18)+1;
                                        free[i]:=true;
                                end;
                        d[1]:=0;
                        update(1);
                      for k:= 1 to n do
                      begin
                                u:=pop;
                                if (u=0) or (u=n) then exit;
                                free[u]:=false;
                                for v:=pos[u] to pos[u+1]-1 do
                                                if  (d[a[v]]>d[u]+w[v]) then
                                                        begin
                                                                d[a[v]]:=d[u]+w[v];
                                                                trace[a[v]]:=u;
                                                                update(a[v]);
                                                        end;
                        end;
                end;

        procedure xuat;
                begin
                        assign(output,fo); rewrite(output);
                        if d[n]=trunc(1e18)+1 then writeln(-1) else writeln(d[n]);
                        close(output);
                end;

begin
        docfile;
        dijkstra;
        xuat;
end.





