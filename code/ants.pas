const   fi      ='ANTS.inp';
        fo      ='ANTS.out';
var
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,k);
                        for i:= 1 to n do
                                read(x[i]);
                        for i:= 1 to n do
                                read(a[i]);
                        close(input);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j,m:longint;
                begin
                        i:=l;
                        j:=r;
                        m:=x[i+random(j-i)];
                        repeat
                                while m>x[i] do inc(i);
                                while m<x[j] do dec(j);
                                if i<=j then
                                        begin
                                                swap(x[i],x[j]);
                                                swap(a[i],a[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure thuchien;
        var
                begin
                        sort(1,n);


