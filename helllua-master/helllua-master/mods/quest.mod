quest={}
quest.savemoney={}
quest["end"]={}
quest.stop=true
quest.resume=nil
quest["main"]={}
quest.name=""
loadmod("lian.mod")
quest.main["lian"]=function(slist)
	quest.resume=lian.resume
	do_lian(slist,aliasaftercmd,aliasaftercmd)
end
quest["end"]["lian"]=function()
	lian["end"]()
end
loadmod("caxie.mod")
quest.main["caxie"]=function(expmax)
	do_caxie(caxie.main,caxie.main,expmax)
	quest.resume=quest.main["caxie"]
end
quest["end"]["caxie"]=function()
	caxie["end"]()
end


quest.main["assistor"]=function()
	mqquests=0
	mqstarttime=os.time()
	mqassistorcmd()
	quest.resume=masterquest.resume
end
quest["end"]["assistor"]=function()
	masterquest["end"]()
end
quest.main["assister"]=function(...)
	mqquests=0
	mqstarttime=os.time()
	mqassistercmd(...)
	quest.resume=masterquest.resume
end
quest["end"]["assister"]=function()
	masterquest["end"]()
end


quest.main["thinkwall"]=function()
	do_thinkwall()
	quest.resume=quest.main["thinkwall"]
end
quest["end"]["thinkwall"]=function()
	thinkwall["end"]()
end

loadmod("draw.mod")
quest.main["drawmap"]=function()
	do_drawmap()
	quest.resume=quest.main["drawmap"]
end
quest["end"]["draw"]=function()
	drawmap["end"]()
end

loadmod("makeyao.mod")
quest.main["makeyao"]=function(str,num)
	do_makeyao(str,num,aliasaftercmd,aliasaftercmd)
	quest.resume=quest.main["makeyao"]
end
quest["end"]["makeyao"]=function()
	makeyao["end"]()
end

loadmod("pick.mod")
quest.main["pick"]=function()
	do_pick(pick.main,pick.main)
	quest.resume=quest.main["pick"]
end
quest["end"]["pick"]=function()
	pick["end"]()
end

loadmod("beiqi.mod")
quest.main["beiqi"]=function(yuelimax)
	do_beiqi(aliasaftercmd,aliasaftercmd,yuelimax)
	quest.resume=beiqi["main"]
end
quest["end"]["beiqi"]=function()
	beiqi["end"]()
end

quest.main["dazuoneili"]=function(neilimax)
	do_dazuoneili(aliasaftercmd,aliasaftercmd,neilimax)
	quest.resume=dazuoneili.resume()
end
quest["end"]["dazuoneili"]=function()
	dazuoneili["end"]()
end

loadmod("letter.mod")
quest.main["letter"]=function(yuelimax)
	do_letter(letter.loop,letter.loop,yuelimax)
	quest.resume=quest.main["letter"]
end
quest["end"]["caxie"]=function()
	caxie["end"]()
end
loadmod("fish.mod")
quest.main["fish"]=function(expmax)
	do_fish(fish.loop,fish.loop,expmax)
	quest.resume=fish.loop
end
quest["end"]["fish"]=function()
	fish["end"]()
end
loadmod("liandan.mod")
quest.main["liandan"]=function()
	do_liandan(liandan.loop,liandan.loop)
	quest.resume=quest.main["liandan"]
end
quest["end"]["liandan"]=function()
	liandan["end"]()
end
loadmod("dutable.mod")
quest.main["dutable"]=function()
	do_dutable(dutable.loop,dutable.loop)
	quest.resume=quest.main["dutable"]
end
quest["end"]["dutable"]=function()
	dutable["end"]()
end
quest.main["canwu"]=function()
	do_canwu(canwu.loop,canwu.loop)
	quest.resume=quest.main["canwu"]
end
quest["end"]["canwu"]=function()
	canwu["end"]()
end

loadmod("masterquest.mod")
quest.main["mq"]=function(levelmax)
	mqquests=0
	mqstarttime=os.time()
	masterquest.type=masterquest.normal
	setupskill(levelmax)
	do_masterquest(masterquest.loop,masterquest.loop,levelmax)
	quest.resume=masterquest.resume
end
quest["end"]["mq"]=function()
	masterquest["end"]()
end
loadmod("freequest.mod")
quest.main["fq"]=function()
	quest.resume=freequest.resume
	do_freequest()
end
quest["end"]["canwu"]=function()
	freequest["end"]()
end
do_quest=function(name,...)
	quest.name=name
	initmud()
	if quest.main[name]~=nil then
		unhookall()
		quest.stop=false
		getinfo(quest_begin,...)
	end
end
quest_begin=function(...)
	setupskill()
	quest["main"][quest.name](...)
end
initmud=function()
	run(mudsettings)
end

resume=function()
	if quest.stop==false then
		stopall()
		_roomid=-1
		delay(1,getinfo,quest["resume"])
	end
end