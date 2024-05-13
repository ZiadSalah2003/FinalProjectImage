% Just Helper Function 
function[R,G,B]=ReplaceAll(R,G,B,sumR,sumG,sumB )
R(:,:,2)=R(:,:,1);
G(:,:,2)=G(:,:,1);
B(:,:,2)=B(:,:,1);
R=double(R);
G=double(G);
B=double(B);
for i=0:255
    
  r=R(:,:,1);
  r2=R(:,:,2);

  r(r==i&r2~=-1)=sumR(i+1);
  r2(r2==i)=-1;
  R(:,:,1)=r;
  R(:,:,2)=r2;

  
  g=G(:,:,1);
  g2=G(:,:,2);
  g(g==i&g2~=-1)=sumG(i+1);
  g2(g2==i)=-1;
  G(:,:,1)=g;
  G(:,:,2)=g2;

  
  b=B(:,:,1);
  b2=B(:,:,2);
  b(b==i&b2~=-1)=sumB(i+1);
  b2(b2==i)=-1;
  B(:,:,1)=b;
  B(:,:,2)=b2;




end
end