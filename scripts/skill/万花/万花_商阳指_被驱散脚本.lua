---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_����ָ_����ɢ�ű�.lua
-- ����ʱ��:	2015/7/3 15:39:58
-- �����û�:	mengxiangfei11
-- �ű�˵��:

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
			--����ӳ�buff
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


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com