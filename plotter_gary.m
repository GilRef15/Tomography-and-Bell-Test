v= VideoReader('0+112.5.mp4');
for i=1:1:30
frame = read(v,i);

%pcolor(frame(423:653,921:1224,1))
D2(i)=sum(sum(frame(98:317,494:765,1)));
%D2(i)=sum(sum(frame(406:647,461:785,1)));
shading flat
%plot(frame(200,:,1))
%[M,I] = max(frame(200,:,1));
%x(i)=I;
%shading flat
%pause(0.05)
%colorbar
i
end
1

plot(D2) 


pcolor(frame(:,:,1))
shading flat