---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_伞挂件15.lua
-- 更新时间:	2015/11/27 15:14:50
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 16872 then

		--特殊处理纱帐
		local scene = player.GetScene()
		local npc = scene.GetNpcByNickName("hm_fxf1127_" .. player.dwID)
		if npc then
			return
		end

		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 315)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com