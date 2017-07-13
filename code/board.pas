const   fi='board.inp';
        fo='board.out';
        maxn=100;
type    cell=record
        i,j,gt:longint;
end;
var     a:array[0..maxn,0..maxn] of longint;
        w:array[1..maxn*maxn] of cell;
        n,m,dem:longint;
        procedure docfile;
        var     i,j:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(m,n);
                        dem:=0;
                        for i:= 0 to m-1 do
                        begin
                                for j:= 0 to n-1 do
                                        begin
                                                read(a[i,j]);
                                                if a[i,j]<>(i*n+j) then
                                                        begin
                                                                inc(dem);
                                                                w[dem].i:=i;
                                                                w[dem].j:=j;
                                                                w[dem].gt:=a[i,j];
                                                        end;
                                        end;
                        end;
                        close(input);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure pop(v:longint);
        begin
                w[v]:=w[dem];
                dec(dem);
        end;

        procedure xuli;
        var     i,j,hang,cot:longint;
                begin
                        i:=1;
                        while i<=dem do
                        begin
                                hang:=w[i].gt div n;
                                cot:=w[i].gt mod n;
                                for j:=i+1 to dem do
                                        if (w[j].i=hang) and (w[j].j=cot) then
                                                begin
                                                        writeln(w[i].i,' ',w[i].j,' ',w[j].i,' ',w[j].j);
                                                        swap(a[w[i].i,w[i].j],a[w[j].i,w[j].j]);
                                                        hang:=w[j].gt div n;
                                                        cot:=w[j].gt mod n;
                                                        if (w[j].i=hang) and (w[j].j=cot) then pop(j);

                                                end;
                                pop(1);
                        end;
                end;

begin
        docfile;
        assign(output,fo); rewrite(output);
        xuli;
        close(output);
end.
