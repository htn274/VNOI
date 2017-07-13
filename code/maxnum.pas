uses math;
const fi='maxnum.inp';
      fo='maxnum.out';
      maxn=trunc(1e5);
var   a:array[1..maxn] of string;
      n:longint;
      f:text;
      procedure docfile;
      var i,x:longint;
            begin
                assign(input,fi);
                reset(input);
                readln(n);
                for i:= 1 to n do
                        begin
                                read(x);
                                str(x,a[i]);
                        end;
                close(input);
            end;
      function ss(x,y:string):boolean;
      var   i,l:longint;
        begin
            if x+y>y+x then exit(true) else exit(false);
        end;

      procedure swap(var x,y:string);
      var z:string;
        begin
            z:=x; x:=y; y:=z;
        end;

      procedure sort(l,r:longint);
      var      i,j:longint; x:string;
        begin
                i:=l;
                j:=r;
                x:=a[i+random(j-i)];
                repeat
                        while ss(a[i],x) do inc(i);
                        while ss(x,a[j]) do dec(j);
                        if i<=j then
                                begin
                                        swap(a[i],a[j]);
                                        inc(i);
                                        dec(j);
                                end;
                until i>j;
                if i<r then sort(i,r);
                if l<j then sort(l,j);
        end;


      procedure thuchien;
      var   i,j:longint;
          begin
              sort(1,n);
              assign(output,fo);
              rewrite(output);
              for i:= 1 to n do write(a[i]);
              close(output);
          end;

begin
    docfile;
    thuchien;
end.
