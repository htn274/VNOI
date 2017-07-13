const   fi='hprime.inp';
        fo='hprime.out';
        maxn=trunc(1e6);
var     prime:array[1..maxn+1] of boolean;
        res:array[1..maxn] of longint;
        n,h,dem:longint;
        procedure sangnguyento;
        var     i,j:longint;
                begin
                        fillchar(prime,sizeof(prime),true);
                        prime[1]:=false;
                        i:=2;
                        while i<=n+1 do
                                begin
                                        j:=i+i;
                                        while (j<=n+1) do
                                                begin
                                                        prime[j]:=false;
                                                        j:=j+i
                                                end;
                                                inc(i);
                                        while (prime[i]=false) and (i<=n+1) do inc(i);
                                        if i>n then exit;
                                end;
                end;

        function kt(x:longint):boolean;
        var     s,du:longint;
                begin
                        s:=0;
                        while x>=1 do
                        begin
                                du:=x mod 10;
                                x:=x div 10;
                                s:=s+du;
                                if s>h then exit(false);
                        end;
                        if s=h then exit(true);
                        exit(false);
                end;

        procedure thuchien;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        assign(output,fo); rewrite(output);
                        readln(n,h);
                        sangnguyento;
                        for i:= 2 to n do
                                if prime[i] then
                                        if kt(i) then
                                                begin
                                                        inc(dem);
                                                        res[dem]:=i;
                                                end;
                        writeln(dem);
                        for i:= 1 to dem do
                                writeln(res[i]);
                        close(input);
                        close(output);
                end;

begin
        thuchien;
end.
