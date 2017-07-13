const   fi='select.inp';
        fo='select.out';
        maxn=1000;
var     s:ansistring;
        check:array[0..maxn*3] of boolean;
        n,dem:longint;
        procedure khoitao;
        var     i:longint;
                begin
                        fillchar(check,sizeof(check),false);
                        n:=length(s);
                        s:=s+s+s;
                        for i:= 1 to length(s) do
                                if s[i]='D' then check[i]:=true;
                        check[0]:=check[n];
                end;

        function kt(k:longint):boolean;
        var     i,m,an,binh:longint;
                res1,res2:boolean;
                begin
                        an:=0;
                        binh:=0;
                        i:=k;
                        m:=i+n-1;
                        res1:=false;
                        res2:=false;
                        while i<=m do
                                begin
                                        if check[i] then inc(an);
                                        if i<>m then
                                        if check[i+1] then inc(binh);
                                        inc(i,2);
                                end;
                        if an>binh then res1:=true;
                        an:=0;
                        binh:=0;
                        i:=k;
                        m:=i-n+1;
                        while i>=m do
                                begin
                                        if check[i] then inc(an);
                                        if i<>m then
                                        if check[i-1] then inc(binh);
                                        dec(i,2);
                                end;
                        if an>binh then res2:=true;
                        exit(res1 and res2);
                end;



        procedure thuchien;
        var     i:longint;
                begin
                        dem:=0;
                        for i:= n to 2*n do
                                if kt(i) then inc(dem);
                end;

begin
        assign(input,fi); reset(input);
        assign(output,fo); rewrite(output);
        readln(s);
        khoitao;
        thuchien;
        writeln(dem);
        close(input); close(output);
end.
