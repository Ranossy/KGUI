---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/苍云特殊武器_武器中寻首击山倒计时buffremove.lua
-- 更新时间:	2016/6/8 17:12:31
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if player then
		if not player.GetBuff(11185, 1) then
			if player.nMoveState ~= MOVE_STATE.ON_DEATH then
				player.DoAction(0, 60124)
			end
			player.DelBuff(8576, 1)
			player.DelBuff(10821, 1)
			player.DelBuff(10823, 1)
			player.DelBuff(10824, 1)
			player.DelBuff(10825, 1)
			player.SetDynamicSkillGroup(0)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com