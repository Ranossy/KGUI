---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_商阳指_被驱散脚本.lua
-- 更新时间:	2015/7/3 15:39:58
-- 更新用户:	mengxiangfei11
-- 脚本说明:

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local target
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID);
	else
		target = GetNpc(nCharacterID);
	end

	if not target then
		return
	end
	local player = GetPlayer(dwSkillSrcID)

	
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID)
		if target and player and player.GetSkillLevel(6686) == 1 and nLeftFrame ~= 0 then
			--添加延迟buff
			local Cast_plyer = GetPlayer(dwCasterID)
			if Cast_plyer then
				if target.bFightState == true or Cast_plyer.bFightState == true then
					target.AddBuff(0, 99, 9174, 1)
				end
			else
				--if target.bFightState == true then
					--target.AddBuff(0, 99, 9174, 1)
				--end
			end
		end
	end
end;
function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)

end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com