
raster=readtable("raster_before.csv","ReadVariableNames",true);
raster=table2array(raster)

raster(isnan(raster))=0
raster_bf=logical(raster)

raster_bf_1=readtable("raster_before_col1.csv","ReadVariableNames",true);
raster_bf_1=table2array(raster_bf_1)

raster_bf_1(isnan(raster_bf_1))=0
raster_bf_1=logical(raster_bf_1)

raster_after=readtable("raster_after.csv","ReadVariableNames",true);
raster_after=table2array(raster_after)

raster_after(isnan(raster_after))=0
raster_af=logical(raster_after)

raster_after_1=readtable("raster_after_col1.csv","ReadVariableNames",true);
raster_after_1=table2array(raster_after_1)

raster_after_1(isnan(raster_after_1))=0
raster_af_1=logical(raster_after_1)
%%
LineFormatHorz.LineWidth = 5;
LineFormatVert.Color = '#51087E';
LineFormatVert.LineWidth = 2;
MarkerFormat.MarkerSize = 10;
MarkerFormat.Marker = '.';
MarkerFormat.Color='#51087E'


fig=figure;        
subplot(2,1,1);
plotSpikeRaster(raster_bf,'PlotType','vertline','LineFormat',LineFormatVert,'VertSpikePosition', -0.5);
legend('Colony 2-Before','FontSize',14)
hold on


subplot(2,1,2)
plotSpikeRaster(raster_af,'PlotType','vertline','LineFormat',LineFormatVert,'VertSpikePosition', -0.5);
legend('Colony 2-After', 'FontSize',14)
hold on
LineFormatHorz.LineWidth = 5;
LineFormatVert.Color = '#013220';
LineFormatVert.LineWidth = 2;
MarkerFormat.MarkerSize = 10;
MarkerFormat.Marker = '.';
MarkerFormat.Color='#013220'

han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'Warble Number','FontSize',14);
xlabel(han,'Warble length','FontSize',14);


%%
subplot(2,2,2)
plotSpikeRaster(raster_bf_1,'PlotType','vertline','LineFormat',LineFormatVert,'VertSpikePosition', -0.5);
legend('Colony 1-Before', 'FontSize',14)

LineFormatHorz.LineWidth = 5;
LineFormatVert.Color = '#013220';
LineFormatVert.LineWidth = 2;
MarkerFormat.MarkerSize = 10;
MarkerFormat.Marker = '.';
MarkerFormat.Color='#013220'
subplot(2,2,4)
plotSpikeRaster(raster_af_1,'PlotType','vertline','LineFormat',LineFormatVert,'VertSpikePosition', -0.5);
legend('Colony 1-After', 'FontSize',14)



