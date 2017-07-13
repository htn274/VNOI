type    sets=record
        l,r,vt:longint;
end;
const   fi='cover.inp';
        fo='cover.out';
var     f:array[1..100000] of sets;
        kq:array[0..100000] of longint;
        a,b,n,sl,vitri:longint;
        kt:array[1..100000] of boolean;
        procedure docfile;
        var   i:longint;
            begin
                assign(input,fi);
                reset(input);
                readln(n,a,b);
                for i:= 1 to n do
                  begin
                      f[i].vt:=i;
                    readln(f[i].l,f[i].r);
                  end;
                close(input);
            end;

        procedure hoanvi(var x,y:sets);
        var z:sets;
            begin
                z:=x; x:=y; y:=z;
            end;

        procedure sort(l,r:longint);
        var   i,j,x:longint;
            begin
                i:=l;
                j:=r;
                x:=f[(i+j) div 2].r;
                repeat
                    while f[i].r<x do inc(i);
                    while f[j].r>x do dec(j);
                    if i<=j then
                      begin
                          hoanvi(f[i],f[j]);
                          inc(i);
                          dec(j);
                      end;
                until i>j;
                if i<r then sort(i,r);
                if l<j then sort(l,j);
            end;

  function max(i,j,x:longint):longint;
  var k:longint;
    begin
        for k:= j downto i do
                if f[k].l<=x then
                                exit(k);
        exit(0);
    end;

  procedure xuly;
  var   v,j,i:longint;
        begin
              v:=a;
              sl:=0;
              kq[sl]:=0;
              repeat
                j:=max(kq[sl]+1,n,v);
                if j=0 then
                        begin
                                writeln(-1); exit;
                        end;
                v:=f[j].r;
                inc(sl);
                kq[sl]:=j;
                if sl>n then
                        begin
                                writeln(-1);
                                exit;
                        end;
              until v>=b;
        end;


  procedure xuat;
  var i:integer;
      begin
          assign(output,fo);
          rewrite(output);
          xuly;
          if sl<=n then begin
          writeln(sl);
          if (sl>0)  then
             for i:= 1 to sl do
                writeln(f[kq[i]].vt);
             end;
          close(output);
      end;

begin
  docfile;
  sort(1,n);
  xuat;
end.
