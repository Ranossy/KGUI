---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_花门_buff监控_魔法.lua
-- 更新时间:	2016/11/8 9:44:16
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
	local npc1 = scene.GetNpcByNickName("fxby_N_fxf201611" .. player.dwID)
	local dwRepresentID = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND)

	if npc1 then
		npc1.FireAIEvent(2001, 0, 0)
	end

	if player.GetDynamicSkillGroup() == 313 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 20208  then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 371)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com