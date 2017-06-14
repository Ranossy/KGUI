---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/小熊猫背挂_监控buff_魔法.lua
-- 更新时间:	2016/4/19 17:20:54
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	local npc = GetNpc(player.dwFellowPetID)

	if npc then
		if npc.dwTemplateID == 51084 then
			npc.SetDisappearFrames(1, 0)
		end
	end
	
	if player.GetDynamicSkillGroup() == 252 then
		player.SetDynamicSkillGroup(0)
	end

	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex == 17504 or player.dwBackItemIndex == 19262 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 326)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com