const   fi='BERTRAN.inp';
        fo='BERTRAN.out';
        limit=2*trunc(1e7);
var     kt:array[1..limit] of boolean;
        n:longint;
        procedure sangnguyento;
        var     i,j:longint;
                begin
                        fillchar(kt,sizeof(kt),true);
                        kt[1]:=false;
                        i:=2;
                        while i<=limit do
                                begin
                                        j:=i+i;
                                        while j<=limit do
                                                begin
                                                        kt[j]:=false;
                                                        j:=j+i;
                                                end;
                                        inc(i);
                                        while (not kt[i])  and (i<=limit) do inc(i);
                                        if i>limit then exit;
                                end;
                end;
        function dem(n:longint):longint;
        var i:longint;
                begin
                        dem:=0;
                        for i:= n+1 to 2*n-1 do
                                if kt[i] then inc(dem);
                end;

        procedure xuli;
                begin
                        assign(input,fi); reset(input);
                        assign(output,fo); rewrite(output);
                        while not eof(input) do
                                begin
                                        readln(n);
                                        writeln(dem(n));
                                end;
                        close(input); close(output);
                end;

begin
        sangnguyento;
        xuli;
end.

