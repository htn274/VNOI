const   fi='ipara.inp';
        fo='ipara.out';
        maxn=50;
var     x:array[0..maxn] of integer;
        dem:longint;
        n:integer;
        procedure xuat(n:longint);
        var     i:longint;
                begin
                        for i:= 1 to n-1 do
                                begin
                                        write(x[i],' ');
                                end;
                        writeln;
                end;

        procedure try(i:longint;t:integer);
        var     j:longint;
                begin
                        if t=0 then
                                begin
                                        inc(dem);
                                        xuat(i);
                                        exit;
                                end;
                        for j:= 1 to t do
                               if j>=x[i-1] then
                                        begin
                                                x[i]:=j;
                                                try(i+1,t-x[i]);
                                                x[i]:=0;
                                        end;
                end;

begin
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(n);
        x[0]:=0;
        dem:=0;
        try(1,n);
        writeln(dem);
        close(input);
        close(output);
end.
