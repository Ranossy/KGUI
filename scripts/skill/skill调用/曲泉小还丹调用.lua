---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/skill调用/曲泉小还丹调用.lua
-- 更新时间:	06/07/10 14:21:55
-- 更新用户:	zhouhengda2
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function Apply(dwCharacterID)  --返还效果结束时候调用，返还效果必须按不同BUFF分别调用
	local tQixueToXiaoBuff =  
	{
		[9]  = {qijing = 2001, xiaoguo = 2011}, --下极愈+点穴修为
		[1206]  = {qijing = 1998, xiaoguo = 2008}, --崇骨+传功
		[40]  = {qijing = 1995, xiaoguo = 2005}, --气端+跑速
		[41]  = {qijing = 2000, xiaoguo = 2010}, --腰眼+气血
		[42]  = {qijing = 1994, xiaoguo = 2004}, --抬肩+减伤
		[43]  = {qijing = 1992, xiaoguo = 2002}, --情中+运功不被打退
		[44]  = {qijing = 1999, xiaoguo = 2009}, --曲泉+外功会心
		[45]  = {qijing = 1996, xiaoguo = 2006}, --龙玄+外功攻击
		[46]  = {qijing = 1997, xiaoguo = 2007}, --极泉+内功会心
		[170] = {qijing = 1993, xiaoguo = 2003}, --合阳+内功攻击
	}
	local player = GetPlayer(dwCharacterID)
	local nQixueID = 44
	local buff = player.GetBuff(tQixueToXiaoBuff[nQixueID].xiaoguo, 1)
	if buff then
		local nValue = buff.nCustomValue
		local nStackNum = math.floor(nValue / 100000) --当前剩余返还次数
		local nFanhuan = nValue - nStackNum * 100000
		player.AddTrainNoLimit(nFanhuan)
		if nStackNum > 1 then 
			player.AddBuff(0, 99, 2029, 1)
			local buff_new = player.GetBuff(2029, 1)
			buff_new.nCustomValue = (nStackNum - 1) * 100000 + nFanhuan
			if player.GetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID) == 0 then --由道具CD保证不可能1秒内连续被设置
				player.SetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID, tQixueToXiaoBuff[nQixueID].xiaoguo)
			else
				Log("DebuffID chongtu.Reload Debuff lasttime")
			end	
			player.SendSystemMessage(SKILL_STRING_TABLE[31394] .. nStackNum - 1 .. SKILL_STRING_TABLE[31371])
		elseif nStackNum == 1 then
			player.SendSystemMessage(SKILL_STRING_TABLE[31393])
		end
	end
end

function UnApply(dwCharacterID) 
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com