uses math;
const   fi='beas.inp';
        fo='beas.out';
var     a,f,last,g:array[0..100001] of longint;
        n,res,d,kq:longint;

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n);
                        for i:= n downto 1 do read(a[i]);
                        close(input);
                end;

        procedure tang;
        var     i,j,l,r,mid:longint;
                begin
                        res:=0;
                        f[0]:=0;
                        for i:= 1 to n do
                                begin
                                        f[i]:=0;
                                        last[i]:=0;
                                                l:=1;
                                                r:=res;
                                                while l<=r do
                                                        begin
                                                                mid:=(l+r) div 2;
                                                                if a[i]<=a[last[mid]] then r:=mid-1 else l:=mid+1;
                                                        end;
                                                if res<r+1 then res:=r+1;
                                                last[r+1]:=i;
                                                f[i]:=r+1;
                                end;
                end;

        procedure giam;
        var     i,j,l,r,mid:longint;
                begin
                        fillchar(last,sizeof(last),0);
                        res:=0;
                        g[0]:=0;
                        for i:=1 to n do
                                begin
                                        g[i]:=0;
                                        last[i]:=0;
                                                l:=1;
                                                r:=res;
                                                while l<=r do
                                                        begin
                                                                mid:=(l+r) div 2;
                                                                if a[i]<a[last[mid]] then l:=mid+1 else r:=mid-1;
                                                        end;
                                                if res<r+1 then res:=r+1;
                                                last[r+1]:=i;
                                                g[i]:=r+1;
                                end;
                end;

        procedure thuchien;
        var     i:longint;
                begin
                        kq:=0;
                        tang;
                        giam;
                        for i:= 1 to n do
                                kq:=max(kq,abs(f[i]+g[i]-1));
                end;

begin
        docfile;
        thuchien;
        assign(output,fo);
        rewrite(output);
        writeln(kq);
        close(output);
end.
