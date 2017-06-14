---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/丐帮特殊武器_冲刺前buff.lua
-- 更新时间:	2016/10/11 23:24:09
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
		--local npc = player.GetSelectCharacter()
		local nType, nID = player.GetTarget()
		if nType == TARGET.NPC then
			local npc = GetNpc(nID)
			if npc then
				if not IsPlayer(npc.dwID) then
					player.TurnToCharacter(npc.dwID)
					--local nDis = GetCharacterDistance(player.dwID, npc.dwID)
					--print(nDis)
					--local tPos = CustomFunction.GetFrontNpcPosition(player.nX, player.nY, player.nFaceDirection, nDis - 150)
					player.CastSkillXYZ(17029, 1, npc.nX, npc.nY, npc.nZ)
					player.AddBuff(player.dwID, player.nLevel, 11397, 1)
					--player.DelBuff(9585, 1)
				end
			end
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com