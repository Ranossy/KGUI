function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local tbuff = player.GetBuff(3219,4)
	local cbuff = player.GetBuff(3220,4)
	local zbuff = player.GetBuff(3461,4)
	local splayer = GetPlayer(dwSkillSrcID)
	local slevel = splayer.nLevel
	local sbuff = player.GetBuff(4907,1)
	if not tbuff and not cbuff and not zbuff then
		player.AddBuff(dwSkillSrcID,slevel,3220,4)
	elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID)  or tbuff then
		player.AddBuff(dwSkillSrcID,slevel,4907,1)
		player.AddBuff(dwSkillSrcID,slevel,4918,1)
	end
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com