const   fi='seq.inp';
        fo='seq.out';
        maxn=trunc(1e5);
var     a,vt,t:array[1..maxn] of int64;
        n,res1,res2:longint; k:int64;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n,k);
                        for i:=1 to n do
                        begin
                                read(a[i]);
                                t[i]:=a[i]-k;
                                vt[i]:=i;
                        end;
                        close(input);
                end;

        procedure swap(var x,y:int64);
        var z:int64;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j:longint;x:int64;
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
                                                swap(vt[i],vt[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        function bst(x,l,r:longint):longint;
        var     mid:longint;
                begin
                      while l<=r do
                        begin
                                mid:=(l+r) div 2;
                                if a[mid]=x then exit(vt[mid]);
                                if a[mid]<x then l:=mid+1 else r:=mid-1;
                        end;
                      exit(-1);
                end;

        procedure xuli;
        var     i,j:longint;
                begin
                        sort(1,n);
                        res1:=0;
                        res2:=0;
                        for i:= 1 to n  do
                                begin
                                        j:=BST(t[i],1,n);
                                        if (i<>j) and (j<>-1) then
                                                begin
                                                        res1:=i;
                                                        res2:=j;
                                                        exit;
                                                end;
                                end;
                end;

begin
        docfile;
        xuli;
        assign(output,fo);
        rewrite(output);
        writeln(res1,' ',res2);
        close(output);
end.
