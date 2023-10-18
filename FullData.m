file = dir('/home/userb/work/matlab/MATLAB_Drive/MATLAB_Drive/BhaveshSharedFolder/psyphy1/data'); 
% file = dir('/home/userb/work/matlab/MATLAB_Drive/images');   
NF = length(file);
AllData = cell(NF-3,2); %NF-3 number of images

for k = 1 : NF-3
  AllData{k,1} = file(k+3).name;%human labeled numerosity
  AllData{k,2} = csvread(fullfile('/home/userb/work/matlab/MATLAB_Drive/MATLAB_Drive/BhaveshSharedFolder/psyphy1/data', file(k+3).name),1,0);
  
  AD=AllData{k,2};
  AD(AD(:,9)>2,:)=[]; %filter the trials with unususal large reaction time
  AD(AD(:,9)<.2,:)=[]; %filter the trials with unususal large reaction time

  AllData{k,2}=AD;
  
  if k==1
      MixData=AllData{k,2};
  else
      MixData = [MixData;AllData{k,2}];
  end
%   images{k,2} = fullfile('/home/userb/work/matlab/MATLAB_Drive/images', file(k+3).name);
  
end