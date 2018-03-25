data1 = xlsread('bsedata1.xlsx');
data2 = xlsread('nsedata1.xlsx');

[n, m] = size(data1);

monthlyData1 = data1(1:30:end, :);
monthlyData2 = data2(1:30:end, :);

weeklyData1 = data1(1:7:end, :);
weeklyData2 = data2(1:7:end, :);

% set(0,'DefaultFigureVisible','off');
% =================================================================================================================
% ques 1
fig1 = figure(1);
for i = 1:m
	plot(data1(:, i));
	hold on;
end
title('Daily Prices BSE')
saveas(fig1, 'daily_prices_bse.jpg')


fig8 = figure(8);
for i = 1:m
	plot(data2(:, i));
	hold on;
end
title('Daily Prices NSE')
saveas(fig8, 'daily_prices_nse.jpg')


fig9 = figure(9);
for i = 1:m
	plot(monthlyData1(:, i));
	hold on;
end
title('Monthly Prices BSE')
saveas(fig9, 'monthly_prices_bse.jpg')


fig10 = figure(10);
for i = 1:m
	plot(monthlyData2(:, i));
	hold on;
end
title('Monthly Prices NSE')
saveas(fig10, 'monthly_prices_nse.jpg')


fig11 = figure(11);
for i = 1:m
	plot(weeklyData1(:, i));
	hold on;
end
title('Weekly Prices BSE')
saveas(fig11, 'weekly_prices_bse.jpg')


fig12 = figure(12);
for i = 1:m
	plot(weeklyData2(:, i));
	hold on;
end
title('Weekly Prices NSE')
saveas(fig12, 'weekly_prices_nse.jpg')


% =================================================================================================================
% ques 2

dail1 = interpretData(data1);
dail2 = interpretData(data2);

week1 = interpretData(weeklyData1);
week2 = interpretData(weeklyData2);

month1 = interpretData(monthlyData1);
month2 = interpretData(monthlyData2);

fig2 = figure(2);
for i = 1:m
	histogram(dail1(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
xlim([-20 20])
title('Normalized Daily Returns BSE')
saveas(fig2, 'daily_returns_bse.jpg')

fig3 = figure(3);
for i = 1:m
	histogram(dail2(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
xlim([-20 20])
title('Normalized Daily Returns NSE')
saveas(fig3, 'daily_returns_nse.jpg')

fig4 = figure(4);
for i = 1:m
	histogram(week1(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
xlim([-20 20])
title('Normalized Weekly Returns BSE')
saveas(fig4, 'weekly_returns_bse.jpg')

fig5 = figure(5);
for i = 1:m
	histogram(week2(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
xlim([-20 20])
title('Normalized Weekly Returns NSE')
saveas(fig5, 'weekly_returns_nse.jpg')

fig6 = figure(6);
for i = 1:m
	histogram(month1(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
xlim([-20 20])
title('Normalized Monthly Returns BSE')
saveas(fig6, 'monthly_returns_bse.jpg')


fig7 = figure(7);
for i = 1:m
	histogram(month2(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
xlim([-20 20])
title('Normalized Monthly Returns NSE')
saveas(fig7, 'monthly_returns_nse.jpg')


% =================================================================================================================
% ques 3

logdail1 = log(data1(1:end-1, :) ./ data1(2:end, :));
logdail2 = log(data2(1:end-1, :)./ data2(2:end, :));

logweek1 = log(weeklyData1(1:end-1, :) ./ weeklyData1(2:end, :));
logweek2 = log(weeklyData2(1:end-1, :) ./weeklyData2(2:end, :));

logmonth1 = log(monthlyData1(1:end-1, :) ./ monthlyData1(2:end, :));
logmonth2 = log(monthlyData2(1:end-1, :) ./ monthlyData2(2:end, :));

fig13 = figure(13);
for i = 1:m
	histogram(logdail1(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
title('Log Daily Returns BSE')
saveas(fig13, 'daily_log_returns_bse.jpg')

fig14 = figure(14);
for i = 1:m
	histogram(logdail2(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
title('Log Daily Returns NSE')
saveas(fig14, 'daily_log_returns_nse.jpg')

fig15 = figure(15);
for i = 1:m
	histogram(logweek1(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
title('Log Weekly Returns BSE')
saveas(fig15, 'weekly_log_returns_bse.jpg')

fig16 = figure(16);
for i = 1:m
	histogram(logweek2(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
title('Log Weekly Returns NSE')
saveas(fig16, 'weekly_log_returns_nse.jpg')

fig17 = figure(17);
for i = 1:m
	histogram(logmonth1(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
title('Log Monthly Returns BSE')
saveas(fig17, 'monthly_log_returns_bse.jpg')


fig18 = figure(18);
for i = 1:m
	histogram(logmonth2(:, i), 100, 'Edgecolor', 'none');
	hold on;
end
title('Log Monthly Returns NSE')
saveas(fig18, 'monthly_log_returns_nse.jpg')

% =================================================================================================================
% ques 4
tdaildata1 = data1(1:end-365, :);
tdaildata2 = data2(1:end-365, :);

tret = (tdaildata1(1:end-1, :) - tdaildata1(2:end, :)) ./ tdaildata1(2:end, :);
tdailret1 = mean(tret);
tdailvar1 = sqrt(var(tret));
tret = (tdaildata2(1:end-1, :) - tdaildata2(2:end, :)) ./ tdaildata2(2:end, :);
tdailret2 = mean(tret);
tdailvar2 = sqrt(var(tret));

for i = 1:365
	tdaildata1(end+1, :) = tdaildata1(end, :) + tdailret1 .* tdaildata1(end, :) + tdailvar1 .* tdaildata1(end, :) .* normrnd(0, 1, 1, m);
	tdaildata2(end+1, :) = tdaildata2(end, :) + tdailret2 .* tdaildata2(end, :) + tdailvar2 .* tdaildata2(end, :) .* normrnd(0, 1, 1, m);
end

fig19 = figure(19);
for i = 1:10
	plot(data1(:, i));
	hold on;
	plot(tdaildata1(:, i));
	hold on;
end
title('Predicted Daily Prices BSE')
saveas(fig19, 'daily_pred_prices_bse.jpg')

fig20 = figure(20);
for i = 1:10
	plot(data2(:, i));
	hold on;
	plot(tdaildata2(:, i));
	hold on;
end
title('Predicted Daily Prices NSE')
saveas(fig20, 'daily_pred_prices_nse.jpg')

% =================================================================================================================
% ques 5

tmonthdata1 = monthlyData1(1:end-12, :);
tmonthdata2 = monthlyData2(1:end-12, :);

tret = (tmonthdata1(1:end-1, :) - tmonthdata1(2:end, :)) ./ tmonthdata1(2:end, :);
tmonthret1 = mean(tret);
tmonthvar1 = sqrt(var(tret));
tret = (tmonthdata2(1:end-1, :) - tmonthdata2(2:end, :)) ./ tmonthdata2(2:end, :);
tmonthret2 = mean(tret);
tmonthvar2 = sqrt(var(tret));

for i = 1:12
	tmonthdata1(end+1, :) = tmonthdata1(end, :) + tmonthret1 .* tmonthdata1(end, :) + tmonthvar1 .* tmonthdata1(end, :) .* normrnd(0, 1, 1, m);
	tmonthdata2(end+1, :) = tmonthdata2(end, :) + tmonthret2 .* tmonthdata2(end, :) + tmonthvar2 .* tmonthdata2(end, :) .* normrnd(0, 1, 1, m);
end

fig21 = figure(21);
for i = 1:10
	plot(monthlyData1(:, i));
	hold on;
	plot(tmonthdata1(:, i));
	hold on;
end
title('Predicted Monthly Prices BSE')
saveas(fig21, 'monthly_pred_prices_bse.jpg')

fig22 = figure(22);
for i = 1:10
	plot(monthlyData2(:, i));
	hold on;
	plot(tmonthdata2(:, i));
	hold on;
end
title('Predicted Monthly Prices NSE')
saveas(fig22, 'monthly_pred_prices_nse.jpg')


tweekdata1 = weeklyData1(1:end-52, :);
tweekdata2 = weeklyData2(1:end-52, :);

tret = (tweekdata1(1:end-1, :) - tweekdata1(2:end, :)) ./ tweekdata1(2:end, :);
tweekret1 = mean(tret);
tweekvar1 = sqrt(var(tret));
tret = (tweekdata2(1:end-1, :) - tweekdata2(2:end, :)) ./ tweekdata2(2:end, :);
tweekret2 = mean(tret);
tweekvar2 = sqrt(var(tret));

for i = 1:52
	tweekdata1(end+1, :) = tweekdata1(end, :) + tweekret1 .* tweekdata1(end, :) + tweekvar1 .* tweekdata1(end, :) .* normrnd(0, 1, 1, m);
	tweekdata2(end+1, :) = tweekdata2(end, :) + tweekret2 .* tweekdata2(end, :) + tweekvar2 .* tweekdata2(end, :) .* normrnd(0, 1, 1, m);
end

hold off;
fig23 = figure(23);
for i = 1:10
	plot(weeklyData1(:, i));
	hold on;
	plot(tweekdata1(:, i));
	hold on;
end
hold off;
title('Predicted Weekly Prices BSE')
saveas(fig23, 'weekly_pred_prices_bse.jpg')

fig24 = figure(24);
for i = 1:10
	plot(weeklyData2(:, i));
	hold on;
	plot(tweekdata2(:, i));
	hold on;
end
title('Predicted Weekly Prices NSE')
saveas(fig24, 'weekly_pred_prices_nse.jpg')






