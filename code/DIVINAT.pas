const   fi='DIVINAT.inp';
        fo='DIVINAT.out';
var      n,dem:longint;
        function ucln(a,b:longint):longint;
        var r:longint;
        begin
                r:=a mod b;
                while r<>0 do
                        begin
                                r:=a mod b;
                                a:=b;
                                b:=r;
                        end;
                exit(a);
        end;

        procedure xuli;
        var     i:longint;
                begin
                        dem:=1;
                        for i:= 2 to n-1 do
                                if ucln(n,i)=1 then
                                        inc(dem);
                end;

begin
        assign(input,fi); reset(input);
        readln(n);
        close(input);
        xuli;
        assign(output,fo); rewrite(output);
        writeln(dem);
        close(output);
end.



