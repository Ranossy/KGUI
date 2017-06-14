---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/元宵琉璃灯维持buff11683.lua
-- 更新时间:	2017/2/6 15:52:06
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetDynamicSkillGroup() == 322 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 19303 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 376)
	end
	player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com