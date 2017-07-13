const   fi='discovery.inp';
        fo='discovery.out';
        maxn=1000;
        st: string='SNWE';
type    graph=record
        x,y:longint;
end;
var     hx:array[1..4] of integer=(1,-1,0,0);
        hy:array[1..4] of integer=(0,0,1,-1);
        lastx,lasty:longint;
        queuex,queuey:array[-maxn..maxn] of longint;
        a:array[-maxn..maxn,-maxn..maxn] of boolean;
        d:array[-maxn..maxn,-maxn..maxn] of longint;
        trace:array[-maxn..maxn,-maxn..maxn] of graph;
        s,res:ansistring;
        procedure khoitao;
        var     i,x,y:longint;
                begin
                        fillchar(d,sizeof(d),0);
                        fillchar(a,sizeof(a),false);
                        x:=0;
                        y:=0;
                        a[x,y]:=true;
                        for i:= 1 to length(s) do
                        begin
                            k:=pos(s[i],st);
                            x:=x+hx[k];
                            y:=y+hy[k];
                        End;
                        lastx:=x;
                        lasty:=y;
                end;

        procedure BFS(u,v:longint);
        var     front,rear,ox,oy,i,x,y:longint;
                begin
                        front:=1; rear:=1;
                        queuex[1]:=u;
                        queuey[1]:=v;
                        while front<=rear do
                                begin
                                        x:=queuex[front];
                                        y:=queuey[front];
                                        inc(front);
                                        for i:= 1 to 4 do
                                                begin
                                                        ox:=x+hx[i];
                                                        oy:=y+hy[i];
                                                        if a[ox,oy]=true then
                                                        if d[ox,oy]=0 then
                                                                begin
                                                                        inc(rear);
                                                                        queuex[rear]:=ox;
                                                                        queuey[rear]:=oy;
                                                                        d[ox,oy]:=d[x,y]+1;
                                                                end;
                                                end;
                                end;
                        d[0,0]:=0;
                end;

        function biendoi(i,j:longint):char;
        begin
                if (i=0) then
                        if j=1 then exit('E') else exit('W');
                if (j=0) then
                        if i=1 then exit('S') else exit('N');
        end;

        procedure xuli;
        var     i,j,x,y:longint;
                begin
                        res:='';
                       while (lastx<>0) or (lasty<>0) do
                        begin
                                for i:= 1 to 4 do
                                        begin
                                                x:=lastx+hx[i];
                                                y:=lasty+hy[i];
                                                if d[x,y]=d[lastx,lasty]-1 then
                                                        begin
                                                                lastx:=x;
                                                                lasty:=y;
                                                                res:=res+biendoi(hx[i],hy[i]);
                                                                break;
                                                        end;
                                        end;
                        end;
                        writeln(res);

                end;

begin
        assign(input,fi); reset(input); readln(s); close(input);
        khoitao;
        bfs(0,0);
        xuli;
end.




