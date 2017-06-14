---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/水枪每跳动作监控.lua
-- 更新时间:	2015/7/1 2:04:49
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)--每跳一次
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.dwBackItemIndex ~= 13905 and player.dwBackItemIndex ~= 13906 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.DelBuff(9163, 1)
		player.DelBuff(9165, 1)
		player.DelBuff(9164, 1)
		player.DelBuff(9166, 1)
		player.SetDynamicSkillGroup(0)
		player.SetTimer(1 * 16 ,"scripts/skill/装备/挂件相关/水枪每跳动作监控.lua", 0, 0)
		return
	end
	
	if player.dwBackItemIndex == 13905 then
		local buff = player.GetBuff(9163, 1)
		if not buff then
			player.AddBuff(0, 99, 9163, 1)
		end
		local buff1 = player.GetBuff(9165, 1)
		if not buff1 then
			player.AddBuff(0, 99, 9165, 1)
		end
	else
		player.DelBuff(9163, 1)
		player.DelBuff(9165, 1)
	end
	
	if player.dwBackItemIndex == 13906 then
		local buff = player.GetBuff(9164, 1)
		if not buff then
			player.AddBuff(0, 99, 9164, 1)
		end
		local buff1 = player.GetBuff(9166, 1)
		if not buff1 then
			player.AddBuff(0, 99, 9166, 1)
		end
	else
		player.DelBuff(9164, 1)
		player.DelBuff(9166, 1)
	end
	
	if player.GetDynamicSkillGroup() == 0 then
		player.SetDynamicSkillGroup(199)
	end
end


function UnApply(dwCharacterID)
	--无效
end

function OnTimer(player, nParam1, nParam2)
	player.DelBuff(9153, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com