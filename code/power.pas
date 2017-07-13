const   fi='POWER.inp';
        fo='POWER.out';
var     cs,mu:array[1..100000] of longint;
        a,dem,res:longint;
        procedure phantich(n:longint);
        var     i,sl:longint;
                begin
                        i:=2;
                        while n>1 do
                                begin
                                     sl:=0;
                                     while n mod i=0 do
                                        begin
                                                inc(sl);
                                                n:= n div i;
                                        end;
                                     if sl>0 then
                                        begin
                                                inc(dem);
                                                mu[dem]:=sl;
                                                cs[dem]:=i;
                                        end;
                                     inc(i);
                                end;
                end;

        function check(k,res:longint):boolean;
        var     t,i:longint;
                begin
                        for i:= 1 to dem do
                                begin
                                        t:=1;
                                        while k mod cs[i]=0 do
                                        begin
                                                        inc(t);
                                                        k:=k div cs[i];
                                        end;
                                        if t*res<mu[i] then exit(false);
                                end;
                        exit(true);
                end;


        function power(x:longint):longint;
        var     i,t:longint;
                begin
                        res:=1;
                        for i:= 1 to dem do res:=res*cs[i];
                        i:=1;
                        t:=res;
                        while (check(i,t)=false) and (t<a) do
                                begin
                                        inc(i);
                                        t:=res*i;
                                end;
                        exit(t);
                end;

begin
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(a);
        if a=1 then writeln(1) else
        begin
        phantich(a);
        writeln(power(a));
        end;
        close(input); close(output);
end.



