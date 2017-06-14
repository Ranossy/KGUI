---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/丐帮特殊武器_起跳后BUFF.lua
-- 更新时间:	2016/10/12 20:21:16
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--	player.DoAction(0,15151)
		--player.AddBuff(player.dwID, player.nLevel, 11392, 1)
		--if player.nRoleType == ROLE_TYPE.STANDARD_MALE then --M2
		player.CastSkill(17028, 1)

		--elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then --f2
		--	player.CastSkill(17028, 2)

		--elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then --m1
		--	player.CastSkill(17028, 3)

		--elseif player.nRoleType == ROLE_TYPE.LITTLE_GIRL then --f1
		--	player.CastSkill(17028, 4)
		--end

	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com