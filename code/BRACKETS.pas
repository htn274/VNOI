const   fi='BRACKETS.inp';
        fo='BRACKETS.out';
        maxn=1000;
var     a,stack:array[0..2*maxn+1] of longint;
        n,last:longint;
        s:ansistring;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(s);
                        n:=length(s);
                        s:=s+s;
                        for i:= 1 to n*2 do
                                case s[i] of
                                '(': a[i]:=1;
                                ')': a[i]:=-1;
                                '[': a[i]:=2;
                                ']': a[i]:=-2;
                                '{': a[i]:=3;
                                '}': a[i]:=-3;
                                end;
                        close(input);
                end;

        function kt(k:longint):boolean;
        var     i:longint;
                begin
                        last:=0;
                        for i:= k to k+n-1 do
                                if a[i]>0 then
                                        begin
                                                inc(last);
                                                stack[last]:=a[i];
                                        end else
                                        if stack[last]+a[i]<0 then
                                                exit(false) else
                                        begin
                                                stack[last]:=0;
                                                dec(last);
                                        end;
                        if last=0 then exit(true) else exit(false);
                end;

        procedure xuli;
        var     i:longint;
                begin
                        for i:= 1 to n+1 do
                                if kt(i) then
                                        begin
                                                writeln('Yes');
                                                exit;
                                        end;
                        writeln('No');
                end;

begin
        docfile;
        assign(output,fo);
        rewrite(output);
        if a[1]=0 then writeln('Yes') else
        xuli;
        close(output);
end.

