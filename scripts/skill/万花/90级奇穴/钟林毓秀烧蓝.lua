---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/90级奇穴/钟林毓秀烧蓝.lua
-- 更新时间:	2013/7/23 17:56:36
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--倚天效果已经替换，这段脚本已经无效了。
	--[[
	local target = GetPlayer(dwCharacterID)
	local i = Random(1, 10)
	if player.GetSkillLevel(5757) == 1 then
		--if i == 1 then
		if target then
			target.nCurrentMana = target.nCurrentMana - target.nMaxMana * 0.01
		end
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.01
		--end
	end
	--]]
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com