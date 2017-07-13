const   fi='Clique.inp';
        fo='Clique.out';
        maxn=200;
var     a:array[1..maxn,1..maxn] of boolean;
        n,max,m,dem:longint;
        chon:array[1..maxn] of longint;
        procedure docfile;
        var     i,u,v:longint;
                begin
                        assign(input,fi); reset(input);
                        fillchar(a,sizeof(a),false);
                        readln(n,m);
                        for i:=1 to m do
                                begin
                                        read(u,v);
                                        a[u,v]:=true;
                                        a[v,u]:=true;
                                end;
                        close(input);
                end;

        procedure check;
        var i,j:longint;
        begin
                for i:= 2 to dem do
                        for j:=i+1 to dem do
                                if (not a[chon[i],chon[j]]) then dec(dem);
        end;

        procedure thuchien;
        var     i,j:longint;
                begin
                        max:=0;
                        for i:= 1 to n do
                        begin
                                dem:=1;
                                chon[dem]:=i;
                        for j:= 1 to n do
                        if a[i,j] then
                                begin
                                        inc(dem);
                                        chon[dem]:=j;
                                end;
                        check;
                        if dem>max then max:=dem;
                        end;
                end;

begin
        docfile;
        thuchien;
        assign(output,fo); rewrite(output);
        writeln(max);
        close(output);
end.
