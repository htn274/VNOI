const   fi='beads.inp';
        fo='beads.out';
        maxn=trunc(1e5);
var     a,g,f,last:array[0..maxn+1] of longint;
        n,max:longint;
        procedure docfile;
        var i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= n downto 1 do read(a[i]);
                        close(input);
                end;

         procedure tang;
        var     i,j,l,r,mid,res:longint;
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
        var     i,j,l,r,mid,res:longint;
                begin
                        res:=0;
                        g[0]:=0;
                        for i:= 1 to n do
                                begin
                                        g[i]:=0;
                                        last[i]:=0;
                                                l:=1;
                                                r:=res;
                                                while l<=r do
                                                        begin
                                                                mid:=(l+r) div 2;
                                                                if a[i]>=a[last[mid]] then r:=mid-1 else l:=mid+1;
                                                        end;
                                                if res<r+1 then res:=r+1;
                                                last[r+1]:=i;
                                                g[i]:=r+1;
                                end;
                end;

        procedure xuli;
        var    i:longint;
                begin
                        tang;
                        fillchar(last,sizeof(last),0);
                        giam;
                        max:=f[1]+g[1];
                        for i:= 2 to n do
                                if max<f[i]+g[i] then
                                        max:=f[i]+g[i];
                end;

begin
        docfile;
        xuli;
        assign(output,fo); rewrite(output);
        writeln(max-1);
        close(output);
end.