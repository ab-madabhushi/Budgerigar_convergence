%% read data with repeats

repeat_dat= readtable("Budgerigar Project_warble d repeats.csv");
ind_name=table2array(repeat_dat(2:end,end));
rep_dat=table2array(repeat_dat(2:end,2:end-1));

%% Conducting a PCA to test for convergence

[coeff, score, latent, expl] = pcacorr(rep_dat);

%[coeff, score, latent, expl] = ppca(rep_dat,3);
% plotting PC components



%% PC_scores
pc_score=[score, ind_name];
csvwrite('budgie_convergence_pc_Score.csv', pc_score, 0,0)

%% centroid plots
pc_score=readtable("budgie_convergence_pc_Score.csv");
%pc_score=table2array(pc_score(2:end,:));

group=pc_score(:,end);
ind_no=unique(group);

%% calcuating CI and Centroid for each group
[centroid,CI]=centroidci(pc_score,group);

clf;
centroidCIplot(centroid,CI,ind_no,{'110','111','120','121','210','211','220','221','230','231'})

%% group wise stats
ind_mean=grpstats(pc_score,"ind",'mean');
ind_std=grpstats(pc_score, 'ind', 'sem');

pc1_mean=table2array(ind_mean(:,"mean_pc1"));
pc1_sem=table2array(ind_std(:,'sem_pc1'));

pc2_mean=table2array(ind_mean(:, "mean_pc2"));
pc2_sem=table2array(ind_std(:,"sem_pc2"));
colors=['g','g',"#77AC30","#77AC30",'b','b',"#7E2F8E","#7E2F8E","#4DBEEE","#4DBEEE"];
linestyle=['o','s','o','s','o','s','o','s','o','s'];
figure();

hem=errorbar(pc1_mean, pc2_mean, pc2_sem,pc2_sem,pc1_sem,pc1_sem,'.','MarkerSize',1,Color='r')
hem.LineWidth=2;
hold on

for i=1:numel(pc1_mean)
    plot(pc1_mean(i), pc2_mean(i),'Marker',linestyle(i),'MarkerFaceColor',colors(i),'MarkerSize',18)
    hold on
end





