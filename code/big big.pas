const input='test.inp';
      output='test.out';
var   a:string; b:longint;
      function big_div(a:string;b:longint):string;
      var  hold,i:longint; s:string;
        begin
          hold:=0;
          s:='';
            for i:= 1 to length(a) do
              begin
                  hold:=(ord(a[i])-48)+hold*10;
                  s:=s+chr((hold div b)+48);
                  hold:=hold mod b;
              end;
              exit(s);
        end;

begin
    readln(a);
    readln(b);
    write(big_div(a,b));
end.