const   fi='Wedding.inp';
        fo='Wedding.out';
        maxn=2010;
var     a:array[0..2*maxn+1,0..2*maxn+1] of boolean;
        cir:array[0..maxn*2+1] of longint;
        n:longint;

        procedure docfile;
        var     i,j,d,k:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        n:=2*n;
                        fillchar(a,sizeof(a),true);
                        for i:= 1 to n do
                                begin
                                        read(d);
                                        for k:= 1 to d do
                                                begin
                                                        read(j);
                                                        a[i,j]:=false;
                                                        a[j,i]:=False;
                                                end;
                                        cir[i]:=i;
                                end;
                        cir[0]:=n;
                        cir[n+1]:=1;
                        close(input);
                end;

        function find(u,k:longint):longint;
        var     v:longint;
                begin
                        for v:= u to n do
                                if (a[cir[v],cir[k]]) and (a[cir[v+1],cir[k+1]]) then
                                        exit(v);
                        for v:= 1 to n do
                                if (a[cir[v],cir[k]]) and (a[cir[v+1],cir[k+1]]) then
                                        exit(v);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure change(first,last:longint);
        var     i,sl,j:longint;
                begin
                        for i:= 0 to (last-first+1) div 2-1 do
                                swap(cir[first+i],cir[last-i]);
                end;

        procedure thuchien;
        var     i,x,y,k:longint;
                begin
                       for i:= 1 to n do
                        begin
                                x:=cir[i];
                                y:=cir[i+1];
                                if (not a[x,y]) then
                                        begin
                                                k:=find(i+2,i);
                                                if k>i then
                                                        change(i+1,k) else
                                                        begin
                                                                change(k+1,i);
                                                        end;
                                        end;
                        end;
                end;

        procedure xuatfile;
        var     i:longint;
                begin
                        assign(output,fo);
                        rewrite(output);
                        for i:= 1 to n do
                                write(cir[i],' ');
                        close(output);
                end;

begin
docfile;
thuchien;
xuatfile;
end.




