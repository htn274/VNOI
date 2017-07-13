var     i:longint;
        id,dir,tenbai:string;
begin
        tenbai:='ZABAVA';
        assign(output,tenbai+'.BAT');
        rewrite(output);
        for i:=1 to 10 do
                begin
                        str(i,id);
                        dir:=id;
                        //while length(dir)<2 do dir:='0'+dir;
                        writeln('md TEST',dir);
                        writeln('copy "',tenbai,'.IN.',dir,'" "TEST',dir,'/',tenbai,'.INP"');
                        writeln('copy "',tenbai,'.OUT.',dir,'" "TEST',dir,'/',tenbai,'.OUT"');
                end;
        close(output);
end.
