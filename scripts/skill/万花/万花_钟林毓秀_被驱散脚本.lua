---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_����ع��_����ɢ�ű�.lua
-- ����ʱ��:	2015/2/10 9:56:16
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_��������_����ɢ�ű�.lua
-- ������    :  �Ͻ�
-- ����ʱ��  :  2008-03-28
-- ��;(ģ��):  BUFF����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵ�BUFF�ű�
------------------------------------------------

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
	
	local Cast_plyer = GetPlayer(dwCasterID)
	local player = GetPlayer(dwSkillSrcID)

	--ж��������4��
	if nLeftFrame ~= 0 and player and target and player.GetScene().dwMapID == target.GetScene().dwMapID then
		target.AddBuff(player.dwID, player.nLevel, 9730, 1)
	end
	--[[
	if nLeftFrame ~= 0 and player and target and player.GetScene().dwMapID == target.GetScene().dwMapID and GetCharacterDistance(player.dwID, target.dwID) <= 64 * 40 then
		local nlev = player.GetSkillLevel(189)
		if nlev ~= 0 and Cast_plyer then
			if IsPlayer(target.dwID) then
				if player.bFightState == true then
					player.CastSkill(13741, nlev, TARGET.PLAYER, target.dwID)
				end
			else
				if player.bFightState == true then
					player.CastSkill(13741, nlev, TARGET.NPC, target.dwID)
				end
			end
		end
	end
	--]]
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID)
		if target and player and player.GetSkillLevel(6686) == 1 and nLeftFrame ~= 0 then
			--����ӳ�buff
			
			if Cast_plyer then
				if target.bFightState == true or Cast_plyer.bFightState == true then
					target.AddBuff(0, 99, 9174, 1)
				end
			else
				--if target.bFightState == true then
				--	target.AddBuff(0, 99, 9174, 1)
				--end
			end
		end
	end
end;
function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com