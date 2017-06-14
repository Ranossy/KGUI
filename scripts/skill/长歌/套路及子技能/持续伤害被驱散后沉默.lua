---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/持续伤害被驱散后沉默.lua
-- 更新时间:	2015/8/5 23:00:36
-- 更新用户:	mengxiangfei11
-- 脚本说明:
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(dwSkillSrcID)		--buff释放者
	local Cast_player
	if IsPlayer(dwCasterID) then
		Cast_player = GetPlayer(dwCasterID)
	else
		Cast_player = GetNpc(dwCasterID)
	end
	
	local target								--buff作用者
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID)
	else
		target = GetNpc(nCharacterID)
	end
	
	if player and Cast_player and target and player.GetSkillLevel(14313) == 1 and nLeftFrame ~= 0 then
		if player.bFightState == true or Cast_player.bFightState == true or target.bFightState == true then
			--print(111)
			--给buff驱散者添加延迟buff
			if IsPlayer(dwCasterID) then
				--print(11111111111111111111)
				Cast_player.AddBuff(0, 99, 9379, 1)
			else
				--print(222)
				--print(222222222222222222222)
				if Cast_player.GetEmployer() then
					--print(333333)
					--print(333333333333333333)
					Cast_player.GetEmployer().AddBuff(0, 99, 9379, 1)
				else
					--print(4444444444444)
					Cast_player.AddBuff(0, 99, 9379, 1)
				end
			end
		end
	end

	--删除角hot的回蓝标记buff
	if BuffID == 9463 or BuffID == 9464 or BuffID == 9465 or BuffID == 9466 then
		local nBuff_mark = target.GetBuffByOwner(9512, 1, dwSkillSrcID)
		if nBuff_mark then
			target.DelBuffByIndex(nBuff_mark.nIndex)
		end
	end

	--删除角dot的回蓝标记buff
	if BuffID == 9361 or BuffID == 9362 or BuffID == 9363 or BuffID == 9364 then
		local nBuff_mark = target.GetBuffByOwner(9513, 1, dwSkillSrcID)
		if nBuff_mark then
			target.DelBuffByIndex(nBuff_mark.nIndex)
		end
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com