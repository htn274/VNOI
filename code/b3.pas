const   fi='MSchool.inp';
        fo='MSchool.out';
        maxn=trunc(1e4);
        maxm=trunc(1e5);
        maxC=6*trunc(1e5)+1;
type    canh=record
        x,y,w1,w2,link,trace:longint;
end;
        mang=array[0..maxn] of longint;
var     e:array[1..maxm] of canh;
        head,last,heap,pos:array[0..maxn] of longint;
        w:array[0..maxn,0..maxn,1..2] of longint;
        m,n,k,t,ii,nheap:longint;
        best:longint;
        d3,d1,d2:array[0..maxn] of longint;
        procedure add(u,v,c1,c2:longint);
                begin
                        inc(ii);
                        with e[ii] do
                                begin
                                        x:=u;
                                        y:=v;
                                        w1:=c1;
                                        w2:=c2;
                                        link:=head[x];
                                        //trace:=last[y];
                                        head[x]:=ii;
                                        //last[y]:=ii;
                                end;
                end;

        procedure docfile;
        var     i,u,v,c1,c2:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m,k);
                        ii:=0;
                        for i:= 1 to m do
                                begin
                                        readln(u,v,c1,c2);
                                        add(u,v,c1,c2);
                                        w[u,v,1]:=c1;
                                        w[u,v,2]:=c2;
                                end;
                        close(input);
                end;

        procedure update(v:longint; d:mang);
        var cha,con:longint;
                begin
                        con:=pos[v];
                        if con=0 then
                                begin
                                        inc(nheap);
                                        con:=nheap;
                                end;
                        cha:=con div 2;
                        while (cha>0) and (d[heap[cha]]>d[v]) do
                                begin
                                        heap[con]:=heap[cha];
                                        pos[heap[con]]:=con;
                                        con:=cha;
                                        cha:=con div 2;
                                end;
                        heap[con]:=v;
                        pos[v]:=con;
                end;

        function pop(d:mang):longint;
        var cha,con,v:longint;
                begin
                        pop:=heap[1];
                        v:=heap[nheap];
                        dec(nheap);
                        cha:=1;
                        while (2*cha<=n) do
                                begin
                                        con:=2*cha;
                                        if (con<nheap) and (d[heap[con]]>d[heap[con+1]]) then inc(con);
                                        if d[heap[con]]>=d[v] then break;
                                        heap[cha]:=heap[con];
                                        pos[heap[cha]]:=cha;
                                        cha:=con;
                                end;
                        heap[cha]:=v;
                        pos[v]:=cha;
                end;

        procedure Tunha;
        var     u,i,v:longint;
                begin
                        fillchar(pos,sizeof(pos),0);
                        fillchar(heap,sizeof(heap),0);
                        nheap:=0;
                        for i:= 1 to n do
                                d1[i]:=maxC;
                        d1[1]:=0;
                        update(1,d1);
                        repeat
                                u:=pop(d1);
                                if u=0 then break;
                                i:=head[u];
                                while i<>0 do
                                        begin
                                                v:=e[i].y;
                                                if d1[v]>d1[u]+e[i].w2 then
                                                        begin
                                                                d1[v]:=d1[u]+e[i].w2;
                                                                update(v,d1);
                                                        end;
                                                i:=e[i].link;
                                        end;
                        until nheap=0;
                end;

        procedure dentruong;
        var i:longint;
        function dijsktra(s,f:longint):longint;
        var     i,u,v:longint;
                d:array[0..maxn] of  longint;
                begin
                        fillchar(pos,sizeof(pos),0);
                        fillchar(heap,sizeof(heap),0);
                        nheap:=0;
                        for i:= 1 to n do
                                d[i]:=maxC;
                        d[s]:=0;
                        update(s,d);
                        repeat
                                v:=pop(d);
                                if v=0 then break;
                                i:=head[v];
                                while i<>0 do
                                        begin
                                                u:=e[i].y;
                                                if d[u]>d[v]+e[i].w1 then
                                                        begin
                                                                d[u]:=d[v]+e[i].w1;
                                                                update(u,d);
                                                        end;
                                                i:=e[i].link;
                                        end;
                        until nheap=0;
                        exit(d[k]);
                end;
        begin
                for i:= 1 to n do
                        d2[i]:=dijsktra(i,k);
        end;

        procedure dencoquan;
        var i:longint;
        function dijsktra(s,f:longint):longint;
        var     i,u,v:longint;
                d:array[0..maxn] of longint;
                begin
                        fillchar(pos,sizeof(pos),0);
                        fillchar(heap,sizeof(heap),0);
                        nheap:=0;
                        for i:= 1 to n do
                                d[i]:=maxC;
                        d[s]:=0;
                        update(s,d);
                        repeat
                                v:=pop(d);
                                if v=0 then break;
                                i:=head[v];
                                while i<>0 do
                                        begin
                                                u:=e[i].y;
                                                if d[u]>d[v]+e[i].w2 then
                                                        begin
                                                                d[u]:=d[v]+e[i].w2;
                                                                update(u,d3);
                                                        end;
                                                i:=e[i].link;
                                        end;
                        until nheap=0;
                        exit(d[n]);
                end;
        begin
                for i:= 1 to n do
                        d3[i]:=dijsktra(i,n);
        end;

        procedure thuchien;
        var     i:longint;
                begin
                        tunha;
                        dentruong;
                        dencoquan;
                        best:=maxC;
                        for i:= 1 to n do
                                if (d1[i]+d2[i]<60) and (best>d1[i]+d3[i]) then
                                        best:=d1[i]+d3[i];
                end;

begin
        docfile;
        thuchien;
        assign(output,fo); rewrite(output);
        writeln(best);
        close(output);
end.
