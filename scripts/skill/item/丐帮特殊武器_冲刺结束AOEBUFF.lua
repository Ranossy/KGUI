---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/丐帮特殊武器_冲刺结束AOEBUFF.lua
-- 更新时间:	2016/10/11 0:33:27
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
		--	player.CastSkill(17025, 1)
		--player.DelBuff(9585, 1)

	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if scene then
		--	local anqingxu = scene.GetNpcByNickName("anqingxu")
		--	if anqingxu and anqingxu.bFightState == true then
		--		anqingxu.CastSkill(16592, 1)
		--		anqingxu.PlaySfx(1471, player.nX, player.nY, player.nZ + 150)
		--	end
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
			player.PlaySfx(63, player.nX, player.nY, player.nZ)
			player.PlaySfx(1492, player.nX, player.nY, player.nZ)
			player.CastSkill(17040, 1)
			player.DelGroupBuff(11416, 1)
			--player.DelBuff(9585, 1)

		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com