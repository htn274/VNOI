uses math;
const   fi='wires.inp';
        fo='wires.out';
        maxn=1000;
var     a,b,res:array[1..maxn] of longint;
        l:array[0..maxn,0..maxn] of longint;
        n,dem:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do
                                begin
                                        a[i]:=i;
                                        read(b[i]);
                                end;
                        close(input);
                end;

        procedure thuchien;
        var     i,j:longint;
                begin
                        for i:= 1 to n do
                        for j:= 1 to n do
                                if a[i]=b[j] then l[i,j]:=l[i-1,j-1]+1 else l[i,j]:=max(l[i-1,j],l[i,j-1]);
                end;
        procedure xuat;
        var     i,j:longint;
                begin
                        writeln(l[n,n]);
                        i:=n; j:=n;
                        while (i>0) and (j>0) do
                                begin
                                        if l[i,j]=l[i-1,j-1]+1 then
                                                begin
                                                        inc(dem);
                                                        res[dem]:=a[i];
                                                        dec(i);
                                                        dec(j);
                                                end else
                                        if l[i,j]=l[i-1,j] then dec(i) else dec(j);
                                end;
                        for i:= dem downto 1 do write(res[i],' ');
                end;
begin
        docfile;
        thuchien;
        assign(output,fo); rewrite(output);
        xuat;
        close(output);
end.