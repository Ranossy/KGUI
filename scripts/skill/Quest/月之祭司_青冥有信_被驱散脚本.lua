------------------------------------------------
-- �ļ���    :  ��ڤ���ű���ɢ�ű�.lua
-- ������    :  zhx
-- ����ʱ��  :  20110407
-- ��;(ģ��):  PQ
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ����ɢ������˺�
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local character;    
	if IsPlayer(nCharacterID) then
		character = GetPlayer(nCharacterID);
	else
		character = GetNpc(nCharacterID);
	end       
	if nLeftFrame == 0 then -- ����������ʣ��ʱ��Ϊ0
	else
		character.CastSkill(2923, 1)      -- ����������
	end
end;
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com