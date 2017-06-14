---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/判定气场类型.lua
-- 更新时间:	2013/6/5 0:20:34
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	--引爆不同气场不同效果
	if player.GetSkillLevel(6747) == 1 then
		if npc.dwTemplateID == 4978 then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6296, 1, 1)
		end
		if npc.dwTemplateID == 3080 then
			if player.GetBuff(6293, 1) then
				player.AddBuff(dwSkillSrcID, player.nLevel, 6293, 2, 1)
			elseif player.GetBuff(6293, 2) then
				player.AddBuff(dwSkillSrcID, player.nLevel, 6293, 3, 1)
			else
				player.AddBuff(dwSkillSrcID, player.nLevel, 6293, 1, 1)
			end
		end
		if npc.dwTemplateID == 4979 then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6294, 1, 1)
		end
		if npc.dwTemplateID == 4977 then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6297, 1, 1)
		end
		if npc.dwTemplateID == 4976 then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6291, 1, 1)
		end
		if npc.dwTemplateID == 4980 then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6295, 1, 1)
		end
		if npc.dwTemplateID == 4981 then
			if player.GetBuff(6292, 1) then
				player.AddBuff(dwSkillSrcID, player.nLevel, 6292, 2, 1)
			elseif player.GetBuff(6292, 2) then
				player.AddBuff(dwSkillSrcID, player.nLevel, 6292, 3, 1)
			else
				player.AddBuff(dwSkillSrcID, player.nLevel, 6292, 1, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com