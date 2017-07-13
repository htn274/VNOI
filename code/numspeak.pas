const   fi='numspeak.inp';
        fo='numspeak.out';
        st='abcdefghijklmnopqrstuvwxyz';
type    bignum=string;
var     i,n:longint;
        t,stt,x,res:bignum;
        f,g:array[0..21] of string;
        kq:array[1..20] of char;
        s:string;
        function sosanh(a,b:bignum):integer;
        begin
                while length(a)< length(b) do a:='0'+a;
                while length(b)< length(a) do b:='0'+b;
                if a<b  then exit(-1);
                if a>b then exit(1) else exit(0);
        end;

        function add(a,b:bignum):bignum;
        var tmp,i,carry:longint;c:bignum;
        begin
                c:='';carry:=0;
                while length(a)< length(b) do a:='0'+a;
                while length(b)< length(a) do b:='0'+b;
                for i:=length(a) downto 1 do
                        begin
                                tmp:=ord(a[i])-48+ord(b[i])-48+carry;
                                carry:=tmp div 10;
                                if tmp >=10 then
                            begin
                                        tmp:=tmp mod 10;
                                        carry:=1;
                                end
                                else carry:=0;

                                c:=chr(tmp+48)+c;
                        end;
                 if carry>0 then c:='1'+c;
                exit(c);
        end;

        function sub(a,b:bignum):bignum;
        var c:bignum;i,tmp,borrow:longint;
        begin
                c:='';borrow:=0;
                while length(a)< length(b) do a:='0'+a;
                while length(b)< length(a) do b:='0'+b;
                for i:=length(a) downto 1 do
                        begin
                                tmp:=ord(a[i])-ord(b[i])-borrow;
                                if tmp <0 then
                                        begin
                                                tmp:=tmp+10;
                                                borrow:=1;
                                        end
                                        else borrow:=0;
                                c:=chr(tmp+48)+c;
                        end;
                while (c[1]='0') and (length(c)>1) do delete(c,1,1);
                        exit(c);
        end;

        function multiply(a:bignum;b:longint):bignum;
        var c,tmp2:bignum;hold,i,tmp:longint;
        begin
                c:='';hold:=0;
                for i:=length(a) downto 1 do
                begin
                        tmp:=(ord(a[i])-48)*b+hold;
                        hold :=tmp div 10;
                        c:=chr(tmp mod 10 +48)+c;
                end;
                if hold>0 then begin str(hold,tmp2);
                c:=tmp2+c;
                end;
                exit(c);
        end;

        procedure xuat;
        var i:longint;
                begin
                        for i:= 1 to n do
                                write(kq[i]);
                        writeln;
                end;

        procedure timchuoi(i:longint);
        var     j:longint;
                begin
                        if i>n then
                                begin
                                      xuat;
                                end;
                        for j:= 1 to 26 do
                        if n>=i then
                                begin
                                if (sosanh(f[n-i],t)=-1) then
                                                t:=sub(t,f[n-i])
                                                        else
                                                begin
                                                        kq[i]:=st[j];
                                                        timchuoi(i+1);
                                                        break;
                                                end;
                                end;
                end;

        procedure xuat2;
        var i,dem:longint;
                begin
                        dem:=0;
                        for i:=length(stt) downto 1 do
                                begin
                                        res:=stt[i]+res;
                                        inc(dem);
                                        if dem=3 then
                                        begin
                                                res:='.'+res;
                                                dem:=0;
                                        end;
                                end;
                        if res[1]='.' then delete(res,1,1);
                        writeln(res);
                end;

        procedure timthutu(i:longint);
        var j:longint;
                begin
                        if i>n then
                                begin
                                        stt:=add(add(stt,'1'),g[n-1]);
                                        xuat2;
                                        exit;
                                end;
                        for j:= 1 to 26 do
                                        if s[i]=st[j] then
                                        begin
                                                timthutu(i+1);
                                                break;
                                        end else stt:=add(stt,f[n-i]);
                end;


        procedure khoitao;
        var i:longint;
                begin
                        t:='1';
                        f[0]:='1';
                        g[0]:='0';
                        for i:= 1 to 20 do
                        begin
                                t:=multiply(t,26);
                                f[i]:=t;
                                g[i]:=add(g[i-1],f[i]);
                        end;
                        f[21]:=f[20];
                end;

        function tim(var t:string):longint;
        var     i:longint;
                begin
                        i:=0;
                        while (sosanh(f[i],t)=-1) and (i<=20) do i:=i+1;
                        if i<>0 then
                        t:=sub(t,g[i-1]) else i:=1;
                        exit(i);

                end;

        procedure xuli1;
        begin
                f[0]:='1';
                n:=length(s);
                stt:='0';
                timthutu(1);
        end;

        procedure xuli2;
        begin
                n:=tim(t);
                timchuoi(1);
        end;



begin
        khoitao;
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        repeat
                        readln(x);
                        if x[1] in ['a'..'z'] then
                                begin
                                        s:=x;
                                        xuli1;
                                end else
                        if x<>'*' then
                                begin
                                        t:=x;
                                        xuli2;
                                end;
        until x='*';
        close(input);
        close(output);
end.
