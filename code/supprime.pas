const   fi='supprime.inp';
        fo='supprime.out';
        limit=100000;
var     p:array[1..limit] of longint;
        kt:array[1..limit] of boolean;
        res:array[1..500] of longint;
        k,dem,d,n:longint;
        procedure sangnguyento;
        var     i,j:longint;
                begin
                        fillchar(kt,sizeof(kt),true);
                        kt[1]:=false;
                        i:=2;
                        while i<=limit do
                                begin
                                        inc(dem);
                                        p[dem]:=i;
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

        procedure thuchien;
        var     i:longint;
                begin
                        for i:=1  to dem do
                                if kt[i] then
                                        begin
                                                inc(k);
                                                if k>500 then exit else
                                                res[k]:=p[i];
                                        end;
                end;

begin
        sangnguyento;
        thuchien;
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(n);
        writeln(res[n]);
        close(input);
        close(output);
end.


