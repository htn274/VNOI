uses math;
const   fi='minroad.inp';
        fo='minroad.out';
        maxres=1000000000;
        maxn=300005;
type    tree=record
        d,k:longint;
end;

var     t:array[1..maxn] of tree;
        tung,truc:array[0..maxn] of longint;
        n,a,b:longint;

        procedure swap(var x,y:tree);
        var z:tree;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var x:longint; i,j:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=t[(i+j) div 2].d;
                        repeat
                                while x>t[i].d do inc(i);
                                while x<t[j].d do dec(j);
                                if i<=j then
                                        begin
                                                swap(t[i],t[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        function BST(l,r:longint):longint;
        var     i,j,mid,kq,kq1:longint;
                begin
                        kq1:=maxres;
                        if (tung[r]-tung[l-1]>=a) and (truc[r]-truc[l-1]>=b) then kq1:=t[r].d-t[l].d;
                        kq:=-1;
                        i:=l;
                        j:=r;
                        while i<=j do
                                begin
                                        mid:=(i+j) div 2;
                                        if (tung[r]-tung[mid-1]>=a) and (truc[r]-truc[mid-1]>=b) then
                                                begin
                                                        kq:=mid;
                                                        i:=mid+1;
                                                end else j:=mid-1;
                                end;
                        if kq=-1 then exit(maxres);
                        exit(min(kq1,t[r].d-t[kq].d));
                end;

        procedure xuly;
        var     res,i:longint;
                begin
                        res:=maxres;
                        tung[0]:=0;
                        truc[0]:=0;
                        for i:= 1 to n do
                                begin
                                        tung[i]:=tung[i-1];
                                        truc[i]:=truc[i-1];
                                        if (t[i].k=1) then inc(tung[i]) else inc(truc[i]);
                                        res:=min(res,BST(1,i));
                                end;
                        assign(output,fo);
                        rewrite(output);
                        if res=maxres then writeln(-1) else writeln(res);
                        close(output);
                end;

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n,a,b);
                        for i:= 1 to n do
                                readln(t[i].d,t[i].k);
                        close(input);
                end;
begin
        docfile;
        sort(1,n);
        xuly;
end.