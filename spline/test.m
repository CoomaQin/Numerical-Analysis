function test
global xflag Cnt
h=figure(1);
gca;
set(gca,'XLim',[0,10],'YLim',[0,10],'XLimMode','manual','YLimMode','manual');
hold on;
xflag=0;
Cnt=0;
set(h,'WindowButtonMotionFcn',@myCallback1);
set(h,'WindowButtonDownFcn',@myCallback2);
set(h,'WindowButtonUpFcn',@myCallback3);


function myCallback2(obj,eventdata)
global xflag Cnt
type=lower(get(gco,'Type'));
if strcmp(type,'axes')
    pos=get(gco,'CurrentPoint');
    xflag
    h=plot(pos(2,1),pos(2,2),'o');
    Cnt=Cnt+1;
    set(h,'UserData',Cnt);
end
if strcmp(type,'line')
    xflag=1;
end

function myCallback3(obj,eventdata)
global xflag
xflag=0;

function myCallback1(obj,eventdata)
global xflag Cnt
type=lower(get(gco,'Type'));
if strcmp(type,'line') & xflag==1
    pos=get(get(gco,'parent'),'CurrentPoint');
    set(gco,'XData',pos(2,1),'YData',pos(2,2));
end
