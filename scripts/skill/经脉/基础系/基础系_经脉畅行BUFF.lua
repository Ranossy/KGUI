------------------------------------------------
-- �ļ���    : �����������Խű�
-- ������    : zhangqi 
-- ����ʱ��  : 2009-07-16
-- ��;(ģ��): ����
-- ��������  : ����ϵ
-- ��������  : ��������BUFF
-- ����Ч��  : ��������BUFF
------------------------------------------------

------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local bResult = true;
	
	if IsPlayer(nCharacterID) then
		local player = GetPlayer(nCharacterID);
		
		if nLeftFrame > 0 then 
			player.CastSkill(1132, 1);
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QixueTeachBy.Close")
			local dwDiscipleID = nCustomValue
			if dwDiscipleID ~= 0 then 
				RemoteCallToClient(dwDiscipleID, "CallUIGlobalFunction", "QixueTeachBy.Close", true)
			end
		end
	end
	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com