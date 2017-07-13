const   fi='div.inp';
        fo='div.out';
        maxn=trunc(1e5);
var     x:array[1..maxn] of longint;
        n,test:longint;
        function gcd(x,y:longint):longint;
        begin
                if x=y then exit(x);
                if x=0 then exit(y);
                if y=0 then exit(x);
                if x>y then exit(gcd(x mod y,y));
                exit(gcd(x,y mod x));
        end;

        function check:string;
        var     i:longint;
                begin
                        x[2]:=x[2] div gcd(x[1],x[2]);
                        for i:= 3 to n do
                                if x[2]>1 then x[2]:=x[2] div gcd(x[2],x[i]) else break;
                        if x[2]=1 then exit('YES') else exit('NO');
                end;


        procedure docfile;
        var     k,i:longint;
                begin
                        assign(input,fi); reset(input);
                        assign(output,fo); rewrite(output);
                        readln(test);
                        for k:=1 to test do
                                begin
                                        readln(n);
                                        for i:= 1 to n do readln(x[i]);
                                        writeln(check);
                                end;
                        close(input); close(output);
                end;
begin
        docfile;
end.

