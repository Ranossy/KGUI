---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_安禄山_玩家战车buff移除.lua
-- 更新时间:	2014/3/7 9:46:39
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
		local scene = playertarget.GetScene()
		if scene.dwMapID == 182 then
			playertarget.DownHorse()
			playertarget.SetDynamicSkillGroup(0)
			playertarget.DelBuff(7591, 1)
			playertarget.DelGroupBuff(7677, 1)
			playertarget.AddBuff(0, 99, 2587, 3)
			playertarget.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, nCustomValue)
		end

		if scene.dwMapID == 183 then
			playertarget.DownHorse()
			playertarget.SetDynamicSkillGroup(0)
			playertarget.DelBuff(7591, 1)
			playertarget.DelGroupBuff(7677, 2)
			playertarget.AddBuff(0, 99, 2587, 3)
			playertarget.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, nCustomValue)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com