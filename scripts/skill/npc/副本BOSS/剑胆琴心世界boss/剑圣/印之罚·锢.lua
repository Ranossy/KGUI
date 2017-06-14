---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/剑胆琴心世界boss/剑圣/印之罚·锢.lua
-- 更新时间:	2015/9/30 16:58:52
-- 更新用户:	WANGZEYU
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local TPlayer = GetPlayer(dwCharacterID)
	if not TPlayer then
		return
	end

	if TPlayer.nMoveState == MOVE_STATE.ON_STAND then
		TPlayer.AddBuff(0, 99, 9953, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com