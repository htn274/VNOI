const   fi='AZNET.inp';
        fo='AZNET.out';
        maxn=trunc(1e4);
        maxm=trunc(1e5);
var     p,a,b:array[0..maxm] of longint;
        dd:array[1..maxm] of boolean;
        x,y,ok:array[1..maxm] of longint;
        n,m,sa,sb,mina,minb,suma,sumb:longint;
        res:int64;
        function get(x:longint):longint;
        begin
                while p[x]>0 do x:=p[x];
                exit(x);
        end;

        function union(x,y:longint):boolean;
        var u,v:longint;
                begin
                        u:=get(x);
                        v:=get(y);
                        if u=v then exit(false);
                        x:=p[u]+p[v];
                        if p[u]<p[v] then
                                begin
                                        p[v]:=u;
                                        p[u]:=x;
                                end else
                                begin
                                        if p[u]=p[v] then dec(p[v]);
                                        p[u]:=v;
                                        p[v]:=x;
                                end;
                        exit(true);
                end;

        function insert(loai:longint):longint;
        var dem,i:longint;
        begin
                dem:=n-1;
                for i:= 1 to n do p[i]:=-1;
                for i:= 1 to m do
                        if (ok[i]=loai) and (union(x[i],y[i])) then dec(dem);
                exit(dem);
        end;

        procedure print;
        var     i,tmp:longint; check:boolean;
                begin
                        tmp:=insert(2);
                        for i:= 1 to m do
                                begin
                                        if sa=0 then break;
                                        if (ok[i]=1) and (union(x[i],y[i])) then
                                                begin
                                                        dec(sa);
                                                        dd[i]:=true;
                                                end;
                                end;
                        for i:= 1 to n do p[i]:=-1;
                        for i:= 1 to m do
                                if (dd[i]) then
                                        check:=union(x[i],y[i]);
                        for i:= 1 to m do
                        begin
                                if (sa=0) then break;
                                if (ok[i]=1) and (union(x[i],y[i])) then
                                        begin
                                                dec(sa);
                                                dd[i]:=true;
                                        end;
                        end;
                        for i:= 1 to m do
                                if (ok[i]=2) and (union(x[i],y[i])) then
                                        dd[i]:=true;
                        for i:= 1 to m do
                                if dd[i] then
                                        begin
                                                write(i,' ');
                                        end;
                                writeln;
                end;

        procedure docfile;
        var     i,t,test:longint;
                begin
                        assign(input,fi); reset(input);
                        assign(output,fo); rewrite(output);
                        readln(test);
                        for t:=1 to test do
                                begin
                                        readln(n,m);
                                        for i:= 1 to n-1 do read(a[i]);
                                        for i:= 1 to n-1 do read(b[i]);
                                        for i:= 1 to m do
                                        begin
                                                readln(x[i],y[i],ok[i]);
                                                dd[i]:=false;
                                        end;

                                        minA:=insert(2);
                                        minB:=insert(1);
                                        res:=-1;
                                        for sumA:=0 to n-1 do
                                                begin
                                                        sumB:=n-1-sumA;
                                                        if (suma>=mina) and (sumb>=minb) then
                                                                if (res=-1) or (res>a[suma]+b[sumb]) then
                                                                        begin
                                                                                sa:=suma;
                                                                                sb:=sumb;
                                                                                res:=a[suma]+b[sumb];
                                                                        end;
                                                end;
                                        print;
                                end;
                        close(input);
                        close(output);
                end;

begin
        docfile;
end.



