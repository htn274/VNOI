const   fi='fact.inp';
        fo='fact.out';
var     luythua:array[0..3] of byte=(6,2,4,8);
        n,k,i:longint;
        function so(n:longint):byte;
        var     k:byte; c,m,t,i:longint;
                begin
                        k:=1;m:=0;
                        if n<=1 then exit(k);
                        for i:= 2 to n do
                                begin
                                        t:=i;
                                        while (t mod 2=0) and (t>1) do
                                                begin
                                                        inc(m);
                                                        t:=t div 2;
                                                end;
                                        while (t mod 5=0) and (t>1) do
                                                begin
                                                        dec(m);
                                                        t:=t div 5;
                                                end;
                                        k:=((k mod 10)*t mod 10) mod 10;
                                end;
                         k:=(k*luythua[abs(m) mod 4]) mod 10;
                        exit(k);
                end;

begin
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(k);
        for i:= 1 to k do
                begin
                        readln(n);
                        writeln(so(n));
                end;
        close(input); close(output);
end.