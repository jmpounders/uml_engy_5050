function meshOut = refineMesh(meshIn)
% Author: Justin Pounders
% Created: 2012-10-25
  
  nxIn = meshIn.nX;
  if (nxIn > 1), 
      nxOut = nxIn*2; 
  else
      nxOut = nxIn;
  end;
  
  
  meshOut = meshIn;
  meshOut.nX = nxOut;
  
  meshOut.x = zeros(1,nxOut+1);
  meshOut.mat = zeros(nxOut);
  
  for i = 1:2:nxOut
    meshOut.x(i) = meshIn.x((i+1)/2);
    meshOut.x(i+1) = (meshIn.x((i+1)/2) + meshIn.x((i+1)/2 + 1))/2;
  end
  meshOut.x(nxOut+1) = meshIn.x(nxIn+1);
  
  
  for i = 1:2:nxOut
      meshOut.mat(i) = meshIn.mat((i+1)/2);
      meshOut.mat(i+1) = meshIn.mat((i+1)/2);
  end
end


