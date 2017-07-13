const   fi='courses.inp';
        fo='courses.out';
        maxn=trunc(1e5);
var     a:array[1..maxn] of string;
        dd:array[1..maxn] of boolean;
        test,n,res:longint;

        procedure swap(var x,y:string);
        var z:string;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j:longint; x:string;
                begin
                        i:=l;
                        j:=r;
                        x:=a[i+random(j-i)];
                        repeat
                                while a[i]<x do inc(i);
                                while a[j]>x do dec(j);
                                if i<=j then
                                        begin
                                                swap(a[i],a[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do readln(a[i]);
                        close(input);
                        sort(1,n);
                end;

        procedure xuli;
        var     i,vt1,vt2:longint;x,y:string;
                begin
                        res:=1;
                        for i:= 2 to n do
                                if pos(a[i-1],a[i])<>1 then inc(res);
                end;


begin
        docfile;
        xuli;
        assign(output,fo); rewrite(output);
        writeln(res);
        close(output);
end.