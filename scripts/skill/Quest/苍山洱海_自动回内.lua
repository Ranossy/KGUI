---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/苍山洱海_自动回内.lua
-- 更新时间:	2016/8/19 16:51:22
-- 更新用户:	linjiajia2
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  zhx
-- 创建时间  :  20111208
------------------------------------------------

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.dwShapeShiftID == 0 and player.nCurrentMana / player.nMaxMana < 0.1 and not player.GetBuff(3610, 2) then
		player.nCurrentMana = player.nMaxMana
		player.AddBuff(0, 99, 3610, 2)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com