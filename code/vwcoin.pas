uses math;
const   fi='vwcoin.inp';
        fo='vwcoin.out';
        maxn=20;
        maxv=150;
        maxw=150;
        oo=5*trunc(1e5);
var     gt,tl,res,b:array[1..maxn] of longint;
        f,t:array[0..maxn,0..maxv,0..maxw] of longint;
        n,v,w,dem:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,v,w);
                        for i:= 1 to n do
                                readln(gt[i],tl[i]);
                        close(input);
                end;

        procedure truyhoi;
        var     i,j,k,sl,slmax,mins:longint;
                begin
                        fillchar(t,sizeof(t),0);
                        for i:= 1 to n do
                        for j:= 1 to v do
                        for k:= 1 to w do
                        f[i,j,k]:=oo;
                        for j:=1 to v do
                        if j mod gt[1]=0 then
                        begin
                                for k:= 1 to w do
                                        if k mod tl[1]=0 then
                                        begin
                                        f[1,j,k]:=min(j div gt[1],k div tl[1]);
                                        t[1,j,k]:=f[1,j,k];
                                        end;
                        end;
                        for i:= 2 to n do
                        for j:= 1 to v do
                                begin
                                for k:= 1 to w do
                                        begin
                                                slmax:=min(j div gt[i],k div tl[i]);
                                                mins:=oo;
                                                for sl:=0 to slmax do
                                                if (j-sl*gt[i]>0) and (k-sl*tl[i]>0) then
                                                        if f[i-1,j-sl*gt[i],k-sl*tl[i]]+sl<mins then
                                                        begin
                                                                mins:=f[i-1,j-sl*gt[i],k-sl*tl[i]]+sl;
                                                                t[i,j,k]:=sl;
                                                        end;
                                                if mins=oo then f[i,j,k]:=f[i-1,j,k] else
                                                f[i,j,k]:=mins;
                                        end;
                                 end;
                end;

        procedure truyvet;
        var     j,i:longint;
                begin
                         if f[n,v,w]=oo then writeln(-1) else
                         begin
                                writeln(f[n,v,w]);
                                while (v>0) and (w>0) do
                                begin
                                              while (n>0) and (f[n,v,w]=f[n-1,v,w]) do
                                                                                dec(n);
                                              begin
                                                        for j:= 1 to t[n,v,w] do
                                                                begin
                                                                        inc(dem);
                                                                        res[dem]:=n;
                                                                end;
                                                        v:=v-gt[n];
                                                        w:=w-tl[n];
                                              end;
                                end;
                         end;
                        for i:= dem downto 1do
                               writeln(res[i]);
                end;


begin
        docfile;
        truyhoi;
        assign(output,fo); rewrite(output);
        truyvet;
        close(output);
end.



