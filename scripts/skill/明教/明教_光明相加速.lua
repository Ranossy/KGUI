---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_光明相加速.lua
-- 更新时间:	2013/6/4 5:40:51
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	--光明相加速
	if player.GetSkillLevel(6720) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6281, 1, 1)
	end
	--]]
	if player.GetSkillLevel(6726) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6284, 1, 10)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com