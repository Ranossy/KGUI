---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_瑞鹤仙灯_buff监控_魔法.lua
-- 更新时间:	2017/4/18 14:58:32
-- 更新用户:	ZHANGYAN0-PC
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
	local npc1 = scene.GetNpcByNickName("rhxd_zy201704" .. player.dwID)
	local dwRepresentID = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND)

	if npc1 then
		npc1.FireAIEvent(2001, 0, 0)
	end

	if player.GetDynamicSkillGroup() == 336 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 19438  then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 389)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com