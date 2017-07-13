const   input='abcd.inp';
        output='abcd.out';
var     fi,fo:text;
        a:array[1..4] of ansistring;
        i:longint;

        function ss(a,b:ansistring):boolean;
        var     i:longint;
                begin
                        for i:= 1 to length(a) do
                                if a>b then exit(true) else exit(false);
                end;

        function tru(a,b:ansistring):ansistring;
        var     nho,i,x,y,tam:longint; res,z:ansistring; c:integer;
                begin
                        while length(b)<length(a) do b:='0'+b;
                        while length(a)<length(b) do a:='0'+a;
                        if ss(a,b)=false then
                                begin
                                        z:=a;
                                        a:=b;
                                        b:=z;
                                end;
                        nho:=0;
                        res:='';
                        for i:= length(a) downto 1 do
                                begin
                                     val(a[i],x,c);
                                     val(b[i],y,c);
                                     if x>=y+nho then
                                     begin
                                        tam:=x-y-nho;
                                        nho:=0;
                                     end else
                                     begin
                                        tam:=10+x-y-nho;
                                        nho:=1;
                                     end;
                                     res:=chr(tam+48)+res;
                                end;
                                while (res[1]='0') and (length(res)>1) do delete(res,1,1);
                exit(res);
                end;

        function biendoi(a,b,c,d:ansistring):longint;
        var     dem:longint;z:ansistring;
                begin
                        dem:=0;
                        while (a>='0') and (b>='0') and (c>='0') and (d>='0') do
                                begin
                                        if (a='0') and (b='0') and (c='0') and (d='0') then exit(dem);
                                        z:=a;
                                        a:=tru(a,b);
                                        b:=tru(b,c);
                                        c:=tru(c,d);
                                        d:=tru(d,z);
                                        inc(dem);

                                end;
                end;

begin
        assign(fi,input);
        reset(fi);
        for i:= 1 to 4 do readln(fi,a[i]);
        close(fi);
        assign(fo,output);
        rewrite(fo);
        writeln(fo,biendoi(a[1],a[2],a[3],a[4]));
        close(fo);

end.

