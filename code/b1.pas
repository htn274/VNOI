uses math;
const   fi='b1.inp';
        fo='b1.out';
        maxn=trunc(1e6);
        maxc=27*trunc(1e5);
var     n,nmax,res:longint;
        a:array[0..maxn+1] of longint;
        d,c:array[0..maxc+1] of longint;
        mark:array[0..maxn] of boolean;

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do
                                begin
                                        read(a[i]);
                                        if (a[i]>maxn) or (a[i]<0) then a[i]:=0;
                                end;
                        a[n+1]:=0;
                        mark[0]:=true;
                        nmax:=0;
                        for i:= 1 to n do
                                if (nmax<a[i]) then nmax:=a[i];
                        close(input);
                end;

        procedure add(val,tt:longint);
                procedure visit(k,l,r:longint);
                var mid:longint;
                begin
                        repeat
                                inc(c[k]);
                                d[k]:=tt;
                                if l=r then exit;
                                mid:=(l+r) div 2;
                                k:=k shl 1;
                                if (l<=val) and (val<=mid) then r:=mid else
                                begin
                                        inc(k);
                                        l:=mid+1;
                                end;
                        until false;
                end;
        begin
                mark[val]:=true;
                visit(1,1,nmax);
        end;

        function not_cover:longint;
                procedure visit(k,l,r:longint);
                var mid:longint;
                        begin
                                repeat
                                        if c[k]=0 then
                                                begin
                                                        not_cover:=l; exit;
                                                end;
                                                mid:=(l+r) shr 1;
                                                k:=k shl 1;
                                                if c[k]<mid-l then r:=mid else
                                                begin
                                                        inc(k);
                                                        l:=mid+1;
                                                end;
                                until false;
                        end;
                begin
                        if c[1]<nmax then visit(1,1,nmax) else not_cover:=nmax+1;
                end;

        function xa(val:longint):longint;
        var vt:longint;
                procedure visit(k,l,r:longint);
                var mid:longint;
                        begin
                                if r<=val then
                                        begin
                                                if d[k]>vt then vt:=d[k];
                                                exit;
                                        end;
                                mid:=(l+r) div 2;
                                if l<=val then visit(k shl 1,l,mid);
                                if mid<val then visit(k shl 1+1, mid+1,r);
                        end;
                begin
                        vt:=0;
                        visit(1,1,nmax);
                        exit(vt);
                end;

        procedure push_out(val:longint);
        procedure visit(k,l,r:longint);
        var mid:longint;
                begin
                        dec(c[k]);
                        if l=r then
                                begin
                                        d[k]:=0;
                                        exit;
                                end;
                        mid:=(l+r) shr 1;
                        if (l<=val) and (val<=mid) then visit(k shl 1,l,mid) else
                                visit(k shl 1 +1,mid+1,r);
                        d[k]:=max(d[k shl 1],d[k shl 1+1]);
                end;
        begin
                mark[val]:=false;
                visit(1,1,nmax);
        end;


        procedure main;
        var     ht,i,gh,val,vt:longint;
                begin
                        ht:=0;
                        res:=0;
                        for i:= 1 to n do
                                begin
                                        if (i+res>n) or (res=nmax) then break;
                                        while not mark[a[ht+1]] do
                                                begin
                                                        inc(ht);
                                                        add(a[ht],ht);
                                                end;
                                        if mark[1] then
                                                begin
                                                        val:=not_cover-1;
                                                        gh:=max(a[i]-1,res);
                                                        while val>gh do
                                                                begin
                                                                        vt:=xa(val);
                                                                        if vt-i+1=val then
                                                                                begin
                                                                                        res:=val;
                                                                                        break;
                                                                                end else val:=a[vt]-1;
                                                                end;
                                                end;
                                        push_out(a[i]);
                                end;
                        writeln(res);
                end;

begin
        docfile;
        assign(output,fo); rewrite(output);
        main;
        close(output);
end.
