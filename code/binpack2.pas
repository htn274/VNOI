const   fi='binpack2.inp';
        fo='binpack2.out';
        maxn=100;
var     w,vt,res:array[1..100] of longint;
        n,m,k:longint;
        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=w[i+random(j-i)];
                        repeat
                                while x<w[i] do inc(i);
                                while x>w[j] do dec(j);
                                if i<=j then
                                        begin
                                                swap(w[i],w[j]);
                                                swap(vt[i],vt[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure thuchien;
        var     i,j,l1,l2:longint;
                s1,s2:longint;
                begin
                        sort(1,n);
                        for i:= 1 to k do
                                res[vt[i]]:=0;
                        s1:=0; s2:=0;
                        l1:=1; l2:=2;
                        for i:= k+1 to n do
                                if s1>s2 then
                                        begin
                                                swap(s1,s2);
                                                swap(l1,l2);
                                                inc(s1,w[i]);
                                                res[vt[i]]:=l1;
                                        end else
                                        begin
                                                inc(s1,w[i]);
                                                res[vt[i]]:=l1;
                                        end;
                        for i:= 1 to n do
                                write(res[i]);
                        writeln;
                end;


        procedure main;
        var     t,i,test:longint;
                begin
                        assign(input,fi); reset(input);
                        assign(output,fo); rewrite(output);
                        readln(test);
                        for t:= 1 to test do
                                begin
                                        readln(n,k);
                                        for i:= 1 to n do
                                                begin
                                                        read(w[i]);
                                                        vt[i]:=i;
                                                end;
                                        thuchien;
                                end;
                        close(input);close(output);
                end;

begin
        main;
end.








