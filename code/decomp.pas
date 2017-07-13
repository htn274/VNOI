const   fi='decomp.inp';
        fo='decomp.out';
var     stack:array[1..trunc(1e6)] of ansistring;
        top:longint;
        s,res:ansistring;
        function giaima(x:ansistring;k:longint):ansistring;
        var     i:longint;
                res:string;
                begin
                        if k=0 then exit('');
                        res:=x;
                        for i:= 1 to k-1 do res:=res+x;
                        exit(res);
                end;

        procedure push(c:ansistring);
        begin
                inc(top);
                stack[top]:=c;
        end;

        function pop:ansistring;
        begin
                pop:=stack[top];
                dec(top);
        end;

        procedure xuli;
        var   i,c,k:longint;
                x,t:ansistring;
        begin

                for i:= 1 to length(s) do
                        if (s[i]='(') or (s[i] in ['A'..'Z']) then push(s[i]) else
                        if (s[i] in ['0'..'9']) then
                                begin
                                        x:=pop;
                                        val(s[i],k,c);
                                        push(giaima(x,k));
                                end else
                        if s[i]=')' then
                        begin
                                t:='';
                                repeat
                                       x:=pop;
                                       if x<>'(' then
                                       t:=x+t;
                                until x='(';
                                push(t);
                        end;
                res:='';
                for i:= top downto 1 do
                        res:=stack[i]+res;
        end;

begin
        assign(input,fi); reset(input);
        readln(s);
        close(input);
        xuli;
        assign(output,fo); rewrite(output);
        writeln(res);
        close(output);
end.

