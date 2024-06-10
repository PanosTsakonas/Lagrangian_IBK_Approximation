figure
plot(t,th1f.*180/pi,'-',t,Y1.*180/pi,'o',tim,L1.*180/pi,'--black');
legend("Filtered data","IBK solution","Lagrangian solution",'Location','best');
xlabel("Time (s)")
ylabel("MCP angle (degrees)");
title("Results for the MCP joint movement with R^2: "+0.94+" and RMSE: "+0.65+" degrees");
saveas(figure(1),"MCP_results","png")

figure
plot(t,th2f.*180/pi,'-',t,Y2.*180/pi,'o',tim,L2.*180/pi,'--black');
legend("Filtered data","IBK solution","Lagrangian solution",'Location','best');
xlabel("Time (s)")
ylabel("PIP angle (degrees)");
title("Results for the PIP joint movement with R^2: "+0.98+" and RMSE: "+1.28+" degrees");
saveas(figure(2),"PIP_results","png")

figure
plot(t,th3f.*180/pi,'-',t,Y3.*180/pi,'o',tim,L3.*180/pi,'--black');
legend("Filtered data","IBK solution","Lagrangian solution",'Location','best');
xlabel("Time (s)")
ylabel("DIP angle (degrees)");
title("Results for the DIP joint movement with R^2: "+0.94+" and RMSE: "+2.54+" degrees");
saveas(figure(3),"DIP_results","png")



Li1=spline(tim,L1);
Li2=spline(tim,L2);
Li3=spline(tim,L3);

Li1=ppval(mkpp(Li1.breaks,Li1.coefs),t);
Li2=ppval(mkpp(Li2.breaks,Li2.coefs),t);
Li3=ppval(mkpp(Li3.breaks,Li3.coefs),t);

figure
plot(t,(Y1-Li1).*180/pi)
xlabel("Time (s)")
ylabel("MCP difference results (degrees)")
title("Difference between IBK and Lagrangian solutions")
saveas(gcf,"MCP_diff","png")

figure
plot(t,(Y2-Li2).*180/pi)
xlabel("Time (s)")
ylabel("PIP difference results (degrees)")
title("Difference between IBK and Lagrangian solutions")
saveas(gcf,"PIP_diff","png")

figure
plot(t,(Y3-Li3).*180/pi)
xlabel("Time (s)")
ylabel("DIP difference results (degrees)")
title("Difference between IBK and Lagrangian solutions")
saveas(gcf,"DIP_diff","png")

