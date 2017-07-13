const   input='';
        output='';
        max=40000;
type num=record
        vt,gt:int64;
end;
var     a,b,c:array[1..2*max] of num;
        t:qword;
        f:text;
        n:longint;
        procedure docfile;
        var     i:longint;
                begin
                      assign(f,input);
                      reset(f);
                      readln(n);
                      for i:= 1 to 2*n do
                        begin
                                read(a[i].gt,b[i].gt);
                                c[i].gt:=a[i].gt-b[i].gt;
                                c[i].vt:=i;
                        end;
                        close(f);
                end;

        procedure swap(var x,y:num);
        var z:num;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var     i,j:longint;x:int64;
                begin
                        i:=l;
                        j:=r;
                        x:=c[(i+j) div 2].gt;
                        repeat
                                while c[i].gt<x do inc(i);
                                while c[j].gt>x do dec(j);
                                if i<=j then
                                        begin
                                                swap(c[i],c[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
        end;

        procedure xuly;
        var     i:longint;
                begin
                        t:=0;
                        for i:= 1 to n do
                                t:=t+a[c[i].vt].gt;
                        for i:=n+1 to 2*n do
                                t:=t+b[c[i].vt].gt;
                end;

begin
        docfile;
        sort(1,2*n);
        xuly;
        assign(f,output);
        rewrite(f);
        writeln(t);
        close(f);
end.
