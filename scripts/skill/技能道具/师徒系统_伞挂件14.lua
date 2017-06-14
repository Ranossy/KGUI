---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_伞挂件14.lua
-- 更新时间:	2015/7/28 15:36:01
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 13914 or player.dwBackItemIndex == 19256 then

		--特殊处理纱帐
		local scene = player.GetScene()
		local npcX = scene.GetNpcByNickName("ss_yt150813_" .. player.dwID)
		if npcX then
			return
		end

		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 277)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com