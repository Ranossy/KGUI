function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1596)   --获得母技能 鹤归孤山 的等级
	--[[
	--龙池奇穴判定目标数量增加伤害
	if player.GetSkillLevel(5952) == 1 then
		player.DelGroupBuff(9710, 1)	--先删除下
		player.CastSkill(14615, 1)
		local nbuff_mark = player.GetBuff(9710, 1)
		if nbuff_mark then
			local nbuffcount = nbuff_mark.nStackNum
			--print("nbuffcount"..nbuffcount)
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 9711, nbuffcount)
			end
		end
	end
	--]]
	--释放AOE伤害
	player.CastSkill(1599,dwSkillLevel)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com