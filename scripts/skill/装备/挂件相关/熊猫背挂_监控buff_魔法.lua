---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/熊猫背挂_监控buff_魔法.lua
-- 更新时间:	2016/2/20 16:32:39
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
	local npc1 = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)

	if npc1 then
		npc1.FireAIEvent(2001,0,0)
	end
	
	if player.GetDynamicSkillGroup() == 247 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 17236 or player.dwBackItemIndex == 19238 then--增加限时版判断
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 321)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com