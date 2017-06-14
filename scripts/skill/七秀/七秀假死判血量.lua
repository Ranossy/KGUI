---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/七秀假死判血量.lua
-- 更新时间:	2013/8/1 14:02:04
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not player.GetBuff(6183, 1) then
		if player.nCurrentLife <= player.nMaxLife * 0.01 then
			player.CastSkill(14708,1)									--解控
			player.AddBuff(dwCharacterID, player.nLevel, 6182, 1, 1)	--触发免死
			player.AddBuff(dwCharacterID, player.nLevel, 6183, 1, 1)	--内置CD
		end
		--player.AddBuff(dwCharacterID, player.nLevel, 6183, 1, 1)
	end
	if player.nCurrentLife <= player.nMaxLife * 0.01 then
		player.AddBuff(dwCharacterID, player.nLevel, 6473, 1, 1)	--延迟删除6179
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com