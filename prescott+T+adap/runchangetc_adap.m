% NB IC gebaseerd op by=-15

clear all
addpath('D:\MATLAB\XPP-Matlab\')

tnmax=3030001;
imax=15;
data=zeros(tnmax,7);

% mypars=struct('type','PAR', 'name','dc_noise','val',0);
mypars(1).name='dc_noise';
mypars(1).type='PAR';
mypars(2).name='idc';
mypars(2).type='PAR';
mypars(3).name='V';
mypars(3).type='IC';
mypars(4).name='y';
mypars(4).type='IC';
mypars(5).name='h';
mypars(5).type='IC';
mypars(6).name='beta_y';
mypars(6).type='PAR';
mypars(7).name='z';
mypars(7).type='IC';

sigdc=10;

odeFileName = 'prescott_rubin_adap_noisestim.ode';

mypars(6).val=0;

for by=[-25 -20 -15 -10 0]
% for by=0
    mypars(6).val=by;
    dcnoise=zeros(4,imax);
    vn=0;
    for v=[-80,-70,-60,-50]
%     for v=-50
        vn=vn+1
        if v==-80
            mypars(2).val=-21;
            mypars(3).val=-80;
            mypars(4).val=0;
            mypars(5).val=0.27;
            mypars(7).val=0;
        elseif v==-70
            mypars(2).val=-2.3;
            mypars(3).val=-70; 
            mypars(4).val=0;
            mypars(5).val=0.03;
            mypars(7).val=0;
        elseif v==-60
            mypars(2).val=16;
            mypars(3).val=-60;
            mypars(4).val=0;
            mypars(5).val=0;
            mypars(7).val=0;
        elseif v==-50
            mypars(2).val=32;
            mypars(3).val=-50;
            mypars(4).val=0;
            mypars(5).val=0;
            mypars(7).val=0;
        else
            'klopt nie'
        end          
        for i=1:imax
%         for i=1
            i
            data=zeros(tnmax,7);
            randn('state',sum(100*clock))
            mypars(1).val=sigdc*randn;
            dcnoise(vn,i)=mypars(1).val
            successchange = ChangeXPPodeFile(odeFileName, mypars)
            successrun = RunXPP(odeFileName,'',true,'C:\xppall\xppaut.exe')
            data(:,:) = load('D:\MATLAB\XPP-Matlab\prescott_rubin_adap\prescott_rubin_adap.dat'); % change this if your ODE file explicitly names a data file
            save(['F:\MATLAB\XPP-Matlab\prescott_rubin_adap\prescott_rubin_adap_compare_by',num2str(by),'_v',num2str(v),'_i',num2str(i),'.mat'])            
        end
    end
end
