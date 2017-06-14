---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/帮会/额外掉落buff添加_新服福利.lua
-- 更新时间:	2013/12/5 10:57:59
-- 更新用户:	xueyan
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local tbuff = player.GetBuff(3219, 0)
	local cbuff = player.GetBuff(3220, 0)
	--local zbuff = player.GetBuff(3461, 8)
	local splayer = GetPlayer(dwSkillSrcID)
	local slevel = splayer.nLevel
	local sbuff = player.GetBuff(4907, 0)
	if not tbuff and not cbuff then
		player.AddBuff(dwSkillSrcID, slevel, 3220, 9)
	elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID) or tbuff then
		if sbuff and sbuff.nLevel ~= 5 then
			player.DelBuff(4907,sbuff.nLevel)
		end
		player.AddBuff(dwSkillSrcID, slevel, 4907, 5)
		
		if cbuff and cbuff.nLevel ~= 9 then
			player.DelBuff(3220, cbuff.nLevel)
			player.AddBuff(dwSkillSrcID, slevel, 3220, 9)
		end
		
		if tbuff and tbuff.nLevel ~= 9 then
			local nCount = tbuff.nLeftActiveCount
			player.DelBuff(3219, tbuff.nLevel)
			player.AddBuff(0, 99, 3219, 9, nCount)
		end
		
		--player.AddBuff(dwSkillSrcID, slevel, 4918, 4)
	end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com