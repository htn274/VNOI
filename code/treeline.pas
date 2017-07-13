const   fi='Treeline.inp';
        fo='Treeline.out';
        maxn=trunc(1e5);
var     a,pre:array[1..maxn] of longint;
        del:array[1..maxn] of boolean;
        res,dem,n:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        pre[1]:=0;
                        dem:=0;
                        for i:= 1 to n do
                                begin
                                        read(a[i]);
                                        if i>1 then
                                                begin
                                                        pre[i]:=a[i-1];
                                                        if pre[i]>=a[i] then inc(dem);
                                                end;
                                end;
                        close(input);
                end;

        procedure thuchien;
        var     i,j,k:longint;
                begin
                        res:=0;
                        fillchar(del,sizeof(del),false);
                        del[1]:=true;
                        i:=1;
                        repeat
                                j:=1;
                                while (del[i]) and (i<=n) do inc(i);
                                k:=i;
                                while j<=n do
                                        begin
                                                while (k<=n) and (not del[k]) and (pre[k]>=a[k]) do
                                                        begin
                                                                del[k]:=true;
                                                                inc(k);
                                                                dec(dem);
                                                        end;
                                                if k<>j+1 then
                                                pre[k]:=a[j];
                                                if (pre[k]>=a[k]) and (not del[k]) and (k<=n) then inc(dem);
                                                if not del[k] then
                                                j:=k;
                                                inc(k);
                                        end;
                                inc(res);
                        until (dem=0) or (i>n);
                end;

begin
docfile;
assign(output,fo); rewrite(output);
if dem=0 then writeln(0) else
begin
thuchien;
writeln(res);
end;
end.





