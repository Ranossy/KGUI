---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/90级奇穴/翔鸾舞柳被驱散.lua
-- 更新时间:	2013/8/19 15:16:19
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID, dwSkillSrcID)

end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 and player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.06
	end
	--]]
end

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 and player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.06
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com