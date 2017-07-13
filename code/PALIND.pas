const   fi='PALIND.inp';
        fo='PALIND.out';
var     x,y:longint;
        tam:ansistring;
        function kt(x:ansistring):string;
        var     i:longint;
                begin
                        for i:=1 to length(x) div 2 do
                                if x[i]<>x[length(x)-i+1] then exit('No');
                        exit('Yes');
                end;

begin
        assign(input,fi);reset(input);
        assign(output,fo); rewrite(output);
        readln(x,y);
        str(x+y,tam);
        writeln(kt(tam));
        close(input);
        close(output);
end.
