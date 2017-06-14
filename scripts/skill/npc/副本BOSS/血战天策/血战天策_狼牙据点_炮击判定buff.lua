---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_狼牙据点_炮击判定buff.lua
-- 更新时间:	2013/11/21 0:06:11
-- 更新用户:	ZHOUMING
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
local tAchievementCount = {
	[175] = 3983,
	[176] = 4003,
}
function Apply(dwCharacterID)
	--print(10086)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(7232, 1)
	if buff then
		local nKillNum = buff.nCustomValue
		if nKillNum >= 12 then
			buff.nCustomValue = 0
			local scene = player.GetScene()
			if not tAchievementCount[scene.dwMapID] then
				Log(GetEditorString(6, 1689))
				return
			end
			local tPlayerList = scene.GetAllPlayer()
			if not tPlayerList or #tPlayerList == 0 then
				return
			end
			for i = 1, #tPlayerList do
				local playerSE = GetPlayer(tPlayerList[i])
				if not playerSE.IsAchievementAcquired(tAchievementCount[scene.dwMapID]) then
					playerSE.AddAchievementCount(tAchievementCount[scene.dwMapID],1)
				end
			end
		else
			--print(nKillNum)
			buff.nCustomValue = 0
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com