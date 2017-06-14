---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/丐帮特殊武器_AOE延迟BUFF.lua
-- 更新时间:	2016/10/10 21:40:17
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--	player.DoAction(0,15151)
		--player.AddBuff(player.dwID, player.nLevel, 11392, 1)
		--player.CastSkill(17028, 1)
		if player.GetBuff(11422, 1) then
			local nCount = player.GetBuff(11422, 1).nStackNum
			--print(nCount)
			player.CastSkill(17039, nCount)
		end

	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com