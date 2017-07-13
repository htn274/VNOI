const   input='bank.inp';
        output='bank.out';
var     res:array[1..30] of longint;
        a:array[1..20] of longint;
        b:array[1..30] of longint;
        fi,fo:text;
        n,m,t:longint;
        find:boolean;

        procedure kt;
        var i,tong:longint;
                begin
                        tong:=0;
                     for i:= 1 to m do
                        if res[i]=1 then tong:=tong+b[i];
                     if a[1]=tong then
                        begin
                                find:=true;
                                for i:= 1 to m do write(fo,res[i],' ');
                                writeln(fo);
                        end;
                end;

        procedure sinh(i:longint);
        var     j:byte;
                begin
                        for j:= 0 to 1 do
                        begin
                        if find=true then exit;
                        res[i]:=j;
                        if i=m then kt else sinh(i+1);
                        end;
                end;

        procedure thuchien;
                begin
                        find:=false;
                        sinh(1);
                        if find=false then writeln(fo,-1);
                end;


        procedure docfile;
        var     i,j:longint;
                begin
                        assign(fi,input);
                        reset(fi);
                        assign(fo,output);
                        rewrite(fo);
                        readln(fi,t);
                        for i:= 1 to t do
                                begin
                                        readln(fi,n,m);
                                        readln(fi,a[1]);
                                        for j:= 1 to m do read(fi,b[j]);
                                        thuchien;
                                end;
                        close(fi);
                        close(fo);
                end;

begin
   docfile;
end.


