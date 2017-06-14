---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/skill调用/极泉返修为调用.lua
-- 更新时间:	06/07/10 13:24:29
-- 更新用户:	zhouhengda2
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function Apply(dwCharacterID)  --返还效果结束时候调用，返还效果必须按不同BUFF分别调用
	local tQixueToBuff =  
	{
		[9]  = {qijing = 1975, xiaoguo = 1985}, --下极愈+点穴修为
		[1206]  = {qijing = 1972, xiaoguo = 1982}, --崇骨+传功
		[40]  = {qijing = 1969, xiaoguo = 1979}, --气端+跑速
		[41]  = {qijing = 1974, xiaoguo = 1984}, --腰眼+气血
		[42]  = {qijing = 1968, xiaoguo = 1978}, --抬肩+减伤
		[43]  = {qijing = 1966, xiaoguo = 1976}, --情中+运功不被打退
		[44]  = {qijing = 1973, xiaoguo = 1983}, --曲泉+外功会心
		[45]  = {qijing = 1970, xiaoguo = 1980}, --龙玄+外功攻击
		[46]  = {qijing = 1971, xiaoguo = 1981}, --极泉+内功会心
		[170] = {qijing = 1967, xiaoguo = 1977}, --合阳+内功攻击
	}
	local player = GetPlayer(dwCharacterID)
	local nQixueID = 41
	local buff = player.GetBuff(tQixueToBuff[nQixueID].xiaoguo, 1)
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
				player.SetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID, tQixueToBuff[nQixueID].xiaoguo)
			else
				Log("DebuffID chongtu.Reload Debuff lasttime")
			end	
			player.SendSystemMessage(SKILL_STRING_TABLE[31409] .. nStackNum - 1 .. SKILL_STRING_TABLE[31371])
		elseif nStackNum == 1 then
			player.SendSystemMessage(SKILL_STRING_TABLE[31410])
		end
	end
end

function UnApply(dwCharacterID) 
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com