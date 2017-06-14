---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_安禄山_抛石头buff移除.lua
-- 更新时间:	2014/3/6 14:00:18
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	
end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local playertarget = GetPlayer(nCharacterID)
	if playertarget then
		playertarget.SetDynamicSkillGroup(0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com