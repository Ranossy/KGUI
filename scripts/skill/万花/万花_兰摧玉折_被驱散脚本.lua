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
    local character;
        
    if IsPlayer(nCharacterID) then
        character = GetPlayer(nCharacterID);
    else
        character = GetNpc(nCharacterID);
    end

	local Cast_plyer
	if IsPlayer(dwCasterID) then
		Cast_plyer = GetPlayer(dwCasterID)
	else
		Cast_plyer = GetNpc(dwCasterID)
	end

	
	if nLeftFrame ~= 0 and Cast_plyer then -- ����������ʣ��ʱ��Ϊ0
		--print(1111111)
		if IsPlayer(nCharacterID) then
			--print(2222)
			local result = character.AddBuff(0, 99, 3051, 1)      -- ����������
		else
			--print(3333)
			if character.GetEmployer() then
				--print(4444)
				character.GetEmployer().AddBuff(0, 99, 3051, 1)      -- ����������
			else
				--print(555)
				character.AddBuff(0, 99, 3051, 1)      -- ����������
			end
		end
    end

	local player = GetPlayer(dwSkillSrcID)
	
	
	if IsPlayer(nCharacterID) then
		character = GetPlayer(nCharacterID)
		if character and player and player.GetSkillLevel(6686) == 1 and nLeftFrame ~= 0 then
			--����ӳ�buff
			
			if Cast_plyer then
				if character.bFightState == true or Cast_plyer.bFightState == true then
					character.AddBuff(0, 99, 9174, 1)
				end
			else
				--if character.bFightState == true then
				--	character.AddBuff(0, 99, 9174, 1)
				--end
			end
		end
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com