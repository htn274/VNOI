TYPE    Tedge = record
                u,v,c : longint;
                chon  : boolean;
        end;

CONST   fi = 'MST.inp';
        fo = 'MST.out';
        maxn = trunc(1e5);
        maxm = trunc(1e5);

VAR     n,m : longint;
        e   : array[1..maxm]of Tedge;
        lab : array[1..maxn]of longint;
        res : int64;

PROCEDURE nhap;
 var    i,j : longint;
 begin
        assign(input,fi);
        reset(input);
        readln(n,m);
        for i := 1 to m do
                with e[i] do begin
                        readln(u,v,c);
                        chon := false;
                end;
        close(input);

        assign(output,fo);
        rewrite(output);
        for i := 1 to n do lab[i] := -1;
 end;

PROCEDURE sort(l,r : longint);
 var    i,j,x : longint;
        tmp   : Tedge;
 begin
        i := l;
        j := r;
        x := e[l+random(r-l)].c;
        repeat
                while e[i].c < x do inc(i);
                while e[j].c > x do dec(j);
                if i <= j then begin
                        tmp  := e[i];
                        e[i] := e[j];
                        e[j] := tmp;
                        inc(i);
                        dec(j);
                end;
        until i > j;
        if l < j then sort(l,j);
        if i < r then sort(i,r);
 end;

FUNCTION get(q : longint) : longint;
 begin
        while lab[q] > 0 do q := lab[q];
        exit(q);
 end;

PROCEDURE hop(u,v : longint);
 var    x : longint;
 begin
        x := lab[u] + lab[v];
        if lab[u] < lab[v] then begin
                lab[v] := u;
                lab[u] := x;
        end else begin
                if lab[u] = lab[v] then dec(lab[v]);
                lab[u] := v;
                lab[v] := x;
        end;
 end;

PROCEDURE check(var e : Tedge);
 var    r,s : longint;
 begin
        with e do begin
                r := get(u);
                s := get(v);
                if r <> s then begin
                        hop(r,s);
                        chon := true;
                end;
        end;
 end;

PROCEDURE kruskal;
 var    i,j : longint;
 begin
        sort(1,m);
        res := 0;
        for i := 1 to m do begin
                check(e[i]);
                if e[i].chon then
                       res := res+ e[i].c;
        end;
        writeln(res);
        close(output);
 end;

BEGIN
        nhap;
        kruskal;
END.

