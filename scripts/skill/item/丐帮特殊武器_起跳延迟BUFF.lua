---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/丐帮特殊武器_起跳延迟BUFF.lua
-- 更新时间:	2016/10/9 15:56:30
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		player.PlaySfx(1531, player.nX, player.nY, player.nZ)
		player.DoAction(0,15151)
		player.AddBuff(player.dwID, player.nLevel, 11394, 1)

	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com