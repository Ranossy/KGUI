------------------------------------------------
-- 创建人   :  王洋	
-- 创建时间	:  2007-12-11
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Map/ACT_峰值活动/include/峰值活动.lua")
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end	
	local item = player.GetEquippedHorse()
	if not item then
		return 
	end
	if item then
		if item.dwIndex == 11106 then
			player.SetDynamicSkillGroup(151)
		elseif item.dwIndex == 11105 then
			player.SetDynamicSkillGroup(141)
		else
			player.SetDynamicSkillGroup(172)
		end
	end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local item = player.GetEquippedHorse()
	if not item then
		return 
	end	
	player.SetDynamicSkillGroup(0)
	player.DelBuff(7698, 1)
	player.DelBuff(7819, 1)
	--player.DelBuff(7712, 1)
	if player.GetBuff(7844, 1) then
		player.DelBuff(7844, 1)
		player.SetPosition(player.nX, player.nY, player.nZ + 2560)
	end
	if item and item.dwIndex == 11106 then
		Creat5(player)
	end
	if item.dwIndex == 11649 then
		if player.nMoveState == MOVE_STATE.ON_FLY_JUMP then
			player.EndFlyJump()
		end
	end	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com